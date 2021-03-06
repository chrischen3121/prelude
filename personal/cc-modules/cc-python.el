;; pip install -U black isort pytest autoflake
;; pip install -U jedi json-rpc service_factory ;; anaconda-mode deps
(prelude-require-packages '(pyenv-mode blacken py-isort sphinx-doc pytest pippel ein)) ;;autoflake, DAP, pycoverage

;; remove prelude-python-mode-set-encoding
(defun python-mode-defaults ()
  "Defaults for Python programming."
  ;; (subword-mode +1)
  (anaconda-mode 1)
  (eldoc-mode 1)
  (anaconda-eldoc-mode 1)
  (sphinx-doc-mode 1)
  ;; (setq-local electric-layout-rules '((?: . (lambda ()
  ;;                                             (and (zerop (first (syntax-ppss)))
  ;;                                                  (python-info-statement-starts-block-p)
  ;;                                                  'after)))))
  ;; (add-hook 'post-self-insert-hook #'electric-layout-post-self-insert-function nil 'local)
  )
(setq prelude-python-mode-hook #'python-mode-defaults)

;; pyenv
(use-package
  pyenv-mode
  :defer t
  :bind ((:map pyenv-mode-map)
         ("C-c C-s" . nil)
         ("C-c C-u" . nil)))

(defun pyenv-mode-set-local-version ()
  "Set pyenv version from \".python-version\" by looking in parent directories."
  (interactive)
  (let ((root-path (locate-dominating-file default-directory ".python-version")))
    (when root-path (let* ((file-path (expand-file-name ".python-version" root-path))
                           (version (with-temp-buffer (insert-file-contents-literally file-path)
                                                      (buffer-substring-no-properties
                                                       (line-beginning-position)
                                                       (line-end-position)))))
                      (if (member version (pyenv-mode-versions))
                          (pyenv-mode-set version)
                        (message "pyenv: version `%s' is not installed (set by %s)" version
                                 file-path))))))
(add-hook 'python-mode-hook (lambda ()
                              (pyenv-mode)
                              (pyenv-mode-set-local-version)))
(add-hook 'projectile-after-switch-project-hook #'pyenv-mode-set-local-version)



;; set python max line length
(defcustom python-max-line-length 100
  "Line length to enforce."
  :type 'integer
  :safe 'integerp
  :group 'cc-python)

(use-package
  blacken
  :defer t
  :config (customize-set-variable 'blacken-line-length python-max-line-length))

(use-package
  py-isort
  :defer t
  :config (customize-set-variable 'py-isort-options `(,(format "-l %d" python-max-line-length))))

(use-package
  sphinx-doc-mode
  :defer t
  :bind (:map python-mode-map
              ("C-c M-d" . nil)
              ("C-c C-d" . sphinx-doc)))

;; format buffer
(defun py-format-buffer ()
  (interactive)
  (blacken-buffer)
  (py-isort-buffer))

;; sphinx-doc
;; (add-hook 'python-mode-hook (lambda ()
;;                               (sphinx-doc-mode t)
;;                               (local-unset-key (kbd "C-c M-d"))
;;                               (define-key python-mode-map (kbd "C-c C-d") 'sphinx-doc)))

;; pytest
(add-hook 'python-mode-hook (lambda ()
                              (which-key-add-key-based-replacements "C-c t" "pytest")
                              (define-key python-mode-map (kbd "C-c t a") 'pytest-all)
                              (define-key python-mode-map (kbd "C-c t m") 'pytest-module)
                              (define-key python-mode-map (kbd "C-c t o") 'pytest-one)
                              (define-key python-mode-map (kbd "C-c t d") 'pytest-directory)
                              (define-key python-mode-map (kbd "C-c t p") 'pytest-pdb-one)))

;; flycheck
(add-hook 'python-mode-hook (lambda ()
                              ;; run python-pylint only if python-flake8 produced no errors
                              (flycheck-add-next-checker 'python-flake8 'python-pylint)
                              ;; run python-mypy only if python-pylint produced no errors
                              ;; (flycheck-add-next-checker 'python-pylint '(warning . python-mypy))
                              ))

;; flyspell
(add-hook 'python-mode-hook (lambda ()
                              (flyspell-mode-off)))

;; ein(Emacs IPython Notebook)
;; TODO: integration with org
(add-hook 'ein:notebook-mode-hook (lambda ()
                                    (local-unset-key (kbd "C-c M-{"))
                                    (local-unset-key (kbd "C-c M-}"))
                                    (local-unset-key (kbd "C-c C-t"))
                                    (local-unset-key (kbd "C-c C-u"))
                                    (local-unset-key (kbd "C-c C-o"))
                                    (define-key ein:notebook-mode-map (kbd "S-<return>")
                                      'ein:worksheet-execute-cell-and-goto-next-km)
                                    (define-key ein:notebook-mode-map (kbd "M-p")
                                      'ein:worksheet-goto-prev-input-km)
                                    (define-key ein:notebook-mode-map (kbd "M-n")
                                      'ein:worksheet-goto-next-input-km)
                                    (define-key ein:notebook-mode-map (kbd "C-c p")
                                      'ein:worksheet-insert-cell-above)
                                    (define-key ein:notebook-mode-map (kbd "C-c n")
                                      'ein:worksheet-insert-cell-below)
                                    (define-key ein:notebook-mode-map (kbd "C-c s")
                                      'ein:worksheet-split-cell-at-point)
                                    (define-key ein:notebook-mode-map (kbd "C-c t")
                                      'ein:worksheet-change-cell-type)
                                    (define-key ein:notebook-mode-map (kbd "C-c r")
                                      'ein:notebook-rename-command-km)
                                    (define-key ein:notebook-mode-map (kbd "C-c C-f")
                                      'ein:notebook-open-km)))

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
                                'anaconda-mode-find-assignments-other-frame)
                              (define-key python-mode-map (kbd "C-c ?") 'anaconda-mode-show-doc)
                              (define-key python-mode-map (kbd "C-c C-l") 'pippel-list-packages)
                              (define-key python-mode-map (kbd "C-c f") #'py-format-buffer)))
(provide 'cc-python)
