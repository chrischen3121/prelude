;; yasnippet config
(prelude-require-packages '(yasnippet yasnippet-snippets))
(defconst cc-snippets-dir (expand-file-name "snippets" prelude-personal-dir))
(push cc-snippets-dir yas-snippet-dirs)
(yas-reload-all)



(add-hook 'prog-mode-hook
          (lambda ()
            (yas-minor-mode-on)
            (define-key prog-mode-map (kbd "M-/") 'yas-expand-from-trigger-key)))
(add-hook 'org-mode-hook
          (lambda ()
            (yas-minor-mode-on)
            (define-key org-mode-map (kbd "M-/") 'yas-expand-from-trigger-key)))

(provide 'cc-dev)
