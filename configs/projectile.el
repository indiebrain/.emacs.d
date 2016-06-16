(setq projectile-enable-caching t)
(setq projectile-indexing-method 'native)
(setq projectile-completion-system 'ido)

(add-hook 'ruby-mode-hook
          'projectile-mode)

(add-hook 'elixir-mode
          'projectile-mode)
