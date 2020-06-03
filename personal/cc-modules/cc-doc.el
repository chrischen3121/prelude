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

(provide 'cc-doc)
