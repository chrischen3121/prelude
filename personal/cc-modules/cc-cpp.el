;;; cc-cpp.el --- summary -*- lexical-binding: t -*-

;; Author: chrischen
;; Maintainer: chrischen

;; This file is not part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.


;;; Commentary:

;; commentary

;;; Code:
(prelude-require-packages '(ggtags))

(add-hook 'c-mode-common-hook (lambda ()
                                (when (derived-mode-p 'c-mode 'c++-mode 'asm-mode)
                                  (ggtags-mode 1)
                                  (define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
                                  (define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
                                  (define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
                                  (define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
                                  (define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
                                  (define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

                                  (define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)
                                  )))


(provide 'cc-cpp)

;;; cc-cpp.el ends here
