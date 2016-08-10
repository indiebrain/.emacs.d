(add-hook 'org-mode-hook
          (lambda ()
            (require 'org-bullets)
            (org-bullets-mode 1)
            (flyspell-mode 1)
            (auto-fill-mode 1)))
