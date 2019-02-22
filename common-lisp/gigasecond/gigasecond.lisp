(in-package #:cl-user)
(defpackage #:gigasecond
  (:use #:cl)
  (:export #:from))
(in-package #:gigasecond)

(defun from (year month day hour minute second)
  (multiple-value-bind
	(second minute hour day month year)
      (decode-universal-time
       (+ 1000000000
          (encode-universal-time second minute hour day month year 0)) 0)
    (list year month day hour minute second)))
