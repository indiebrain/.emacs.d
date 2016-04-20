(require 'org-bullets)
(add-hook 'org-mode-hook
          (lambda ()
            (org-bullets-mode 1)
            (flyspell-mode 1)))
