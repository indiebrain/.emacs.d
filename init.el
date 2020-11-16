;; If the configuration.org has already been tangled into
;; configuration.el, use the pre-tangled version. Otherwise tangle the
;; configuration.org. This effectively makes configuration.el a cache
;; of the state of configuration.org at the time of tangle. To
;; re-tangle / update the emacs configuration, remove the
;; configuration.el and restart emacs.
(let* ((emacs-home "~/.emacs.d/")
       (configuration-el (concat emacs-home "configuration.el"))
       (configuration-org (concat emacs-home "configuration.org")))
  (if (file-exists-p configuration-el)
      (load-file configuration-el)
    ;; Read emacs configuration from the init org document
    (org-babel-load-file configuration-org)))
