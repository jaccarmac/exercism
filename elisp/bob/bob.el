;;; bob.el --- Bob exercise (exercism)

;;; Commentary: Bob responds to various sentences.

;;; Code:
(eval-when-compile (require 'subr-x))

(defun response-for (sentence)
  (let ((sentence (string-trim sentence)))
    (cond ((bob--saying-nothing-p sentence) "Fine. Be that way!")
          ((and (bob--yellingp sentence) (bob--askingp sentence))
           "Calm down, I know what I'm doing!")
          ((bob--yellingp sentence) "Whoa, chill out!")
          ((bob--askingp sentence) "Sure.")
          (t "Whatever."))))

(defun bob--saying-nothing-p (sentence)
  (= (length sentence) 0))

(defun bob--yellingp (sentence)
  (and (string-match-p "[[:alpha:]]" sentence)
       (string-equal sentence (upcase sentence))))

(defun bob--askingp (sentence)
  (string-suffix-p "?" sentence))

(provide 'bob)
;;; bob.el ends here
