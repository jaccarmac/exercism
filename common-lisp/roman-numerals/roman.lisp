(defpackage #:roman
  (:use #:cl)
  (:export #:romanize))

(in-package #:roman)

(defun romanize (num)
  (format nil "~@r" num))
