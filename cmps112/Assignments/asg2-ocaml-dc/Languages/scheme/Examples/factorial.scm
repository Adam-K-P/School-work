(define (fac n)
   (if (<= n 0) 1
       (* n (fac (- n 1)))))
;; $Id: factorial.scm,v 1.1 2015-09-28 14:03:38-07 - - $
