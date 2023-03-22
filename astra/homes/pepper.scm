;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (gnu home services)
             (gnu home services xdg)
             (guix gexp)
             (gnu home services shells))

(home-environment
  ;; Below is the list of packages that will show up in your
  ;; Home profile, under ~/.guix-home/profile.
  (packages (specifications->packages (list "git" "neovim" "emacs-next-pgtk" "firefox")))

  ;; Below is the list of Home services.  To search for available
  ;; services, run 'guix home search KEYWORD' in a terminal.
  (services
   (list
     (service home-xdg-user-directories-service-type
    (home-xdg-user-directories-configuration
     (download "$HOME/downloads")
     (documents "$HOME/documents")
     (pictures "$HOME/images")
     (music "$HOME/music")
     (videos "$HOME/videos")
     (publicshare "$HOME")
     (templates "$HOME")
     (desktop "$HOME")))
    (service home-bash-service-type
      (home-bash-configuration
        (aliases '(("grep" . "grep --color=auto") ("ll" . "ls -l") ("ls" . "ls -p --color=auto")))
        (bashrc (list (local-file "../files/.bashrc" "bashrc")))
        (bash-profile (list (local-file "../files/.bash_profile" "bash_profile")))))
    (service home-files-service-type `((".config/guix/channels.scm" ,(local-file "../channels.scm")))))))
