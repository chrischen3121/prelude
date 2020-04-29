(prelude-require-packages '(pyenv-mode pytest blacken)) ; py-isort

; remove prelude-python-mode-set-encoding
(defun prelude-python-mode-defaults ()
  "Defaults for Python programming."
  (subword-mode +1)
  (anaconda-mode 1)
  (eldoc-mode 1)
  (setq-local electric-layout-rules
              '((?: . (lambda ()
                        (and (zerop (first (syntax-ppss)))
                             (python-info-statement-starts-block-p)
                             'after)))))
  (when (fboundp #'python-imenu-create-flat-index)
    (setq-local imenu-create-index-function
                #'python-imenu-create-flat-index))
  (add-hook 'post-self-insert-hook
            #'electric-layout-post-self-insert-function nil 'local))
(setq prelude-python-mode-hook 'prelude-python-mode-defaults)

;; pyenv
(defun pyenv-mode-set-local-version ()
  "Set pyenv version from \".python-version\" by looking in parent directories."
  (interactive)
  (let ((root-path (locate-dominating-file default-directory
                                           ".python-version")))
    (when root-path
      (let* ((file-path (expand-file-name ".python-version" root-path))
             (version
              (with-temp-buffer
                (insert-file-contents-literally file-path)
                (buffer-substring-no-properties (line-beginning-position)
                                                (line-end-position)))))
        (if (member version (pyenv-mode-versions))
            (pyenv-mode-set version)
          (message "pyenv: version `%s' is not installed (set by %s)"
                   version file-path))))))
(add-hook 'python-mode-hook
          (lambda ()
            (pyenv-mode)
            (pyenv-mode-set-local-version)))
(add-hook 'projectile-after-switch-project-hook 'pyenv-mode-set-local-version)

;; blacken
(custom-set-variables '(blacken-line-length 100))
(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map (kbd "<backtab>") 'blacken-buffer)))

;; pytest
(add-hook 'python-mode-hook
          (lambda ()
            (which-key-add-key-based-replacements "C-c t" "pytest")
            (define-key python-mode-map (kbd "C-c t a") 'pytest-all)
            (define-key python-mode-map (kbd "C-c t m") 'pytest-module)
            (define-key python-mode-map (kbd "C-c t o") 'pytest-one)
            (define-key python-mode-map (kbd "C-c t d") 'pytest-directory)
            (define-key python-mode-map (kbd "C-c t p") 'pytest-pdb-one)))

;; keybindings
(add-hook 'python-mode-hook (lambda ()
                              (which-key-add-key-based-replacements "C-c C-t" "python-skeleton")
                              (define-key python-mode-map (kbd "C-x 4 M-.")
                                'anaconda-mode-find-definitions-other-window)
                              (define-key python-mode-map (kbd "C-x 5 M-.")
                                'anaconda-mode-find-definitions-other-frame)
                              (define-key python-mode-map (kbd "C-x 4 M-r")
                                'anaconda-mode-find-references-other-window)
                              (define-key python-mode-map (kbd "C-x 5 M-r")
                                'anaconda-mode-find-references-other-frame)
                              (define-key python-mode-map (kbd "C-x 4 M-=")
                                'anaconda-mode-find-assignments-other-window)
                              (define-key python-mode-map (kbd "C-x 5 M-=")
                                'anaconda-mode-find-assignments-other-frame)))
(provide 'cc-python)
