;;; Org-mode --- config
;;; Commentary:
;;; Code:

;; Org-mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

(add-hook 'org-mode-hook 'auto-fill-mode)
(add-hook 'org-mode-hook 'flycheck-mode)

;;; org.el ends here
