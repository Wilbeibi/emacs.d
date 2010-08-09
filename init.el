;; NTEmacs/w32 init.el 

;; Load plugins...
(load "~/.emacs.d/plugins.el")

;; turn off menubar - uncomment
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; turn off toolbar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

(require 'yasnippet-bundle)

;; Customize stuff... 
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-install-save-confirm nil)
 '(color-theme-illegal-faces "^w3-")
 '(color-theme-is-cumulative t)
 '(color-theme-mode-hook nil)
 '(ediff-custom-diff-program "diff")
 '(ediff-diff-program "diff")
 '(ediff-diff3-program "diff3")
 '(fringe-mode 16 nil (fringe))
 '(global-hl-line-mode nil)
 '(global-linum-mode t)
 '(indicate-buffer-boundaries (quote right))
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(initial-major-mode (quote markdown-mode))
 '(initial-scratch-message nil)
 '(linum-delay nil)
 '(linum-eager t)
 '(linum-format " %5d ")
 '(mode-line-format (quote ("%e" #(" " 0 1 (help-echo "mouse-1: Select (drag to resize)
mouse-2: Make current window occupy the whole frame
mouse-3: Remove current window from display")) mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification #("   " 0 3 (help-echo "mouse-1: Select (drag to resize)
mouse-2: Make current window occupy the whole frame
mouse-3: Remove current window from display")) mode-line-position (vc-mode vc-mode) #("  " 0 2 (help-echo "mouse-1: Select (drag to resize)
mouse-2: Make current window occupy the whole frame
mouse-3: Remove current window from display")) mode-line-modes (which-func-mode ("" which-func-format #("  " 0 2 (help-echo "mouse-1: Select (drag to resize)
mouse-2: Make current window occupy the whole frame
mouse-3: Remove current window from display")))) (global-mode-string ("" global-mode-string #("  " 0 2 (help-echo "mouse-1: Select (drag to resize)
mouse-2: Make current window occupy the whole frame
mouse-3: Remove current window from display")))) #("-%+" 0 1 (help-echo "mouse-1: Select (drag to resize)
mouse-2: Make current window occupy the whole frame
mouse-3: Remove current window from display")))))
 '(speedbar-use-images nil)
 '(tabbar-background-color "grey20")
 '(tabbar-mode t nil (tabbar))
 '(tabbar-separator (quote (0.2)))
 '(yas/global-mode t nil (yasnippet))
 '(yas/prompt-functions (quote (yas/dropdown-prompt yas/x-prompt yas/completing-prompt yas/ido-prompt yas/no-prompt)))
 '(yas/triggers-in-field t)
 '(yas/wrap-around-region t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#041b09" :foreground "#eceeed" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "Monaco"))))
 '(cursor ((t (:background "#5599bb" :foreground "white"))))
 '(custom-button ((((type x w32 ns) (class color)) (:background "lightgrey" :foreground "black" :box (:line-width 2 :style released-button) :family "Trebuchet MS"))))
 '(custom-button-mouse ((((type x w32 ns) (class color)) (:background "grey90" :foreground "black" :box (:line-width 2 :style released-button) :family "Trebuchet MS"))))
 '(custom-button-pressed ((((type x w32 ns) (class color)) (:background "lightgrey" :foreground "black" :box (:line-width 2 :style pressed-button) :family "Trebuchet MS"))))
 '(fringe ((((class color) (background dark)) (:background "#111111" :foreground "white"))))
 '(hl-line ((t (:inherit highlight :background "#191929"))))
 '(hs-face ((t (:inherit variable-pitch :background "#300" :foreground "grey70" :box nil :height 0.8))))
 '(lazy-highlight ((((class color) (min-colors 88) (background dark)) (:background "#002244"))))
 '(linum ((t (:inherit font-lock-constant-face :weight normal :height 0.8))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.7))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.5))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.3))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.2))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.1))))
 '(mode-line ((t (:background "grey30" :foreground "gray90" :weight light :height 0.8 :family "verdana"))))
 '(mode-line-buffer-id ((t (:inherit mode-line :weight bold))))
 '(mode-line-emphasis ((t (:inherit mode-line :weight bold))))
 '(mode-line-highlight ((t nil)))
 '(region ((t (:background "#993300"))))
 '(secondary-selection ((((class color) (min-colors 88) (background dark)) (:background "#2200BB"))))
 '(speedbar-button-face ((((class color) (background dark)) (:inherit variable-pitch :foreground "green3" :height 0.8))))
 '(speedbar-directory-face ((((class color) (background dark)) (:inherit speedbar-button-face :foreground "light blue"))))
 '(speedbar-file-face ((((class color) (background dark)) (:inherit speedbar-button-face :foreground "cyan"))))
 '(speedbar-highlight-face ((((class color) (background dark)) (:inherit speedbar-button-face :background "sea green"))))
 '(speedbar-selected-face ((((class color) (background dark)) (:inherit speedbar-button-face :foreground "red" :underline t))))
 '(speedbar-separator-face ((((class color) (background dark)) (:inherit speedbar-button-face :background "blue" :foreground "white" :overline "gray"))))
 '(speedbar-tag-face ((((class color) (background dark)) (:inherit speedbar-button-face :foreground "yellow"))))
 '(tabbar-default ((t (:height 0.9 :family "Arial"))))
 '(tabbar-highlight ((t (:background "white" :foreground "black" :box (:line-width 4 :color "white")))))
 '(tabbar-selected ((t (:inherit tabbar-default :background "grey60" :foreground "black" :box (:line-width 4 :color "grey60")))))
 '(tabbar-unselected ((t (:inherit tabbar-default :background "grey20" :box (:line-width 4 :color "grey20")))))
 '(tooltip ((default nil) (nil nil)))
 '(vhdl-speedbar-architecture-face ((((class color) (background dark)) (:inherit speedbar-button-face :foreground "LightSkyBlue"))))
 '(vhdl-speedbar-architecture-selected-face ((((class color) (background dark)) (:inherit speedbar-button-face :foreground "LightSkyBlue" :underline t))))
 '(vhdl-speedbar-configuration-face ((((class color) (background dark)) (:inherit speedbar-button-face :foreground "Salmon"))))
 '(vhdl-speedbar-configuration-selected-face ((((class color) (background dark)) (:inherit speedbar-button-face :foreground "Salmon" :underline t))))
 '(vhdl-speedbar-entity-face ((((class color) (background dark)) (:inherit speedbar-button-face :foreground "PaleGreen"))))
 '(vhdl-speedbar-entity-selected-face ((((class color) (background dark)) (:inherit speedbar-button-face :foreground "PaleGreen" :underline t))))
 '(vhdl-speedbar-instantiation-face ((((min-colors 88) (class color) (background dark)) (:inherit speedbar-button-face :foreground "Yellow1"))))
 '(vhdl-speedbar-instantiation-selected-face ((((class color) (background dark)) (:inherit speedbar-button-face :foreground "Yellow" :underline t))))
 '(vhdl-speedbar-library-face ((((class color) (background dark)) (:inherit speedbar-button-face :foreground "Orchid1"))))
 '(vhdl-speedbar-package-face ((((class color) (background dark)) (:inherit speedbar-button-face :foreground "Grey80"))))
 '(vhdl-speedbar-package-selected-face ((((class color) (background dark)) (:inherit speedbar-button-face :foreground "Grey80" :underline t))))
 '(vhdl-speedbar-subprogram-face ((((class color) (background dark)) (:inherit speedbar-button-face :foreground "BurlyWood2")))))

(put 'set-goal-column 'disabled nil)

(color-theme-jadedragon-660650)