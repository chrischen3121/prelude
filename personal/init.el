(package-initialize)
(unless package-archive-contents (package-refresh-contents))

(prelude-require-packages
 '(use-package))
(defconst cc-modules-dir (expand-file-name "cc-modules" prelude-personal-dir))
(add-to-list 'load-path cc-modules-dir)
(message "Loading chrischen's modules...")

(require 'cc-theme)
(require 'cc-better-defaults)
(require 'cc-doc)
(require 'cc-agenda)
(require 'cc-dev)
(require 'cc-python)
(require 'cc-cpp)
(require 'cc-elisp)
(require 'cc-rst)

(message "Happy Hacking!🌅🚣🏝️")
