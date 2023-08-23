;;; package --- summary
;;; Commentary:
;;; Code:

(setq epg-gpg-program "gpg")
(require 'epa-file)
;; (epa-file-enable)
(setq epa-file-select-keys nil)
(setq epg-pinentry-mode 'loopback)

;;; gpg.el ends here
