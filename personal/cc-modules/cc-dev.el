;; yasnippet config
(prelude-require-packages '(yasnippet yasnippet-snippets))
(defconst cc-snippets-dir (expand-file-name "snippets" prelude-personal-dir))
(push cc-snippets-dir yas-snippet-dirs)
(yas-reload-all)

;; hideshow
(add-hook 'prog-mode-hook (lambda ()
                            (hs-minor-mode t)
                            (which-key-add-key-based-replacements "C-c @" "hideshow")
                            (define-key prog-mode-map (kbd "C-c h") #'hs-hide-all)
                            (define-key prog-mode-map (kbd "C-c s") #'hs-show-all)
                            (define-key prog-mode-map (kbd "C-c l") #'hs-hide-level)
                            (define-key prog-mode-map (kbd "<backtab>") #'hs-toggle-hiding)))

(add-hook 'prog-mode-hook (lambda ()
                            (yas-minor-mode-on)
                            (define-key prog-mode-map (kbd "M-/") 'yas-expand-from-trigger-key)))
(add-hook 'org-mode-hook (lambda ()
                           (yas-minor-mode-on)
                           (define-key org-mode-map (kbd "M-/") 'yas-expand-from-trigger-key)))

(provide 'cc-dev)
