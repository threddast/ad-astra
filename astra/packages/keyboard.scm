(define-module (ad-astra packages keyboard)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (nonguix build-system binary)
  #:use-module (guix download))

(define-public xremap
  (package
   (name "xremap")
   (version "0.8.0")
   (source (origin
            (method url-fetch/zipbomb)
            (uri (string-append
                  "https://github.com/k0kubun/xremap/releases/download/v"
                  version "/xremap-linux-x86_64-hypr.zip"))
            (sha256
             (base32
              "0r0h91f8mahxlb0smh2wynjfkab7kd9kyss57bww3mwyfp1b72aw"))))
   (build-system binary-build-system)
   (arguments
    `(#:install-plan
      '(("xremap" "/bin/"))
      #:phases
      (modify-phases %standard-phases
         (add-after 'unpack 'chmod
           (lambda _
             (chmod "xremap" #o755))))))
   (supported-systems (list "x86_64-linux"))
   (home-page "")
   (synopsis "Dynamic key remapp for X and Wayland")
   (description "Dynamic key remapp for X and Wayland")
   (license license:expat)))
