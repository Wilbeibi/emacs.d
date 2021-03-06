;;(defun color-theme-ice-cream-sundae ()
;;  (interactive)
;;  (color-theme-install
;;   '(color-theme-ice-cream-sundae
;;      ((background-color . "#010513")
;;      (background-mode . dark)
;;      (border-color . "#2a1414")
;;      (cursor-color . "#ffffff")
;;      (foreground-color . "#ddd7c0")
;;      (mouse-color . "black"))
;;     (fringe ((t (:background "#2a1414"))))
;;     (mode-line ((t (:foreground "#ffffff" :background "#370b0b"))))
;;     (region ((t (:background "#323232"))))
;;     (font-lock-builtin-face ((t (:foreground "#bedfda"))))
;;     (font-lock-comment-face ((t (:foreground "#7099cf"))))
;;     (font-lock-function-name-face ((t (:foreground "#d3ffec"))))
;;     (font-lock-keyword-face ((t (:foreground "#c96e00"))))
;;     (font-lock-string-face ((t (:foreground "#a296d0"))))
;;     (font-lock-type-face ((t (:foreground"#34c6e2"))))
;;     (font-lock-constant-face ((t (:foreground "#eeeeec"))))
;;     (font-lock-variable-name-face ((t (:foreground "#eeeeec"))))
;;     (minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
;;     (font-lock-warning-face ((t (:foreground "red" :bold t))))
;;     )))
;;(provide 'color-theme-ice-cream-sundae)

(deftheme ice-cream-sundae
    "ice-cream-sundae")

(custom-theme-set-variables
  'ice-cream-sundae
     '(powerline-color1 "#00779a")
     '(powerline-color2 "#00475a")
     '(linum-format " %7i ")
     '(fringe-mode 6 nil (fringe))
     )


(custom-theme-set-faces
  'ice-cream-sundae

)


(provide-theme 'ice-cream-sundae)

