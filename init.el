;; emacs configuration
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default truncate-lines t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(delete-selection-mode t)

(show-paren-mode t)
(line-number-mode t)
(column-number-mode t)
(menu-bar-mode -1)

(when window-system
  (tool-bar-mode -1)
  (global-linum-mode 1))

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
