(prelude-require-packages '(sr-speedbar term))

(use-package
  sr-speedbar
  :config (custom-set-variables '(speedbar-show-unknown-files t)
                                '(sr-speedbar-max-width 20)
                                '(sr-speedbar-width-x 10))
  :bind (("C-c b" . sr-speedbar-toggle)))

;; term
(use-package
  term
  :bind (("C-c C-t a" . ansi-term)
         (:map term-mode-map)
         ("C-c C-j" . term-line-mode)
         ("C-c C-k" . term-char-mode)))

(which-key-add-key-based-replacements "C-c C-t" "terminal")
(global-set-key (kbd "C-c t e") #'eshell)

;; hide menu bar
(menu-bar-mode -1)

;; dired
(use-package
  dired
  :bind ((:map dired-mode-map)
         ("S-SPC" . set-mark-command)))

;; sudo editing
;; TODO: use crux-reopen-as-root-mode
;; (defun sudo ()
;;   "Use TRAMP to `sudo' the current buffer"
;;   (interactive)
;;   (when buffer-file-name (find-alternate-file (concat (concat "/sudo:root@localhost:")
;;                                                       buffer-file-name))))

;; unbind keys
(define-key prelude-mode-map (kbd "C-c t") 'nil)
(define-key prelude-mode-map (kbd "C-c o") 'nil)
(define-key prelude-mode-map (kbd "C-c n") 'nil)
(define-key prelude-mode-map (kbd "C-c f") 'nil)
(define-key prelude-mode-map (kbd "C-c u") 'nil)
(define-key prelude-mode-map (kbd "C-c e") 'nil)
(define-key prelude-mode-map (kbd "C-c s") 'nil)
(define-key prelude-mode-map (kbd "C-c D") 'nil)
(define-key prelude-mode-map (kbd "C-c d") 'nil)
(define-key prelude-mode-map (kbd "C-c M-d") 'nil)
(define-key prelude-mode-map (kbd "C-c r") 'nil)
(define-key prelude-mode-map (kbd "C-c k") 'nil)
(define-key prelude-mode-map (kbd "C-c TAB") 'nil)
(define-key prelude-mode-map (kbd "C-c I") 'nil)
(define-key prelude-mode-map (kbd "C-c S") 'nil)
(define-key prelude-mode-map (kbd "C-c i") 'nil)
(define-key prelude-mode-map (kbd "C-c g") 'nil)

;; crux
(which-key-add-key-based-replacements "C-c r" "crux")
(define-key prelude-mode-map (kbd "C-c r t") 'crux-visit-term-buffer)
(define-key prelude-mode-map (kbd "C-c r o") 'crux-open-with)
(define-key prelude-mode-map (kbd "C-c r f")  'crux-reopen-as-root-mode)
(define-key prelude-mode-map (kbd "C-c r n") 'crux-cleanup-buffer-or-region)
(define-key prelude-mode-map (kbd "C-c r u") 'crux-view-url)
(define-key prelude-mode-map (kbd "C-c r e") 'crux-eval-and-replace)
(define-key prelude-mode-map (kbd "C-c r s") 'crux-swap-windows)
(define-key prelude-mode-map (kbd "C-c r D") 'crux-delete-file-and-buffer)
(define-key prelude-mode-map (kbd "C-c r d") 'crux-duplicate-current-line-or-region)
(define-key prelude-mode-map (kbd "C-c r M-d") 'crux-duplicate-and-comment-current-line-or-region)
(define-key prelude-mode-map (kbd "C-c r r") 'crux-rename-buffer-and-file)
(define-key prelude-mode-map (kbd "C-c r k") 'crux-kill-other-buffers)
(define-key prelude-mode-map (kbd "C-c r TAB") 'crux-indent-rigidly-and-copy-to-clipboard)
(define-key prelude-mode-map (kbd "C-c r I") 'crux-find-user-init-file)
(define-key prelude-mode-map (kbd "C-c r S") 'crux-find-shell-init-file)

;; smartparens
(define-key smartparens-mode-map (kbd "M-s") 'nil)

(which-key-add-key-based-replacements "M-s h" "highlight")

(which-key-add-key-based-replacements "C-c !" "flycheck")
(which-key-add-key-based-replacements "C-c ." "apply-operation")
(which-key-add-key-based-replacements "C-c &" "yas")
(which-key-add-key-based-replacements "C-c C-d" "elisp-slime")
(which-key-add-key-based-replacements "C-x r" "bookmark")
(which-key-add-key-based-replacements "C-x n" "narrow")
(which-key-add-key-based-replacements "C-x a" "abbrev")
(which-key-add-key-based-replacements "C-x 8" "special-chars")
(which-key-add-key-based-replacements "C-x @" "event-apply")

(customize-set-variable 'which-key-special-keys '("ESC"))

;; global keybindings
(global-unset-key (kbd "M-s ESC"))
(global-unset-key (kbd "C-+"))

(global-set-key (kbd "C--") #'negative-argument)

(which-key-add-key-based-replacements "C-c o" "org")
(global-set-key (kbd "C-c o c") #'org-capture)
(global-set-key (kbd "C-c o l") #'org-store-link)
;; (global-set-key (kbd "C-c o i") #'org-clock-in)
;; (global-set-key (kbd "C-c o o") #'org-clock-out)
(global-set-key (kbd "C-c o g") #'org-clock-goto)


(global-set-key (kbd "C-l") #'ivy-backward-delete-char)
(global-set-key (kbd "S-SPC") #'set-mark-command)
(global-set-key (kbd "M-s o") #'occur)
(global-set-key (kbd "C-x g") #'magit-status)

(provide 'cc-better-defaults)
