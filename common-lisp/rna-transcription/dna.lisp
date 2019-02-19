(in-package #:cl-user)
(defpackage #:dna
  (:use #:cl)
  (:export #:to-rna))
(in-package #:dna)

(defun to-rna (str)
  "Transcribe a string representing DNA nucleotides to RNA."
  (coerce (loop for nucleotide across str
             collect (ecase nucleotide
                       (#\C #\G)
                       (#\G #\C)
                       (#\A #\U)
                       (#\T #\A)))
          'string))
