(defpackage :leap
  (:use :cl)
  (:export :leap-year-p))
(in-package :leap)

(defun leap-year-p (year)
  (flet ((year-div-by (div) (zerop (mod year div))))
    (or (and (year-div-by 4) (not (year-div-by 100)))
        (year-div-by 400))))
