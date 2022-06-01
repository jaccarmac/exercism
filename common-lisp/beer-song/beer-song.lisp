(defpackage :beer-song
  (:use :cl)
  (:export :verse :sing))

(in-package :beer-song)
(defun verse (n)
  "Returns a string verse for a given number."
  (let ((bottles-format "~[no more~:;~:*~a~] bottle~:p of beer")
        (take-one-format "~[Go to the store and buy some more~:;~
                            Take ~:*~[~;it~:;one~] down and pass it around~]"))
    (format nil "~@(~@?~) on the wall, ~2:*~@?.~%~
                 ~@?, ~@? on the wall.~%"
            bottles-format n
            take-one-format n
            bottles-format (mod (1- n) 100))))

(defun sing (start &optional (end 0))
  "Returns a string of verses for a given range of numbers."
  (format nil "~{~a~%~}"
          (loop for i from start downto end
             collect (verse i))))
