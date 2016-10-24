(add-hook 'org-mode-hook
          (lambda ()
            (require 'org-bullets)
            (org-bullets-mode 1)
            (flyspell-mode 1)
            (auto-fill-mode 1)))

(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.25))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.15))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.05))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
)
