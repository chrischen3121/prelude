;; apt install plantuml
(prelude-require-packages '(plantuml-mode)) ;; graphviz-dot-mode

(setq plantuml-executable-path "plantuml")
(setq plantuml-default-exec-mode 'executable)

(add-to-list 'auto-mode-alist '("\\.\\(org_archive\\)$" . org-mode))
(add-hook 'org-mode-hook (lambda ()
                           (flyspell-mode)
                           (smartparens-mode)
                           (setq org-html-mathjax-options '((path
                                                             "https://cdn.bootcss.com/mathjax/2.7.0/MathJax.js?config=TeX-AMS_HTML")
                                                            (scale "100")
                                                            (align "left")
                                                            (font "TeX")
                                                            (linebreaks "false")
                                                            (autonumber "AMS")
                                                            (indent "2em")
                                                            (multlinewidth "85%")
                                                            (tagindent ".8em")
                                                            (tagside "left")))
                           (setq org-publish-project-alist '(("note-org" :base-directory
                                                              "~/repos/notes/org"
                                                              :publishing-directory  "~/repos/notes"
                                                              :base-extension "org"
                                                              :recursive t
                                                              :publishing-function
                                                              org-html-publish-to-html
                                                              :headline-levels 3
                                                              :style nil
                                                              :auto-index nil
                                                              :link-home "index.html"
                                                              :section-numbers nil
                                                              :html-preamble nil
                                                              :html-postamble nil
                                                              :auto-sitemap t
                                                              :sitemap-title "chrischen's notes"
                                                              :sitemap-filename "sitemap.org"
                                                              :exclude "sitemap.org")
                                                             ("note-static" :base-directory
                                                              "~/repos/notes/org/resources"
                                                              :publishing-directory
                                                              "~/repos/notes/resources"
                                                              :recursive t
                                                              :base-extension
                                                              "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
                                                              :publishing-function
                                                              org-publish-attachment)
                                                             ("note" :components ("note-org"
                                                                                  "note-static")
                                                              :author "ChrisChen"
                                                              :email "chrischen3121@gmail.com")))))

(add-hook 'org-mode-hook (lambda ()
                           (define-key org-mode-map (kbd "C-c i") #'org-clock-in)
                           (define-key org-mode-map (kbd "C-c o") #'org-clock-out)))


;; org agenda setup
(setq agenda-home-dir "~/Dropbox/todo")
(setq org-agenda-files (directory-files-recursively agenda-home-dir ".org$"))
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

(add-hook 'org-agenda-mode-hook (lambda ()
                                  (setq org-clock-out-remove-zero-time-clocks t)
                                  (setq org-default-notes-file (concat agenda-home-dir
                                                                       "/capture.org"))
                                  ;; (setq org-agenda-log-mode-items '(closed state))
                                  (setq org-deadline-warning-days 5)
                                  (setq org-todo-keywords (quote ((sequence "TODO(t)" "NEXT(n)" "|"
                                                                            "DONE(d)")
                                                                  (sequence "WAITING(w@/!)"
                                                                            "HOLD(h@/!)" "|"
                                                                            "CANCELLED(c@/!)"
                                                                            "MEETING"))))
                                  (setq org-todo-keyword-faces (quote (("TODO" :foreground "red"
                                                                        :weight bold)
                                                                       ("NEXT" :foreground "blue"
                                                                        :weight bold)
                                                                       ("DONE" :foreground
                                                                        "forest green"
                                                                        :weight bold)
                                                                       ("WAITING" :foreground
                                                                        "orange"
                                                                        :weight bold)
                                                                       ("HOLD" :foreground "magenta"
                                                                        :weight bold)
                                                                       ("CANCELLED" :foreground
                                                                        "forest green"
                                                                        :weight bold)
                                                                       ("MEETING" :foreground
                                                                        "forest green"
                                                                        :weight bold))))
                                  (setq org-todo-state-tags-triggers '(("CANCELLED" ("CANCELLED" .
                                                                                     t))
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
                                  (setq org-columns-default-format
                                        "%40ITEM(Task) %TODO %3PRIORITY %17Effort(Effort){:} %10CLOCKSUM")
                                  (setq org-global-properties '(("Effort_ALL" .
                                                                 "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")))))

;; org agenda keybindings
(add-hook 'org-agenda-mode-hook (lambda ()
                                  (define-key org-agenda-mode-map (kbd "C-c i")
                                    #'org-agenda-clock-in)
                                  (define-key org-agenda-mode-map (kbd "C-c o")
                                    #'org-agenda-clock-out)
                                  (define-key org-agenda-mode-map (kbd "C-c v")
                                    #'org-agenda-columns)
                                  (define-key org-agenda-mode-map (kbd "C-c e")
                                    #'org-agenda-set-effort)))

(provide 'cc-doc)
