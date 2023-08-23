;;; style.el --- setting the default view
;;; Commentary:
;;; Code:

;; Theme
(load-theme 'doom-acario-dark t)

;; Set default font
(set-face-attribute 'default nil
                    :family "Fira Code"
                    :height 140
                    :weight 'normal
                    :width 'normal)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(fringe-mode 1)
(setq inhibit-startup-screen t)

;; Fira Code sans
(use-package fira-code-mode
  :custom (fira-code-mode-disabled-ligatures '("[]" "#{" "#(" "#_" "#_(" "x")) ;; List of ligatures to turn off
  :hook prog-mode) ;; Enables fira-code-mode automatically for programming major modes

;;; style.el ends here
