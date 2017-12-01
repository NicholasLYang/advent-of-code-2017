#lang racket

(define (sum-repeats vals original-values compare-index)
  (if (> (length vals) 0)
      (let ([firstVal (car vals)])
        (if (char=? firstVal (list-ref original-values compare-index))
            (+ (numerical-char->integer firstVal)
               (sum-repeats
                (cdr vals)
                original-values
                (increment-index compare-index (length original-values))
                )
               )
            (sum-repeats
             (cdr vals)
             original-values
             (increment-index compare-index (length original-values))
             )
            )
        )          
      0
      )
  )


(define (increment-index index listLen)
  (modulo (+ index 1) listLen)
  ) 

(define (numerical-char->integer char)
  (let ([num (- (char->integer char) 48)]) ; 48 = (char->integer #\0)
    (if
     (or (< num 0) (> num 9))
     (raise 'non-numerical-char #t)
     num)))

(define (main input)
  (let ([input-list (string->list input)])
    (sum-repeats input-list input-list (quotient (length input-list) 2))
    )
  )

