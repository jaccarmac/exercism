(in-package #:cl-user)
(defpackage #:bob
  (:use #:cl)
  (:export #:response))
(in-package #:bob)

(defun response (input)
  (let ((input (string-trim
                '(#\Space #\Newline #\Backspace #\Tab
                  #\Linefeed #\Page #\Return #\Rubout)
                input)))
    (cond ((saying-nothing-p input) "Fine. Be that way!")
          ((and (askingp input) (yellingp input))
           "Calm down, I know what I'm doing!")
          ((askingp input) "Sure.")
          ((yellingp input) "Whoa, chill out!")
          
          (t "Whatever."))))

(defun askingp (input)
  (char= #\? (char input (1- (length input)))))

(defun yellingp (input)
  (and (find-if #'alpha-char-p input)
       (string= input (string-upcase input))))

(defun saying-nothing-p (input)
  (string= "" input))
