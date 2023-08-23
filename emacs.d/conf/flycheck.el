;;; flycheck.el --- Summary
;;; Commentary:
;;; Code:

;; Flycheck
;; Flycheck is a modern on-the-fly syntax checking extension for GNU
;; Emacs, intended as replacement for the older Flymake extension
;; which is part of GNU Emacs.
(require 'flycheck-yamllint)
(require 'flycheck-languagetool)

(use-package flycheck
  :ensure t
  :hook ((prog-mode . flycheck-mode)
         (yaml-mode . flycheck-mode))
  :init (global-flycheck-mode))

(use-package flycheck-languagetool
  :ensure t
  :hook (org-mode . flycheck-languagetool-setup)
  :init
  (setq flycheck-languagetool-server-jar "~/.local/bin/LanguageTool-6.2/languagetool-server.jar"))

(with-eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook 'flycheck-yamllint-setup))

;;; flycheck.el ends here
