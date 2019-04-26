(in-package #:cl-user)
(defpackage #:phrase
  (:use #:cl)
  (:export #:word-count))
(in-package #:phrase)

(defun words-in (phrase)
  (loop for beg = (position-if #'alphanumericp phrase)
     then (position-if #'alphanumericp phrase :start (1+ end))
     for end = (and beg (position-if-not #'alphanumericp phrase :start beg))
     when beg collect (string-downcase (subseq phrase beg end))
     while end))

(defun inc-word-counts (counts word)
  (let ((new-count (1+ (or (cdr (assoc word counts :test #'string=)) 0))))
    (acons word new-count counts)))

(defun add-count-if-not-present (counts count)
  (if (assoc (car count) counts :test #'string=)
      counts
      (cons count counts)))

(defun word-count (phrase)
  (reduce #'add-count-if-not-present
          (reduce #'inc-word-counts (words-in phrase) :initial-value nil)
          :initial-value nil))
