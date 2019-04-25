(in-package #:cl-user)
(defpackage #:phrase
  (:use #:cl)
  (:export #:word-count))
(in-package #:phrase)

(defun words-in (phrase)
  (loop for letter across phrase
     with word = ""
     for word-ready-p = (not (zerop (length word)))
     if (not (alphanumericp letter))
       when word-ready-p
       collect word into words
       and do (setf word "")
       end
     else do (setf word (concatenate 'string word (list (char-downcase letter))))
     finally (return (if word-ready-p (cons word words) words))))

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
