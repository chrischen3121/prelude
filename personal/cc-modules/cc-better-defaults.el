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

(global-set-key (kbd "C--") 'negative-argument)
(global-set-key (kbd "M-\\") 'just-one-space)
(global-unset-key (kbd "C-+"))
(global-set-key (kbd "C-l") 'ivy-backward-delete-char)
(global-set-key (kbd "S-SPC") 'set-mark-command)

(defun sudo ()
  "Use TRAMP to `sudo' the current buffer"
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat (concat "/sudo:root@localhost:")
             buffer-file-name))))


(provide 'cc-better-defaults)
