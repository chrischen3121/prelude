(which-key-add-key-based-replacements "M-s h" "highlight")
(global-unset-key (kbd "M-s ESC"))

(global-set-key (kbd "C--") 'negative-argument)
(global-set-key (kbd "M-\\") 'just-one-space)
(global-unset-key (kbd "C-+"))
(global-set-key (kbd "C-l") 'ivy-backward-delete-char)
(global-set-key (kbd "S-SPC") 'set-mark-command)
(global-set-key (kbd "M-i") 'imenu)

(provide 'cc-keybindings)
