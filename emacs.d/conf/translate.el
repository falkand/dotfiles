;;; translate.el --- setting the default view
;;; Commentary:
;;; Code:

(require 'go-translate)

(setq gts-translate-list '(("ru" "en")))

(setq gts-default-translator
      (gts-translator
       :picker (gts-prompt-picker)
       :engines (list (gts-bing-engine) (gts-google-engine))
       :render (gts-buffer-render)))

;;; translate.el ends here
