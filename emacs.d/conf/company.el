;;; company.el --- Summary
;;; Commentary:
;;; Code:

;; ;; Company
;; ;; Company is a text completion framework for Emacs. The name stands
;; ;; for "complete anything". It uses pluggable back-ends and front-ends
;; ;; to retrieve and display completion candidates.
(use-package company
;;  :hook (prog-mode . company-mode)
  :config (setq company-tooltip-align-annotations t)
  (setq company-minimum-prefix-length 1))

(add-hook 'after-init-hook 'global-company-mode)

;;; company.el ends here
