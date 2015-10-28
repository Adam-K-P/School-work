(define (grep pred alist)
  (if (null? alist) '()
      (if (pred (car alist)) cons (car alist) (grep pred (cdr alist))
                                              (grep pred (cdr alist)))))

(define (positives alist) 
  (grep (lambda (x) (> x 0)) alist))

(define (sum alist) 
  (define (sum alist val)
    (if (null? alist) val (sum (cdr alist) (+ (val (car alist))))))
  (sum alist 0))

(define (sum alist) (foldleft 0 (lambda (a b) (+ a b)) list))
(define (sum alist) (foldleft 0 + list))

(define (zip fcn pair)
  (define (zipper list1 list2)
    (if (or (null? list1) (null? list2)) '() 
        (cons (fcn (car list1) (car list2)) 
              (zipper thelist (cdr list1) (cdr list2))))))

(define (merge list1 list2) 
  (if (null? list1) list2
    (if (null? list2) list1
      (if (car list1) < (car list2) 
        (cons (car list1) (merge (cdr list1) list2))
        (if (car list2) < (car list1) 
          (cons (car list2) (merge (cdr list2) list1))
          (cons (car list1) (cons (car list2) (merge (cdr list1) (cdr list2))))
           )))))

(define (product alist)
  (if (null? alist) 0
    (if (null? (cdr alist)) (car alist)
      (* (car alist) (product (cdr alist))) )))

(define (foldl fn unit alist)
  (if (null? alist) unit
    (foldl fn (fn unit (car alist)) (cdr alist))))

(define (product alist) (foldl * 1 alist))

(define (length alist)
  (define (ad n _) (+ n 1))
  (foldl ad 0 list))

(define (rev alist)
  (if (null? alist) '()
    (cons (rev (cdr alist)) (car alist))))

(define (take alist num)
  (define (taker alist num)
    (if (= num 0) '()
      (cons (car alist) (taker (cdr alist) (- num 1)))))
  (if (< (length alist) num) alist (taker alist num)))





  
