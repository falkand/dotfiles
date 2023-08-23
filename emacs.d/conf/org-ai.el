;;; Org-mode --- config
;;; Commentary:
;;; Code:

(use-package org-ai
  :ensure t
  :commands (org-ai-mode
             org-ai-global-mode)
  :init
  (add-hook 'org-mode-hook #'org-ai-mode) ; enable org-ai in org-mode
  (org-ai-global-mode) ; installs global keybindings on C-c M-a
  :config
  (setq org-ai-openai-api-token "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")
  (setq org-ai-default-chat-model "gpt-4")) ; if you are on the gpt-4 beta:
;;  (setq org-ai-default-chat-model "gpt-4-0613")) ; if you are on the gpt-4 beta:

;;  (org-ai-install-yasnippets)) ; if you are using yasnippet and want `ai` snippets

;;; org-ai.el ends here
