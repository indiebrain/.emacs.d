;; The root of the emacs configuration directory
(setq *emacs-config-directory*
      (file-name-directory (file-chase-links (expand-file-name "~/.emacs"))))

(setq *packages-directory*
      (expand-file-name "elpa" *emacs-config-directory*))

(setq *packages-links-directory*
      (expand-file-name "links" *packages-directory*))

;; Mode specific configurations live here
(setq *configs-directory*
      (expand-file-name "configs" *emacs-config-directory*))

;; Load the editor initialization
(load-file (expand-file-name "init.el" *emacs-config-directory*))

;; Load configurations
(let ((config-files (directory-files *configs-directory* nil "\\w+.el$")))
  (mapc #'(lambda (x) (load-file (expand-file-name x *configs-directory*))) config-files))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
