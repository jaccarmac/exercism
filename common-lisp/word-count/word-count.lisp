(in-package #:cl-user)
(defpackage #:phrase
  (:use #:cl)
  (:export #:word-count))
(in-package #:phrase)

(defun inc-word-count (words word)
  (let ((new-words (remove word words :key #'car :test #'string=))
        (new-count (1+ (or (cdr (assoc word words :test #'string=)) 0))))
    (acons word new-count new-words)))

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

(defun word-count (phrase)
  (reduce #'inc-word-count (words-in phrase) :initial-value nil))
