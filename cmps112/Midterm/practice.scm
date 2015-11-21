(define (merge l1 l2)
  (cond ((null? l1) l2)
        ((null? l2) l1)
        (else (let ((a1 (car l1))
                    (a2 (car l2)))
                (if (< a1 a2)
                  (cons a1 (merge (cdr l1) l2))
                  (cons a2 (merge l1 (cdr l2))) )))))

(define (product alist)
  (define (prod alist p)
    (if (null? alist) p
       (prod (cdr alist) (* (car alist) p))))
  (prod alist 1))

(define (foldl fn unit alist)
  (if (null? alist) unit
    (foldl fn (fn unit (car alist)) (cdr alist))))

(define (product alist) (foldl * 1 list))

(define (ad n _) ( + n 1))
(define (len alist) (foldleft ad 0 alist))

(define (reverse alist)
  (if (null? alist) alist
      (cons (reverse (cdr alist)) (car alist))))
      
(define (take n alist)
  (if (<= n 0) '()
      (cons (car alist) (take (- n 1) (cdr alist))) ))

(define (map fun alist)
  (if (null? alist) '()
      (cons (fun (car alist)) (map fun (cdr alist))) ))

(define (filter fun alist)
  (if (null? alist) '()
      (if (fun (car alist)) 
        (cons (car alist) (filter fun (cdr alist)))
        (filter fun (cdr alist)) )))

(define (range x y)
   (if (> x y) '()
     (cons x (range (+ x 1) y))))

(define (pairthem l1 l2)
  (if (or (null? l1) (null? l2)) '()
      (cons (cons (car l1) (car l2)) (pairthem (cdr l1) (cdr l2))) ))

(define (maxzip l1 l2)
  (if (or (null? l1) (null? l2)) '()
      (if (> (car l1) (car l2)) 
        (cons (car l1) (maxzip (cdr l1) (cdr l2)))
        (cons (car l2) (maxzip (cdr l1) (cdr l2))) )))

(define (exclude c l)
  (if (or (<= c 0) (null? l)) l
      (exclude (- c 1) (cdr l)) ))








      
