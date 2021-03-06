;;(defun color-theme-amber ()
;;  (interactive)
;;  (color-theme-install
;;   '(color-theme-amber
;;      ((background-color . "#160903")
;;      (background-mode . dark)
;;      (border-color . "#472400")
;;      (cursor-color . "#a35000")
;;      (foreground-color . "#eeeeec")
;;      (mouse-color . "black"))
;;     (fringe ((t (:background "#472400"))))
;;     (mode-line ((t (:foreground "#ffb347" :background "#402008"))))
;;     (region ((t (:background "#482b0f"))))
;;     (font-lock-builtin-face ((t (:foreground "#d56b44"))))
;;     (font-lock-comment-face ((t (:foreground "#888a85"))))
;;     (font-lock-function-name-face ((t (:foreground "#f9971a"))))
;;     (font-lock-keyword-face ((t (:foreground "#ffb633"))))
;;     (font-lock-string-face ((t (:foreground "#b28153"))))
;;     (font-lock-type-face ((t (:foreground"#ff6e1a"))))
;;     (font-lock-constant-face ((t (:foreground "#e9771a"))))
;;     (font-lock-variable-name-face ((t (:foreground "#e05542"))))
;;     (minibuffer-prompt ((t (:foreground "#fa7d00" :bold t))))
;;     (font-lock-warning-face ((t (:foreground "red" :bold t))))
;;     )))
;;(provide 'color-theme-amber)

(deftheme amber
    "amber")

(custom-theme-set-variables
  'amber
     '(powerline-color1 "#00779a")
     '(powerline-color2 "#00475a")
     '(linum-format " %7i ")
     '(fringe-mode 6 nil (fringe))
     )


(custom-theme-set-faces
  'amber

)


(provide-theme 'amber)

