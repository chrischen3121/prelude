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

(which-key-add-key-based-replacements "C-c c" "crux")
(define-key prelude-mode-map (kbd "C-c c t") 'crux-visit-term-buffer)
(define-key prelude-mode-map (kbd "C-c c o") 'crux-open-with)
(define-key prelude-mode-map (kbd "C-c c n") 'crux-cleanup-buffer-or-region)
(define-key prelude-mode-map (kbd "C-c c f")  'crux-recentf-find-file)
(define-key prelude-mode-map (kbd "C-c c u") 'crux-view-url)
(define-key prelude-mode-map (kbd "C-c c e") 'crux-eval-and-replace)
(define-key prelude-mode-map (kbd "C-c c s") 'crux-swap-windows)
(define-key prelude-mode-map (kbd "C-c c D") 'crux-delete-file-and-buffer)
(define-key prelude-mode-map (kbd "C-c c d") 'crux-duplicate-current-line-or-region)
(define-key prelude-mode-map (kbd "C-c c M-d") 'crux-duplicate-and-comment-current-line-or-region)
(define-key prelude-mode-map (kbd "C-c c r") 'crux-rename-buffer-and-file)
(define-key prelude-mode-map (kbd "C-c c k") 'crux-kill-other-buffers)
(define-key prelude-mode-map (kbd "C-c c TAB") 'crux-indent-rigidly-and-copy-to-clipboard)
(define-key prelude-mode-map (kbd "C-c c I") 'crux-find-user-init-file)
(define-key prelude-mode-map (kbd "C-c c S") 'crux-find-shell-init-file)

;; keybindings
(which-key-add-key-based-replacements "M-s h" "highlight")
(global-unset-key (kbd "M-s ESC"))

(global-set-key (kbd "C--") 'negative-argument)
(global-set-key (kbd "C-c C-c") 'org-capture)
(global-set-key (kbd "M-\\") 'just-one-space)
(global-unset-key (kbd "C-+"))
(global-set-key (kbd "C-l") 'ivy-backward-delete-char)
(global-set-key (kbd "S-SPC") 'set-mark-command)

(global-set-key (kbd "M-i") 'imenu)

(provide 'cc-better-defaults)
