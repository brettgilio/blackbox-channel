(define-module (non-gnu packages hy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages adns)
  #:use-module (gnu packages attr)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages file)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages man)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages monitoring)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages openstack)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages search)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages time)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages base)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages bdw-gc)
  #:use-module (gnu packages serialization)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module (guix build-system trivial)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:use-module (non-gnu packages python-extend))

(define-public hylang
  (package
   (name "hylang")
   (version "0.16.0")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "hy" version))
     (sha256
      (base32
       "00lq38ppikrpyw38fn5iy9iwrsamsv22507cp146dsjbzkwjpzrd"))))
   (build-system python-build-system)
   (arguments
     `(#:tests? #f))
   (propagated-inputs
    `(("python-astor" ,python-astor)
      ("python-clint" ,python-clint)
      ("python-fastentrypoints" ,python-fastentrypoints)
      ("python-funcparserlib" ,python-funcparserlib)
      ("python-rply@0.7.7" ,python-rply)))
   (home-page "http://hylang.org/")
   (synopsis "Lisp and Python love each other.")
   (description "Lisp and Python love each other.")
   (license license:expat)))

(define-public hylang-gently
  (package
   (name "hylang-gently")
   (version "0.16")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "gently" version))
     (sha256
      (base32
       "19zcff5plykihcvlkbqahign6x7s9s4ixyc6ix2w844wnbs03jmh"))))
   (build-system python-build-system)
   (propagated-inputs
    `(("python-control" ,python-control)
      ("hylang" ,hylang)
      ("python-matplotlib" ,python-matplotlib)
      ("python-sympy" ,python-sympy)))
   (home-page
    "https://github.com/celaleddin/gently/")
   (synopsis
    "A tool for designing and analysing control systems")
   (description
    "A tool for designing and analysing control systems")
   (license license:expat)))

(define-public hylang-hydiomatic
  (package
   (name "hylang-hydiomatic")
   (version "0.1.1")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "hydiomatic" version))
     (sha256
      (base32
       "0s16a62kx10i92r79vycanyy0s3jx35jjnw460qvkrp6j21gbwcv"))))
   (build-system python-build-system)
   (propagated-inputs
    `(("hylang-adderall" ,hylang-adderall)
      ("hylang" ,hylang)))
   (home-page
    "https://github.com/algernon/hydiomatic")
   (synopsis "The Hy Transformer")
   (description "The Hy Transformer")
   (license license:gpl3+)))
