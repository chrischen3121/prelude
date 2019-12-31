(defvar cc-modules-dir (expand-file-name "cc-modules" prelude-personal-dir))
(add-to-list 'load-path cc-modules-dir)
(message "Loading chrischen's modules...")

(require 'cc-better-defaults)
(require 'cc-keybindings)

(message "Happy Hacking!🌅🚣🏝️")
