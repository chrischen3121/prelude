;; org agenda setup
(setq agenda-home-dir "~/Dropbox/todo")
(setq org-agenda-files (directory-files-recursively agenda-home-dir ".org$"))
(setq org-refile-targets (quote ((nil :maxlevel . 2)
                                 (org-agenda-files :maxlevel . 2))))
(setq org-todo-state-tags-triggers '(("CANCELLED" ("CANCELLED" . t))
                                     ("WAITING" ("WAITING" . t))
                                     ("HOLD" ("WAITING")
                                      ("HOLD" . t))
                                     (done ("WAITING")
                                           ("HOLD"))
                                     ("TODO" ("WAITING")
                                      ("CANCELLED")
                                      ("HOLD"))
                                     ("NEXT" ("WAITING")
                                      ("CANCELLED")
                                      ("HOLD"))
                                     ("DONE" ("WAITING")
                                      ("CANCELLED")
                                      ("HOLD"))))
(setq org-todo-keywords (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                                (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)"
                                          "MEETING"))))
(setq org-todo-keyword-faces (quote (("TODO" :foreground "red"
                                      :weight bold)
                                     ("NEXT" :foreground "blue"
                                      :weight bold)
                                     ("DONE" :foreground "forest green"
                                      :weight bold)
                                     ("WAITING" :foreground "orange"
                                      :weight bold)
                                     ("HOLD" :foreground "magenta"
                                      :weight bold)
                                     ("CANCELLED" :foreground "forest green"
                                      :weight bold)
                                     ("MEETING" :foreground "forest green"
                                      :weight bold))))

(add-hook 'org-agenda-mode-hook (lambda ()
                                  (setq org-clock-out-remove-zero-time-clocks t)
                                  (setq org-default-notes-file (concat agenda-home-dir
                                                                       "/capture.org"))
                                  ;; (setq org-agenda-log-mode-items '(closed state))
                                  (setq org-deadline-warning-days 5)

                                  (setq org-columns-default-format
                                        "%40ITEM(Task) %TODO %3PRIORITY %17Effort(Effort){:} %10CLOCKSUM")
                                  (setq org-global-properties '(("Effort_ALL" .
                                                                 "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")))))

;; org agenda keybindings
(add-hook 'org-agenda-mode-hook (lambda ()
                                  (define-key org-agenda-mode-map (kbd "C-c C-s")
                                    #'org-agenda-schedule)
                                  (define-key org-agenda-mode-map (kbd "C-c i")
                                    #'org-agenda-clock-in)
                                  (define-key org-agenda-mode-map (kbd "C-c o")
                                    #'org-agenda-clock-out)
                                  (define-key org-agenda-mode-map (kbd "C-c v")
                                    #'org-agenda-columns)
                                  (define-key org-agenda-mode-map (kbd "C-c e")
                                    #'org-agenda-set-effort)))

(provide 'cc-agenda)
