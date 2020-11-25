(let* ((emacs-home "~/.emacs.d/")
       (configuration-org (concat emacs-home "configuration.org")))
    ;; Read emacs configuration from the init org document
    (org-babel-load-file configuration-org))
