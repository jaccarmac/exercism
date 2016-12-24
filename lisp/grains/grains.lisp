(in-package #:cl-user)
(defpackage #:grains
  (:use #:cl)
  (:export :square :total))
(in-package #:grains)

(defun square (n)
  (if (= 1 n)
      1
      (* 2 (square (1- n)))))

(defun total ()
  (loop for i from 1 to 64 sum (square i)))
