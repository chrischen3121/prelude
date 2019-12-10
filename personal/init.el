(defvar cc-modules-dir (expand-file-name "cc-modules" prelude-personal-dir))
(add-to-list 'load-path cc-modules-dir)

(message "Loading chrischen's modules...")
(load "cc-keybindings")
(message "Happy Hacking!🌅🚣🏝️")
