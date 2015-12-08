(define (take n list)
  (if (or (null? list) (<= n 0)) '() 
    (cons (car list) (take (cdr list)))) )

(define (map f alist) 
  (if (null? alist) '()
    (cons (f (car alist)) (map f (cdr alist)))))

(define (filter p alist)
  (if (null? alist) '()
    (if (p (car alist))
      (cons (car alist) (filter (cdr alist)))
      (filter (cdr alist)) )))

(define (range x y) 
  (if (> x y) '()
    (cons x (range (+ x 1) y))))

