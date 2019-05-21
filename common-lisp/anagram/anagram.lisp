(in-package #:cl-user)
(defpackage #:anagram
  (:use #:common-lisp)
  (:export #:anagrams-for))

(in-package #:anagram)

(defun anagrams-for (word corpus)
  (loop for cword in corpus
     when (let ((cword (coerce (string-downcase cword) 'list))
                (word (coerce (string-downcase word) 'list)))
            (and (not (equal cword word))
                 (equal (sort cword #'char-lessp) (sort word #'char-lessp))))
     collect cword))
