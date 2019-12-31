(prelude-require-package 'multi-term)
(global-set-key (kbd "C-x M-m") 'multi-term)

(global-set-key (kbd "C--") 'negative-argument)
(global-set-key (kbd "M-\\") 'just-one-space)
(global-unset-key (kbd "C-+"))
(global-set-key (kbd "C-l") 'ivy-backward-delete-char)
(global-set-key (kbd "S-SPC") 'set-mark-command)

(provide 'cc-better-defaults)
