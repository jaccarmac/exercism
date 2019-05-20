(in-package #:cl-user)
(defpackage #:anagram
  (:use #:common-lisp)
  (:export #:anagrams-for))

(in-package #:anagram)

(defun anagram-p (word1 word2)
  )

(defun anagrams-for (word corpus)
  (let ((word (string-downcase word))
        (corpus (mapc #'string-downcase corpus)))
    (loop for cword in corpus
       when (and (not (string= cword word))
                 (anagram-p word cword))
       collect cword)))
