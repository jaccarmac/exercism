(use-modules (guix packages)
             (guix download)
             (guix build-system haskell)
             ((guix licenses) #:prefix license:)
             (gnu packages haskell)
             (gnu packages haskell-check))

(define-public ghc-validation
  (package
   (name "ghc-validation")
   (version "1.1")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://hackage.haskell.org/package/validation/validation-"
           version
           ".tar.gz"))
     (sha256
      (base32
       "1acj7mh3581ks405xswxw6667z7y1y0slisg6jvp6chc191ji9l5"))))
   (build-system haskell-build-system)
   (arguments
    `(#:phases
      (modify-phases %standard-phases
        (add-after 'unpack 'add-setup-script
          (lambda _
            ;; The usual "Setup.hs" script is missing from the source.
            (with-output-to-file "Setup.hs"
              (lambda ()
                (format #t "import Distribution.Simple~%")
                (format #t "main = defaultMain~%"))))))))
   (inputs
    `(("ghc-semigroups" ,ghc-semigroups)
      ("ghc-semigroupoids" ,ghc-semigroupoids)
      ("ghc-bifunctors" ,ghc-bifunctors)
      ("ghc-lens" ,ghc-lens)))
   (native-inputs
    `(("ghc-hedgehog" ,ghc-hedgehog)
      ("ghc-hunit" ,ghc-hunit)))
   (home-page "https://github.com/qfpl/validation")
   (synopsis
    "A data-type like Either but with an accumulating Applicative")
   (description
    "A data-type like Either but with differing properties and type-class
instances.

Library support is provided for this different representation, include
`lens`-related functions for converting between each and abstracting over their
similarities.

The `Validation` data type is isomorphic to `Either`, but has an instance of
`Applicative` that accumulates on the error side. That is to say, if two (or
more) errors are encountered, they are appended using a `Semigroup` operation.

As a consequence of this `Applicative` instance, there is no corresponding
`Bind` or `Monad` instance. `Validation` is an example of, \"An applicative
functor that is not a monad.\"")
   (license license:bsd-3)))

(define ghc-hedgehog
  (package
   (name "ghc-hedgehog")
   (version "0.6.1")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://hackage.haskell.org/package/hedgehog/hedgehog-"
           version
           ".tar.gz"))
     (sha256
      (base32
       "0xz10ycdm5vk9nrcym1fi83k19frfwqz18bz8bnpzwvaj0j41yfj"))))
   (build-system haskell-build-system)
   (inputs
    `(("ghc-ansi-terminal" ,ghc-ansi-terminal)
      ("ghc-async" ,ghc-async)
      ("ghc-concurrent-output" ,ghc-concurrent-output)
      ("ghc-exceptions" ,ghc-exceptions)
      ("ghc-lifted-async" ,ghc-lifted-async)
      ("ghc-mmorph" ,ghc-mmorph)
      ("ghc-monad-control" ,ghc-monad-control)
      ("ghc-pretty-show" ,ghc-pretty-show)
      ("ghc-primitive" ,ghc-primitive)
      ("ghc-random" ,ghc-random)
      ("ghc-resourcet" ,ghc-resourcet)
      ("ghc-semigroups" ,ghc-semigroups)
      ("ghc-stm" ,ghc-stm)
      ("ghc-th-lift" ,ghc-th-lift)
      ("ghc-transformers-base" ,ghc-transformers-base)
      ("ghc-wl-pprint-annotated"
       ,ghc-wl-pprint-annotated)))
   (home-page "https://hedgehog.qa")
   (synopsis "Hedgehog will eat all your bugs.")
   (description
    "Hedgehog is a modern property-based testing system, in the spirit of
QuickCheck. Hedgehog uses integrated shrinking, so shrinks obey the invariants
of generated values by construction.

To get started quickly, see the examples:
<https://github.com/hedgehogqa/haskell-hedgehog/tree/master/hedgehog-example>")
   (license license:bsd-3)))

(define ghc-concurrent-output
  (package
   (name "ghc-concurrent-output")
   (version "1.10.10")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://hackage.haskell.org/package/concurrent-output/concurrent-output-"
           version
           ".tar.gz"))
     (sha256
      (base32
       "1wnjxnwbc3l853kiiijagzjyb6fmhz3lmkwls24plbximl1qrr22"))))
   (build-system haskell-build-system)
   (inputs
    `(("ghc-async" ,ghc-async)
      ("ghc-stm" ,ghc-stm)
      ("ghc-exceptions" ,ghc-exceptions)
      ("ghc-ansi-terminal" ,ghc-ansi-terminal-newer)
      ("ghc-terminal-size" ,ghc-terminal-size)))
   (home-page
    "https://hackage.haskell.org/package/concurrent-output")
   (synopsis
    "Ungarble output from several threads or commands")
   (description
    "Lets multiple threads and external processes concurrently output to the
console, without it getting all garbled up.

Built on top of that is a way of defining multiple output regions, which are
automatically laid out on the screen and can be individually updated by
concurrent threads. Can be used for progress displays etc.")
   (license license:bsd-2)))

(define ghc-ansi-terminal-newer
  (package (inherit ghc-ansi-terminal)
   (name "ghc-ansi-terminal")
   (version "0.9.1")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://hackage.haskell.org/package/ansi-terminal/ansi-terminal-"
           version
           ".tar.gz"))
     (sha256
      (base32
       "1yr0ld0kqns3w3j9gl62bdwshvyazidx4dv1qkvq19ivnf08w23l"))))))

(define ghc-wl-pprint-annotated
  (package
   (name "ghc-wl-pprint-annotated")
   (version "0.1.0.1")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://hackage.haskell.org/package/wl-pprint-annotated/wl-pprint-annotated-"
           version
           ".tar.gz"))
     (sha256
      (base32
       "1br7qyf27iza213inwhf9bm2k6in0zbmfw6w4clqlc9f9cj2nrkb"))))
   (build-system haskell-build-system)
   (native-inputs
    `(("ghc-tasty" ,ghc-tasty)
      ("ghc-tasty-hunit" ,ghc-tasty-hunit)))
   (home-page "https://github.com/minad/wl-pprint-annotated#readme")
   (synopsis "Pretty printer with annotation support")
   (description
    "Wadler/Leijen pretty printer with support for annotations and modernized
API. Annotations are useful for coloring. See wl-pprint-console.")
   (license license:bsd-3)))
