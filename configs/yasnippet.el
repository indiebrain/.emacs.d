;; Initialize yasnippet
(let ((yasnippet-directory 
       (file-chase-links (expand-file-name "yasnippet" *packages-links-directory*))))
  (add-to-list 'load-path yasnippet-directory)
  (require 'yasnippet)
  (yas--initialize)
  (yas/load-directory (expand-file-name "snippets" yasnippet-directory)))
