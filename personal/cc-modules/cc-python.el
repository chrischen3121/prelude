(prelude-require-package 'anaconda-mode)

(when (boundp 'company-backends)
  (prelude-require-package 'company-anaconda)
  (add-to-list 'company-backends 'company-anaconda))

(require 'electric)
(require 'prelude-programming)

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

(add-hook 'python-mode-hook (lambda ()
                              (run-hooks 'prelude-python-mode-hook)))

(provide 'cc-python)
