;; term

(global-set-key (kbd "C-x M-m") 'ansi-term)

(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-mode-map (kbd "C-c C-j") 'term-line-mode)
            (define-key term-mode-map (kbd "C-c C-k") 'term-char-mode)))

;; dired
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "S-SPC") 'set-mark-command)))

;; sudo editing
(defun sudo ()
  "Use TRAMP to `sudo' the current buffer"
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat (concat "/sudo:root@localhost:")
             buffer-file-name))))

;; crux
(define-key prelude-mode-map (kbd "C-c t") nil)
(define-key prelude-mode-map (kbd "C-c o") nil)
(define-key prelude-mode-map (kbd "C-c n") nil)
(define-key prelude-mode-map (kbd "C-c f") nil)
(define-key prelude-mode-map (kbd "C-c u") nil)
(define-key prelude-mode-map (kbd "C-c e") nil)
(define-key prelude-mode-map (kbd "C-c s") nil)
(define-key prelude-mode-map (kbd "C-c D") nil)
(define-key prelude-mode-map (kbd "C-c d") nil)
(define-key prelude-mode-map (kbd "C-c M-d") nil)
(define-key prelude-mode-map (kbd "C-c r") nil)
(define-key prelude-mode-map (kbd "C-c k") nil)
(define-key prelude-mode-map (kbd "C-c TAB") nil)
(define-key prelude-mode-map (kbd "C-c I") nil)
(define-key prelude-mode-map (kbd "C-c S") nil)

(which-key-add-key-based-replacements "C-c r" "crux")
(define-key prelude-mode-map (kbd "C-c r t") 'crux-visit-term-buffer)
(define-key prelude-mode-map (kbd "C-c r o") 'crux-open-with)
(define-key prelude-mode-map (kbd "C-c r n") 'crux-cleanup-buffer-or-region)
(define-key prelude-mode-map (kbd "C-c r f")  'crux-recentf-find-file)
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

(which-key-add-key-based-replacements "C-c !" "flycheck")
(which-key-add-key-based-replacements "C-c ." "apply-operation")
(which-key-add-key-based-replacements "C-c &" "yas")
(which-key-add-key-based-replacements "C-c C-d" "elisp-slime")
(which-key-add-key-based-replacements "C-x r" "bookmark")
(which-key-add-key-based-replacements "C-x n" "narrow")
(which-key-add-key-based-replacements "C-x a" "abbrev")
(which-key-add-key-based-replacements "C-x 8" "special-chars")
(which-key-add-key-based-replacements "C-x @" "event-apply")

;; keybindings
(which-key-add-key-based-replacements "M-s h" "highlight")
(global-unset-key (kbd "M-s ESC"))

(global-set-key (kbd "C--") 'negative-argument)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "M-\\") 'just-one-space)
(global-unset-key (kbd "C-+"))
(global-set-key (kbd "C-l") 'ivy-backward-delete-char)
(global-set-key (kbd "S-SPC") 'set-mark-command)

(global-set-key (kbd "M-i") 'imenu)

(provide 'cc-better-defaults)
