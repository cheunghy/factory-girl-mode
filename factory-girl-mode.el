;;; factory-girl-mode.el --- enhance ruby-mode for factory-girl

;; Copyright (C) 2014 Zhang Kai Yu
;; Author: Zhang Kai Yu
;; URL: https://github.com/cheunghy/factory-girl-mode
;; Created: 2014
;; Version: 0.01
;; Keywords: factory girl ruby test spec rspec
;; Package-Requires: ((ruby-mode "1.0"))

;; This file is NOT part of GNU Emacs.
;;
;; TODO: Copyright Declaration.

;;; Commentary:
;;
;; This minor mode brings several snippets to ruby-mode in the contexts
;; of factory girl.

;;; Code:
(require 'ruby-mode)
(require 'ansi-color)

(defgroup factory-girl-mode nil
  "Factory girl minor mode."
  :group 'languages)

(defcustom factory-girl-use-snippet t
  "When t, factory girl mode should add factory girl snippets to yasnippet.")

;;;###autoload
(define-minor-mode factory-girl-mode
  "Minor mode for factory girl files

\\{factory-girl-mode-map}"
  :lighter "" :keymap )

(defvar factory-girl-snippets-dir
  (let ((current (or load-file-name (buffer-file-name))))
    (expand-file-name "snippets" (file-name-directory current)))
  "The directory containing factory girl snippets.")

(defun factory-girl-install-snippets ()
  "Add `factory-girl-snippets-dir' to `yas-snippet-dirs' and \
load snippets from it."
  (require 'yasnippet)
  (add-to-list 'yas-snippet-dirs factory-girl-snippets-dir))

;; Hook up all Ruby buffers.
;;;###autoload
(dolist (hook '(ruby-mode-hook enh-ruby-mode-hook))
  (add-hook hook 'factory-enable-appropriate-mode))

(provide 'factory-girl-mode)
;;; factory-girl-mode.el ends here
