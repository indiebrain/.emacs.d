;; initialize the package system
(require 'package)
(package-initialize)

;; Read emacs configuration from the init org document
(org-babel-load-file "~/.emacs.d/configuration.org")
