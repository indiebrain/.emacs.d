;; The root of the emacs configuration directory
(setq *emacs-config-directory*
      (file-name-directory (file-chase-links (expand-file-name "~/.emacs"))))

;; Mode specific configurations live here
(setq *configs-directory*
      (expand-file-name "configs" *emacs-config-directory*))

;; Load the editor initialization
(load-file (expand-file-name "init.el" *emacs-config-directory*))

;; Load configurations
(let ((config-files (directory-files *configs-directory* nil "\\w+.el$")))
  (mapc #'(lambda (x) (load-file (expand-file-name x *configs-directory*))) config-files))
