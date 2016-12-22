(defpackage #:hamming
  (:use #:cl)
  (:export #:distance))

(in-package #:hamming)

(defun distance (dna1 dna2)
  "Number of positional differences in two equal length dna strands."
  (when (= (length dna1) (length dna2))
    (reduce (lambda (diffs pair)
              (if (eq (car pair) (cdr pair)) diffs (1+ diffs)))
            (map 'list #'cons dna1 dna2)
            :initial-value 0)))
