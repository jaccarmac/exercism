(in-package #:cl-user)
(defpackage #:beer
  (:use #:common-lisp)
  (:export #:verse #:sing))

(in-package #:beer)

(defun verse (bottles)
  (let ((bottles-format "~[no more~:;~:*~a~] bottle~:p of beer")
        (take-one-format "~[Go to the store and buy some more~:;~
                            Take ~:*~[~;it~:;one~] down and pass it around~]"))
    (format nil "~@(~@?~) on the wall, ~2:*~@?.~%~
                 ~@?, ~@? on the wall.~%"
            bottles-format bottles
            take-one-format bottles
            bottles-format (mod (1- bottles) 100))))

(defun sing (from &optional (to 0))
  (format nil "~{~a~%~}"
          (loop for i from from downto to
             collect (verse i))))
