#!/usr/bin/mzscheme -qr
;#!/afs/cats.ucsc.edu/courses/cmps112-wm/usr/racket/bin/mzscheme -qr
;; Adam Pinarbasi
;; akpinarb
;; 1356887
;; NAME
;;    sbi.scm - silly basic interpreter
;;
;; SYNOPSIS
;;    sbi.scm filename.sbir
;;
;; DESCRIPTION
;;    The file mentioned in argv[1] is read and assumed to be an
;;    SBIR program, which is the executed.  Currently it is only
;;    printed.
;;

;;remember to delete CDPATH from .bashrc !!!

(define *stderr* (current-error-port))

(define label-table (make-hash))
(define variable-table (make-hash))
(hash-set! variable-table "pi" 3.141592653589793238462643383279502884197169399)
(hash-set! variable-table "e"  2.718281828459045235360287471352662497757247093)

(define (perform-goto program label)
    (display "hello, world!") (newline)
)
    

;;returns x if it is a number and the variable value if it's a variable
(define (get-val x)
    (display x) (newline)
    (cond
        ((number? x) x)
        ((symbol? x) 
         (hash-ref variable-table x bad-input))
        (else (interpret-line x)) )) 

(define (let-function var value)
    (unless (symbol? var) (bad-input)) 
    (cond
        ((number? value) (hash-set! variable-table var value)) 
        ((symbol? value) 
         (hash-set! variable-table var 
                         (hash-ref variable-table value bad-input)))
        (else (hash-set! variable-table var (interpret-line value))) )) 


(define function-table (make-hash))
(for-each
    (lambda (function) (hash-set! function-table (car function) 
                                                 (cadr function)))
    `( (+ ,(lambda (x y) (+ (get-val x) (get-val y))))
       (- ,(lambda (x y) (- (get-val x) (get-val y)))) 
       (/ ,(lambda (x y) (/ (get-val x) (+ (get-val y) 0.0))))
       (* ,(lambda (x y) (* (get-val x) (get-val y))))
       ;(dim ,(lambda (item) (display item) (newline))) 
       (goto ,(lambda (label) (perform-goto label)))
       ;(if ,(lambda (test then) (display test) (newline)))
       ;(input ,(lambda (item) (display item) (newline)))
       (let ,(lambda (var value) (let-function var value))) ;calling dreaded from 3rd level
       ;(print ,(lambda out (display out) (newline))) ))
       ))

(define *run-file*
    (let-values
        (((dirpath basepath root?)
            (split-path (find-system-path 'run-file))))
        (path->string basepath))
)

(define (die list)
    (for-each (lambda (item) (display item *stderr*)) list)
    (newline *stderr*)
    (exit 1)
)

(define (usage-exit)
    (die `("Usage: " ,*run-file* " filename"))
)

(define (bad-input)
    (die `("Improper input detected ",*run-file* " filename"))
)

(define (dump-hash-table hash-table)
    (hash-for-each hash-table (lambda (key value)
        (display key) (display ": ") (display value) (newline))))

(define (fill-label-table program)
    (for-each (lambda (line) 
        (when (and (not (null? (cdr line))) (not (list? (cadr line))))
               (hash-set! label-table (cadr line) line))
         line) program))

;have to tail recursively call interpret-line here
(define (interpret-line line)  
     (display line) (newline)
     (when (or (null? line) (null? (cdr line))) (bad-input))
     (unless (list? line) (bad-input))
     (when (hash-ref function-table (car line) #f)
           ;(display line) (newline)
           (if (null? (cdr line)) (bad-input) 
               (apply (hash-ref function-table (car line)) (cdr line)) )))
     ;(apply (hash-ref function-table (car line) (bad-input)) (cdr line)) )

;two special cases in beginning
;check if num
;check if label
;need to check if it is in a label-table function-table or variable-table
(define (interpret program) 
    (for-each (lambda (line)
        (when (not (number? (car line))) bad-input)
        (unless (null? (cdr line))
            (if (not (hash-ref label-table (cadr line) #f)) ;label not found
                (interpret-line (cadr line))
                (when (not (null? (cddr line)))
                    (interpret-line (caddr line))))) 
     line) program))

(define (readlist-from-inputfile filename)
    (let ((inputfile (open-input-file filename)))
        (if (not (input-port? inputfile))
            (die `(,*run-file* ": " ,filename ": open failed"))
            (let* ((program (read inputfile)))
                  (close-input-port inputfile)
                         program))))

(define (write-program-by-line filename program)
    (printf "==================================================~n")
    (printf "~a: ~s~n" *run-file* filename)
    (printf "==================================================~n")
    (printf "(~n")
    (map (lambda (line) (printf "~s~n" line)) program)
    (printf ")~n"))

(define (main arglist)
    (if (or (null? arglist) (not (null? (cdr arglist))))
        (usage-exit)
        (let* ((sbprogfile (car arglist))
               (program (readlist-from-inputfile sbprogfile)))
               ;(write-program-by-line sbprogfile program)
               (fill-label-table program)
               ;(dump-hash-table label-table)
               (interpret program) 
               (dump-hash-table variable-table))))

(main (vector->list (current-command-line-arguments)))
