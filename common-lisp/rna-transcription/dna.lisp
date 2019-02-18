(in-package #:cl-user)
(defpackage #:dna
  (:use #:cl)
  (:export #:to-rna))
(in-package #:dna)

(defun to-rna (str)
  "Transcribe a string representing DNA nucleotides to RNA."
  (format nil "~{~a~}"
          (loop for nucleotide across str
             collect (case nucleotide
                       (#\C #\G)
                       (#\G #\C)
                       (#\A #\U)
                       (#\T #\A)
                       (otherwise (error "~A is not a valid nucleotide" nucleotide))))))
