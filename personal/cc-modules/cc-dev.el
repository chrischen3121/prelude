;; yasnippet config
(prelude-require-packages '(yasnippet-snippets))

(add-hook 'hs-minor-mode-hook (lambda ()
                                (define-key hs-minor-mode-map (kbd "C-c @") 'nil)
                                (which-key-add-key-based-replacements "C-c h" "hideshow")
                                (define-key hs-minor-mode-map (kbd "C-c h h") #'hs-hide-all)
                                (define-key hs-minor-mode-map (kbd "C-c h s") #'hs-show-all)
                                (define-key hs-minor-mode-map (kbd "C-c h l") #'hs-toggle-hiding)))

(use-package
  yasnippet
  :defer t
  :config (defconst cc-snippets-dir (expand-file-name "snippets" prelude-personal-dir))
  (add-to-list 'yas-snippet-dirs 'cc-snippets-dir t)
  (yas-load-directory cc-snippets-dir t)
  :bind (("M-/" . yas-expand-from-trigger-key)))

(use-package
  yasnippet-snippets
  :defer t)


(add-hook 'prog-mode-hook (lambda ()
                            (hs-minor-mode t)
                            (yas-minor-mode-on)

                            ;; TODO: highlight C-c l
                            ))

(add-hook 'org-mode-hook (lambda ()
                           (yas-minor-mode-on)))

(provide 'cc-dev)
