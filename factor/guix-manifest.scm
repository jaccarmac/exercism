;; Two reasons.
;;
;; 1. Factor isn't in the Guix package store.
;;
;; 2. It requires an image for bootstrapping, so I may need to write a looooong
;; bootstrap chain a la Rust to get it working. File that under TODO.
;;
;; https://factor-language.blogspot.com/2010/01/factors-bootstrap-process-explained.html
;;
;; still accurate?

(specifications->manifest '())
