(in-package #:cl-user)
(defpackage #:anagram
  (:use #:common-lisp)
  (:export #:anagrams-for))

(in-package #:anagram)

(defun anagrams-for (word corpus)
  (loop for cword in corpus
     when (let ((cword (string-downcase cword))
                (word (string-downcase word)))
            (and (not (string= cword word))
                 (equal (sort cword #'char-lessp) (sort word #'char-lessp))))
     collect cword))
