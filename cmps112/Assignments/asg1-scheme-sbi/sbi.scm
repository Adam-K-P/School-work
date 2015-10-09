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

(define *stderr* (current-error-port))

(define function-table (make-hash))
(define label-table (make-hash))
(define variable-table (make-hash))
(hash-set! variable-table "pi" 3.141592653589793238462643383279502884197169399)
(hash-set! variable-table "e"  2.718281828459045235360287471352662497757247093)

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

(define (dump-hash-table hash-table)
    (hash-for-each hash-table (lambda (key value)
        (display key) (newline) (display value) (newline))))

(define (fill-label-table program)
    (map (lambda (line) 
         (when (and (not (null? (cdr line))) (not (list? (cadr line))))
               (hash-set! label-table (cadr line) line))
         line) program))

(define (fill-function-table program)
    (for-each
        (lambda (function) (hash-set! function-table (car function) 
                                                     (cadr function)))
        `( (+ ,(lambda (x y) (+ x y)))
           (- ,(lambda (x y) (- x y)))
           (/ ,(lambda (x y) (/ x (+ y 0.0)))) ;ensure it's a real number
           (* ,(lambda (x y) (* x y)))
           (% ,(lambda (x y) (% x y)))
           (^ ,(lambda (x y) (^ x y))) 
           (print ,(lambda (item) (display item)))
           )))

(define (interpret program) `())

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
               (write-program-by-line sbprogfile program)
               (fill-label-table program)
               (dump-hash-table label-table)
               (interpret program))))

(main (vector->list (current-command-line-arguments)))
