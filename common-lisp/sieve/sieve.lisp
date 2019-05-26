(defpackage #:sieve
  (:use #:cl)
  (:export #:primes-to)
  (:documentation "Generates a list of primes up to a given limit."))

(in-package #:sieve)

(defun primes-to (max)
  (let ((unmarked (loop for n from 2 to max collect n))
        (primes ()))
    (loop while unmarked
       do (let* ((num (car unmarked))
                 (multiple num))
            (setf primes (nconc primes (list num)))
            (loop while (<= multiple max)
               do (progn
                    (setf unmarked (remove multiple unmarked))
                    (setf multiple (+ multiple num))))))
    primes))
