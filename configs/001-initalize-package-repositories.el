(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

; list the packages you want
(setq package-list
      '(auto-complete
        ag
        enh-ruby-mode
        elixir-mode
        exec-path-from-shell
        gist
        gruvbox-theme
        markdown-mode
        flx-ido
        inf-ruby
        js2-mode
        magit
        org-bullets
        powerline
        projectile
        projectile-rails
        rbenv
        rspec-mode
        sass-mode
        web-mode
        writegood-mode))

;; initalize the package system
(package-initialize)

; fetch the list of packages available
(or (file-exists-p package-user-dir)
    (package-refresh-contents))
;;(unless package-archive-contents
;;  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
