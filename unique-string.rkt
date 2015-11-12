#lang racket

;; determine if a string has all unique characters

(define string-unique?
  (lambda (str)
    (letrec ((char-match? (lambda (c s)
                             (cond
                               ((null? s) #t)
                               ((eq? (string-length s) 0) #t)
                               ((eq? c (string-ref s 0)) #f)
                               (else
                                (char-match? c (substring s 1))))))
             (unique? (lambda (s)
                        (cond
                          ((eq? (string-length s) 1) #t)
                          ((eq? (string-length s) 0) #t)
                          ((char-match? (string-ref s 0) (substring s 1))
                           (unique? (substring s 1)))
                          (else
                           #f)))))
      (unique? str))))

