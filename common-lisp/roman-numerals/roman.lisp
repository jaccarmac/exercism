(defpackage #:roman
  (:use #:cl)
  (:export #:romanize))

(in-package #:roman)

(defun roman-power-up (roman)
  (map 'string
       (lambda (digit) (ccase digit (#\I #\X)
                                    (#\V #\L)
                                    (#\X #\C)
                                    (#\L #\D)
                                    (#\C #\M)))
       roman))

(defun romanize (num)
  (case num (0 "")
            (1 "I")
            (2 "II")
            (3 "III")
            (4 "IV")
            (5 "V")
            (6 "VI")
            (7 "VII")
            (8 "VIII")
            (9 "IX")
            (t (concatenate 'string
                            (roman-power-up (romanize (floor num 10)))
                            (romanize (mod num 10))))))
