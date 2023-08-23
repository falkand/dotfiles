;;; init.el --- Emacs configuration
;;; Commentary:
;;; Code:

;; Adding MELPA repository
(load "~/.emacs.d/conf/melpa.el")

;; Load style.el
(load "~/.emacs.d/conf/style.el")

;; Load translate.el
(load "~/.emacs.d/conf/translate.el")

;; Bootstrap `use-package`
(load "~/.emacs.d/conf/use-package.el")

;; Load autoupdate.el
(load "~/.emacs.d/conf/autoupdate.el")

;; Load cht.sh.el
(load "~/.emacs.d/conf/cht.sh.el")

;; Load flycheck.el
(load "~/.emacs.d/conf/flycheck.el")

;; etc
(setq make-backup-files nil)
(setq visible-bell 1)
(guru-global-mode 1)
(require 'xclip)
(xclip-mode 1)

(defun indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))
(global-set-key [f12] 'indent-buffer)

(defun dired-dotfiles-toggle ()
  "Show/hide dot-files"
  (interactive)
  (when (equal major-mode 'dired-mode)
    (if (or (not (boundp 'dired-dotfiles-show-p)) dired-dotfiles-show-p) ; if currently showing
	(progn
	  (set (make-local-variable 'dired-dotfiles-show-p) nil)
	  (message "h")
	  (dired-mark-files-regexp "^\\\.")
	  (dired-do-kill-lines))
      (progn (revert-buffer) ; otherwise just revert to re-show
	     (set (make-local-variable 'dired-dotfiles-show-p) t)))))

;; Execute.el
(setq load-path (cons "~/.emacs.d/lisp" load-path))
(require 'execute)

;; Helm
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x b") #'helm-mini)
(helm-mode 1)

;; Ace jump buffer
(global-set-key (kbd "C-x o") #'ace-window)

;; Avy
(global-set-key (kbd "M-g e") 'avy-goto-word-0)
(global-set-key (kbd "C-:") 'avy-goto-char)

;; IDE
(load "~/.emacs.d/conf/ide.el")

;; Company
(load "~/.emacs.d/conf/company.el")

;; Org-mode
(load "~/.emacs.d/conf/org.el")
(load "~/.emacs.d/conf/org-roam.el")
(global-set-key (kbd "C-x r") 'org-roam-node-find)

;; Org-ai-mode
(load "~/.emacs.d/conf/org-ai.el")

;; GPG
(load "~/.emacs.d/conf/gpg.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554" "70b596389eac21ab7f6f7eb1cf60f8e60ad7c34ead1f0244a577b1810e87e58c" "afa47084cb0beb684281f480aa84dab7c9170b084423c7f87ba755b15f6776ef" "251ed7ecd97af314cd77b07359a09da12dcd97be35e3ab761d4a92d8d8cf9a71" "b99e334a4019a2caa71e1d6445fc346c6f074a05fcbb989800ecbe54474ae1b0" "2f8eadc12bf60b581674a41ddc319a40ed373dd4a7c577933acaff15d2bf7cc6" "2853dd90f0d49439ebd582a8cbb82b9b3c2a02593483341b257f88add195ad76" "a589c43f8dd8761075a2d6b8d069fc985660e731ae26f6eddef7068fece8a414" "b9761a2e568bee658e0ff723dd620d844172943eb5ec4053e2b199c59e0bcc22" "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "ddffe74bc4bf2c332c2c3f67f1b8141ee1de8fd6b7be103ade50abb97fe70f0c" "7e068da4ba88162324d9773ec066d93c447c76e9f4ae711ddd0c5d3863489c52" "ce4234c32262924c1d2f43e6b61312634938777071f1129c7cde3ebd4a3028da" "2078837f21ac3b0cc84167306fa1058e3199bbd12b6d5b56e3777a4125ff6851" "94adc319e207c4e9fc5fcec552387dbd4a999fa30081b2a98dfa6430ac4f75dd" "5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" "7ea883b13485f175d3075c72fceab701b5bf76b2076f024da50dff4107d0db25" "1a1ac598737d0fcdc4dfab3af3d6f46ab2d5048b8e72bc22f50271fd6d393a00" "b54376ec363568656d54578d28b95382854f62b74c32077821fdfd604268616a" "be84a2e5c70f991051d4aaf0f049fa11c172e5d784727e0b525565bb1533ec78" "00cec71d41047ebabeb310a325c365d5bc4b7fab0a681a2a108d32fb161b4006" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "9d29a302302cce971d988eb51bd17c1d2be6cd68305710446f658958c0640f68" "f053f92735d6d238461da8512b9c071a5ce3b9d972501f7a5e6682a90bf29725" "991ca4dbb23cab4f45c1463c187ac80de9e6a718edc8640003892a2523cb6259" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "a3010c151dc4f42d56dec26a85ae5640afc227bece71d058e394667718b66a49" "adaf421037f4ae6725aa9f5654a2ed49e2cd2765f71e19a7d26a454491b486eb" "443e2c3c4dd44510f0ea8247b438e834188dc1c6fb80785d83ad3628eadf9294" "1aa4243143f6c9f2a51ff173221f4fd23a1719f4194df6cef8878e75d349613d" "5586a5db9dadef93b6b6e72720205a4fa92fd60e4ccfd3a5fa389782eab2371b" "683b3fe1689da78a4e64d3ddfce90f2c19eb2d8ab1bab1738a63d8263119c3f4" "4ff1c4d05adad3de88da16bd2e857f8374f26f9063b2d77d38d14686e3868d8d" "016f665c0dd5f76f8404124482a0b13a573d17e92ff4eb36a66b409f4d1da410" "49acd691c89118c0768c4fb9a333af33e3d2dca48e6f79787478757071d64e68" "eca44f32ae038d7a50ce9c00693b8986f4ab625d5f2b4485e20f22c47f2634ae" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce" "a44e2d1636a0114c5e407a748841f6723ed442dc3a0ed086542dc71b92a87aee" "a138ec18a6b926ea9d66e61aac28f5ce99739cf38566876dc31e29ec8757f6e2" "570263442ce6735821600ec74a9b032bc5512ed4539faf61168f2fdf747e0668" "8b6506330d63e7bc5fb940e7c177a010842ecdda6e1d1941ac5a81b13191020e" "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "dc8285f7f4d86c0aebf1ea4b448842a6868553eded6f71d1de52f3dcbc960039" "f458b92de1f6cf0bdda6bce23433877e94816c3364b821eb4ea9852112f5d7dc" "512ce140ea9c1521ccaceaa0e73e2487e2d3826cc9d287275550b47c04072bc4" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "680f62b751481cc5b5b44aeab824e5683cf13792c006aeba1c25ce2d89826426" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" "6945dadc749ac5cbd47012cad836f92aea9ebec9f504d32fe89a956260773ca4" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "dea4b7d43d646aa06a4f705a58f874ec706f896c25993fcf73de406e27dc65ba" "c0f4b66aa26aa3fded1cbefe50184a08f5132756523b640f68f3e54fd5f584bd" "eb122e1df607ee9364c2dfb118ae4715a49f1a9e070b9d2eb033f1cefd50a908" "4eb69f17b4fa0cd74f4ff497bb6075d939e8d8bf4321ce8b81d13974000baac1" "bd82c92996136fdacbb4ae672785506b8d1d1d511df90a502674a51808ecc89f" "57e3f215bef8784157991c4957965aa31bac935aca011b29d7d8e113a652b693" "7b1ea77093c438aa5887b2649ca079c896cc8780afef946d3b6c53931081a726" "b77a00d5be78f21e46c80ce450e5821bdc4368abf4ffe2b77c5a66de1b648f10" "0d75aa06198c4245ac2a8877bfc56503d5d8199cc85da2c65a6791b84afb9024" "cafebef22e58ed5b47b1afb8fd3a4deb26a8d6addcd297cc3e8b415ceb8a17a6" "60317874283814fe51bda023c1fc26dc983db0853796d5cd6dfd09d7331fc77a" "08e9ac555b44325be211da0b0a16dc2de9c2405d0f963c3c740802ebf48a4a15" "9685cefcb4efd32520b899a34925c476e7920725c8d1f660e7336f37d6d95764" "db7f422324a763cfdea47abf0f931461d1493f2ecf8b42be87bbbbbabf287bfe" default))
 '(default-input-method "russian-computer")
 '(org-format-latex-options
   '(:foreground default :background default :scale 2.0 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(package-selected-packages
   '(projectile-ripgrep projectile company-auctex company-ctags company-c-headers company-go company-math company-nginx company-org-block company-shell languagetool flycheck-languagetool lsp-grammarly grammarly org flymake-shellcheck ansible company-ansible flycheck-google-cpplint flycheck-pyflakes flycheck-grammarly flycheck-yamllint flymake-yamllint fira-code-mode go-translate org-ai racket-mode bazel editorconfig auto-package-update org-roam-ui xclip dockerfile-mode doom-themes scala-mode magit gitlab-ci-mode gitlab-ci-mode-flycheck ssh use-package transmission toml-mode toml sudo-edit rust-mode restclient org-beautify-theme lsp-mode helm-w3m helm-org helm-icons haskell-mode guru-mode geiser-guile flycheck-rust counsel company cargo ace-jump-buffer)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
