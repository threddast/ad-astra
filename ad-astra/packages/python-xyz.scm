(define-module (ad-astra packages python-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (gnu packages check)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-xyz))

(define-public python-pathpy2
  (let ((revision "1")
        (commit "9d86d08e38cb581e7e887e3f17ca96fefc5a2ab5"))
    (package
     (name "python-pathpy2")
     (version (git-version "2.2.0" revision commit))
     (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/uzhdag/pathpy.git")
                    (commit commit)))
              (sha256
               (base32
                "1xivfnan4a3g2fkrpkx64l5k6gzy3rxwdgscdqmmcwcw5njx5ys6"))))
     (build-system pyproject-build-system)
     (propagated-inputs
      (list python-numpy
            python-scipy
            python-pytest
            python-pytest-runner
            python-setuptools))
     (home-page "https://www.pathpy.net")
     (synopsis
      "Analysis and visualisation of time series data on complex networks")
     (description
      "An OpenSource python package for the analysis and visualisation of time series
data on complex networks with higher- and multi-order graphical models.")
     (license license:agpl3))))
