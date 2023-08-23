;;; package --- Summary:
;;; Commentary:
;;  Org-roam init config.  Org-roam directory can be unmount.  Check it first.
;;; Code:

(setq org-roam-directory "~/encfs/org-roam")
(setq buffer-to-message "*scratch*")

(setq org-roam-db-location (format "~/.emacs.d/%s-org-roam.db" (system-name)))

(defun message-to-buffer (message-to-send)
  "Send MESSAGE-TO-SEND to buffer-to-message."
  (with-current-buffer buffer-to-message
    (insert message-to-send)))

(if (file-directory-p org-roam-directory)
    (progn (setq org-roam-directory (file-truename org-roam-directory))
	   (org-roam-db-autosync-mode))
  (message-to-buffer (format ";; Directory %s do not exist." org-roam-directory)))

;;; org-roam.el ends here
