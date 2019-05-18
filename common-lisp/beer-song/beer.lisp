(in-package #:cl-user)
(defpackage #:beer
  (:use #:common-lisp)
  (:export #:verse #:sing))

(in-package #:beer)

(defun verse (bottles)
  (let ((bottles (case bottles
                   (0 "No more bottles")
                   (1 "1 bottle")
                   (t (format nil "~a bottles" bottles))))
        (second-bottles (case bottles
                          (0 "no more bottles")
                          (1 "1 bottle")
                          (t (format nil "~a bottles" bottles))))
        (second-line (case bottles
                       (0 "Go to the store and buy some more")
                       (1 "Take it down and pass it around")
                       (t "Take one down and pass it around")))
        (next-bottles (case bottles
                        (0 "99 bottles")
                        (1 "no more bottles")
                        (2 "1 bottle")
                        (t (format nil "~a bottles" (1- bottles))))))
    (format nil
            "~a of beer on the wall, ~a of beer.~%~
             ~a, ~a of beer on the wall.~%"
            bottles second-bottles second-line next-bottles)))

(defun sing (from &optional (to 0))
  (format nil "~{~a~%~}"
          (loop for i from from downto to
             collect (verse i))))
