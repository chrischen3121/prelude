(use-package
  spacemacs-theme
  :defer t
  :init (defvar default-theme 'spacemacs-light) ; light
  ;; (defvar default-theme 'zenburn) ; dark
  )

(if (daemonp)
    (add-hook 'after-make-frame-functions (lambda (frame)
                                            (select-frame frame)
                                            (load-theme default-theme)))
  (load-theme default-theme))

(provide 'cc-theme)
