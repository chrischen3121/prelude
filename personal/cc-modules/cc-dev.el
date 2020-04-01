(prelude-require-packages '(yasnippet yasnippet-snippets))
(defconst cc-snippets-dir (expand-file-name "snippets" prelude-personal-dir))
(push cc-snippets-dir yas-snippet-dirs)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'cc-dev)
