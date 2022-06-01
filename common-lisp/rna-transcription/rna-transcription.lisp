(defpackage :rna-transcription
  (:use :cl)
  (:export :to-rna))
(in-package :rna-transcription)

(defparameter *dna-to-rna-nucleotides*
  '((#\C . #\G)
    (#\G . #\C)
    (#\A . #\U)
    (#\T . #\A))
  "Alist of nucleotide translations, DNA first.")

(defun to-rna (str)
  "Transcribe a string representing DNA nucleotides to RNA."
  (coerce (loop for nucleotide across str
             if (cdr (assoc nucleotide *dna-to-rna-nucleotides*)) collect it
             else do (error "~A is not a valid nucleotide" nucleotide))
          'string))
