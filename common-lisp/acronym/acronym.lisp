(in-package #:cl-user)
(defpackage #:acronym
  (:use #:common-lisp)
  (:export #:acronym))

(in-package #:acronym)

(defun acronym (phrase)
  (coerce (loop for letter across phrase
             with add-to-acronym = t
             if (and add-to-acronym (both-case-p letter))
               collect (char-upcase letter)
               and do (setf add-to-acronym nil)
             if (and (not add-to-acronym)
                     (or (char= letter #\ ) (char= letter #\-)))
               do (setf add-to-acronym t))
          'string))
