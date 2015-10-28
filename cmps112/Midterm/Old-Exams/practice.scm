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
