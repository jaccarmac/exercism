(load "ghc-validation.scm")

(packages->manifest
 `(,ghc ,ghc-hspec ,ghc-validation))
