(in-package #:cl-user)
(defpackage #:bob
  (:use #:cl)
  (:export #:response-for))
(in-package #:bob)

(defun response-for (input)
  (let ((input (string-trim
                '(#\Space #\Newline #\Backspace #\Tab
                  #\Linefeed #\Page #\Return #\Rubout)
                input)))
    (cond ((and (askingp input) (yellingp input))
           "Calm down, I know what I'm doing!")
          ((askingp input) "Sure.")
          ((yellingp input) "Whoa, chill out!")
          ((saying-nothing-p input) "Fine. Be that way!")
          (t "Whatever."))))

(defun askingp (input)
  (let ((length (length input)))
    (unless (zerop length)
      (char= #\? (char input (1- length))))))

(defun yellingp (input)
  (and (find-if #'alpha-char-p input)
       (string= input (string-upcase input))))

(defun saying-nothing-p (input)
  (string= "" input))
