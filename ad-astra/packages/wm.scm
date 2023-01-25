(define-module (ad-astra packages wm)
  #:use-module (gnu packages wm))
 

(define-public waybar-experimental
  (let ((base waybar))
    (package
     (inherit base)
     (name "waybar-experimental")
     (arguments
      (list #:configure-flags #~(list "-Dexperimental=true"))))))
