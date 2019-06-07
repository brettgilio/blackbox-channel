(define-module (non-gnu packages meta-packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix cvs-download)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages base)
  #:use-module (gnu packages build-tools)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages coq)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages m4)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages rsync)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages valgrind)
  #:use-module (gnu packages version-control)
  #:use-module (non-gnu packages coq-extend)
  #:use-module (non-gnu packages emacs-extend)
  #:use-module (non-gnu packages language-servers)
  #:use-module (non-gnu packages racket-extend))

(define %meta-base
  (package
    (name #f)
    (version "13")
    (source #f)
    (build-system trivial-build-system)
    (arguments '(#:builder (begin (mkdir %output) #t)))
    (synopsis #f)
    (home-page #f)
    (description #f)
    (license #f)))

(define-public meta-emacs
  (package
   (inherit %meta-base)
   (name "meta-emacs")
   (propagated-inputs
    `(("emacs" ,emacs)
      ("emacs-all-the-icons"
       ,emacs-all-the-icons-master)
      ("emacs-auto-compile"
       ,emacs-auto-compile-tagged)
      ("emacs-company" ,emacs-company)
      ("emacs-company-quickhelp"
       ,emacs-company-quickhelp)
      ("emacs-dashboard" ,emacs-dashboard)
      ("emacs-desktop-environment"
       ,emacs-desktop-environment)
      ("emacs-doom-modeline"
       ,emacs-doom-modeline-tagged)
      ("emacs-erc-status-sidebar"
       ,emacs-erc-status-sidebar-master)
      ("emacs-fancy-battery"
       ,emacs-fancy-battery-master)
      ("emacs-gitpatch" ,emacs-gitpatch)
      ("emacs-guix" ,emacs-guix)
      ("emacs-helm" ,emacs-helm)
      ("emacs-magit" ,emacs-magit)
      ("emacs-magit-popup"
       ,emacs-magit-popup)
      ("emacs-nix-mode" ,emacs-nix-mode)
      ("emacs-nov-el" ,emacs-nov-el)
      ("emacs-pdf-tools" ,emacs-pdf-tools)
      ("emacs-use-package" ,emacs-use-package)
      ("emacs-webpaste"
       ,emacs-webpaste-tagged)
      ("emacs-yasnippet" ,emacs-yasnippet)))))

(define-public meta-lsp
  (package
   (inherit %meta-base)
   (name "meta-lsp")
   (propagated-inputs
    `(("emacs-company-lsp" ,emacs-company-lsp)
      ("emacs-lsp-mode" ,emacs-lsp-mode)
      ("emacs-lsp-ui" ,emacs-lsp-ui)))))

(define-public meta-python
  (package
   (inherit %meta-base)
   (name "meta-python")
   (propagated-inputs
    `(("meta-emacs" ,meta-emacs)
      ("meta-lsp" ,meta-lsp)
      ("python" ,python)
      ("python" ,python "tk")
      ("python-language-server"
       ,python-language-server)))))

(define-public meta-cobjc
  (package
   (inherit %meta-base)
   (name "meta-cobjc")
   (propagated-inputs
    `(("meta-emacs" ,meta-emacs)
      ("meta-lsp" ,meta-lsp)
      ("bear" ,bear)
      ("ccls" ,ccls-tagged)
      ("doxygen" ,doxygen)
      ("emacs-ccls" ,emacs-ccls-master)
      ("gcc-toolchain" ,gcc-toolchain)
      ("make" ,gnu-make)
      ("valgrind" ,valgrind)
      ("valgrind" ,valgrind "doc")))))

(define-public meta-ocaml
  (package
   (inherit %meta-base)
   (name "meta-ocaml")
   (propagated-inputs
    `(("meta-emacs" ,meta-emacs)
      ("darcs" ,darcs)
      ("dune" ,dune)
      ("emacs-tuareg" ,emacs-tuareg)
      ("gcc-toolchain" ,gcc-toolchain)
      ("m4" ,m4)
      ("make" ,gnu-make)
      ("mercurial" ,mercurial)
      ("ocaml" ,ocaml)
      ("ocaml-base" ,ocaml-base)
      ("ocaml-core" ,ocaml-core)
      ("ocaml-ctypes" ,ocaml-ctypes)
      ("ocaml-findlib" ,ocaml-findlib)
      ("ocaml-merlin" ,ocaml-merlin)
      ("ocaml-ounit" ,ocaml-ounit)
      ("oocaml-parsexp"
       ,ocaml-parsexp)
      ("ocaml-utop" ,ocaml-utop)
      ("opam" ,opam)
      ("rsync" ,rsync)))))

(define-public meta-coq
  (package
   (inherit %meta-base)
   (name "meta-coq")
   (propagated-inputs
    `(("meta-emacs" ,meta-emacs)
      ("coq" ,coq-tagged)
      ("emacs-company-coq"
       ,emacs-company-coq-tagged)
      ("proof-general"
       ,proof-general-master)))))

(define-public meta-rust
  (package
   (inherit %meta-base)
   (name "meta-rust")
   (propagated-inputs
    `(("meta-emacs" ,meta-emacs)
      ("meta-lsp" ,meta-lsp)
      ("emacs-rust-mode" ,emacs-rust-mode-tagged)))))

(define-public meta-fsharp
  (package
   (inherit %meta-base)
   (name "meta-fsharp")
   (propagated-inputs
    `(("meta-emacs" ,meta-emacs)
      ("emacs-fsharp-mode"
       ,emacs-fsharp-mode-tagged)))))

(define-public meta-fstar
  (package
   (inherit %meta-base)
   (name "meta-fstar")
   (propagated-inputs
    `(("meta-emacs" ,meta-emacs)
      ("emacs-fstar-mode"
       ,emacs-fstar-mode-master)))))  

(define-public meta-haskell
  (package
   (inherit %meta-base)
   (name "meta-haskell")
   (propagated-inputs
    `(("meta-emacs" ,meta-emacs)
      ("meta-lsp" ,meta-lsp)
      ("emacs-lsp-haskell"
       ,emacs-lsp-haskell-master)))))  

(define-public meta-lean
  (package
   (inherit %meta-base)
   (name "meta-lean")
   (propagated-inputs
    `(("meta-emacs" ,meta-emacs)
      ("emacs-lean-mode"
       ,emacs-lean-mode-master)))))

(define-public meta-r
  (package
   (inherit %meta-base)
   (name "meta-r")
   (propagated-inputs
    `(("meta-emacs" ,meta-emacs)
      ("emacs-ess" ,emacs-ess)
      ("r" ,r)))))  

(define-public meta-racket
  (package
   (inherit %meta-base)
   (name "meta-racket")
   (propagated-inputs
    `(("meta-emacs" ,meta-emacs)
      ("emacs-racket-mode"
       ,emacs-racket-mode-master)
      ("racket" ,racket-tagged)))))
