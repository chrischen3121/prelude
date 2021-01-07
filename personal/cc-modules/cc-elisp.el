;; TODO: may use semantic-refactor
(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (smartparens-mode t)
                                  (define-key emacs-lisp-mode-map (kbd "C-c f")
                                    #'elisp-format-buffer)
                                  (define-key emacs-lisp-mode-map (kbd "C-w") #'kill-region)))

(provide 'cc-elisp)
