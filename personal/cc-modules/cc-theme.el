(prelude-require-package 'spacemacs-theme)

(defvar default-theme 'spacemacs-light) ; 'zenburn

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (select-frame frame)
                (load-theme default-theme)))
  (load-theme default-theme))

(provide 'cc-theme)
