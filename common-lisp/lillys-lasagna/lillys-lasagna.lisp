(defpackage :lillys-lasagna
  (:use :cl)
  (:export :expected-time-in-oven
           :remaining-minutes-in-oven
           :preparation-time-in-minutes
           :elapsed-time-in-minutes))

(in-package :lillys-lasagna)

(defun expected-time-in-oven ()
  "The time a lasagna takes to cook according to Lisp Alien tradition."
  337)

(defun remaining-minutes-in-oven (minutes-in-oven)
  "The estimated number of minutes remaining after the lasagna has been in the oven for a while."
  (- (expected-time-in-oven) minutes-in-oven))

(defun preparation-time-in-minutes (layers)
  "The time to prepare of a lasagna of a given number of layers, given each layer takes 19 minutes to prepare."
  (* layers 19))

(defun elapsed-time-in-minutes (layers minutes-in-oven)
  "The total time since a lasagna of a given number of layers was started."
  (+ (preparation-time-in-minutes layers) minutes-in-oven))
