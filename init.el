;; emacs configuration
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default truncate-lines t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(delete-selection-mode t)

(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)
(custom-set-variables
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
 '(backup-directory-alist '((".*" .  "~/.emacs/backups/"))))


(show-paren-mode t)
(line-number-mode t)
(column-number-mode t)
(menu-bar-mode -1)

(setq split-width-threshold 99999)

(when window-system
  (tool-bar-mode -1)
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
  (setq mouse-wheel-progressive-speed nil)
  (setq mouse-wheel-follow-mouse 't)
  (setq scroll-step 1))

(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
        (make-directory dir)))))

(defun save-all ()
  "Save all open buffers"
    (interactive)
    (save-some-buffers t))

 (add-hook 'focus-out-hook 'save-all)

(defadvice switch-to-buffer (before save-buffer-now activate)
  (when buffer-file-name (save-all)))
(defadvice other-window (before other-window-now activate)
  (when buffer-file-name (save-all)))

(add-hook 'before-save-hook 'whitespace-cleanup)

;; environment setup
;; The root of the emacs configuration directory
(setq *emacs-config-directory*
      (file-name-directory (file-chase-links (expand-file-name "~/.emacs.d/init.el"))))

(setq *packages-directory*
      (expand-file-name "elpa" *emacs-config-directory*))

(setq *packages-links-directory*
      (expand-file-name "links" *packages-directory*))

;; Mode specific configurations live here
(setq *configs-directory*
      (expand-file-name "configs" *emacs-config-directory*))

;; Load configurations
(let ((config-files (directory-files *configs-directory* nil "\\w+.el$")))
  (mapc #'(lambda (x) (load-file (expand-file-name x *configs-directory*))) config-files))
