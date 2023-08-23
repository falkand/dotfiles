;;; package --- Summary
;;; Commentary:
;;; Code:

;; LSP
;; The Language Server Protocol (LSP) is an open, JSON-RPC-based
;; protocol for use between source code editors or integrated
;; development environments (IDEs) and servers that provide
;; programming language-specific features. The goal of the protocol is
;; to allow programming language support to be implemented and
;; distributed independently of any given editor or IDE.
(use-package lsp-mode
  :commands lsp)

;; Rust
(use-package flycheck-rust
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(use-package rust-mode
  :hook (rust-mode . lsp))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

;; C/C++
(setq c-default-style "gnu")

;; Java
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2)))

;; etc
(setq-default indent-tabs-mode nil)

;;; ide.el ends here
