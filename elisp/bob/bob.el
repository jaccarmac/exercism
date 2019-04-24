;;; bob.el --- Bob exercise (exercism)

;;; Commentary: Bob responds to various sentences.

;;; Code:
(eval-when-compile (require 'subr-x))

(defun response-for (sentence)
  (let ((sentence (string-trim sentence)))
    (cond ((saying-nothing-p sentence) "Fine. Be that way!")
          ((and (yellingp sentence) (askingp sentence))
           "Calm down, I know what I'm doing!")
          ((yellingp sentence) "Whoa, chill out!")
          ((askingp sentence) "Sure.")
          (t "Whatever."))))

(defun saying-nothing-p (sentence)
  (= (length sentence) 0))

(defun yellingp (sentence)
  (and (string-match-p "[[:alpha:]]" sentence)
       (string-equal sentence (upcase sentence))))

(defun askingp (sentence)
  (string-suffix-p "?" sentence))

(provide 'bob)
;;; bob.el ends here
