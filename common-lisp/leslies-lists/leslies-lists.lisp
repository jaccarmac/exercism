(defpackage :leslies-lists
  (:use :cl)
  (:export :new-list
           :list-of-things
           :add-to-list
           :first-thing
           :second-thing
           :third-thing
           :twenty-third-thing
           :remove-first-item
           :on-the-list-p
           :list-append
           :just-how-long
           :part-of-list
           :list-reverse))

(in-package :leslies-lists)

(defun new-list ())

(setf (symbol-function 'list-of-things) #'list)

(setf (symbol-function 'add-to-list) #'cons)

(setf (symbol-function 'first-thing) #'car)

(setf (symbol-function 'second-thing) #'cadr)

(setf (symbol-function 'third-thing) #'caddr)

(defun twenty-third-thing (list)
  (nth 22 list))

(setf (symbol-function 'remove-first-item) #'cdr)

(setf (symbol-function 'list-append) #'append)

(setf (symbol-function 'just-how-long) #'length)
