(in-package #:cl-user)
(defpackage #:beer
  (:use #:common-lisp)
  (:export #:verse #:sing))

(in-package #:beer)

(defun verse (bottles)
  (let* ((bottles-format "~[no more~:;~:*~a~] bottle~:p of beer")
         (current-bottles (format nil bottles-format bottles))
         (take-one (format nil "~[Go to the store and buy some more~:;~
                                  Take ~:[one~;it~] down and pass it around~]"
                           bottles (= bottles 1)))
         (next-bottles (format nil bottles-format (mod (1- bottles) 100))))
    (format nil "~@(~a~) on the wall, ~:*~a.~%~
                 ~a, ~a on the wall.~%"
            current-bottles take-one next-bottles)))

(defun sing (from &optional (to 0))
  (format nil "~{~a~%~}"
          (loop for i from from downto to
             collect (verse i))))
