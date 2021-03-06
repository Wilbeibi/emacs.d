;;                       _                                             _       _ 
;;    ___   ___ ___   __| | ___     ___ _ __ ___   __ _  ___ ___    __| | ___ | |_ 
;;   / _ \ / __/ _ \ / _` |/ _ \   / _ \ '_ ` _ \ / _` |/ __/ __|  / _` |/ _ \| __|
;;  | (_) | (_| (_) | (_| | (_) | |  __/ | | | | | (_| | (__\__ \ | (_| | (_) | |_ 
;;   \___/ \___\___/ \__,_|\___/   \___|_| |_| |_|\__,_|\___|___/  \__,_|\___/ \__|
;;                                          
;; dirty, but cheap way to get .emacs.d subfolders into the load path,
;; and then return us to the user home directory, for find-file etc.

;; Include common lisp
(require 'cl)

(progn (cd "~/.emacs.d/") (normal-top-level-add-subdirs-to-load-path) (cd "~"))

;; Modes init (things that need more than just a require.) 
(when (string-match "Emacs 24" (version))
  (message "Running Emacs 24")
  ;; Only run elpa on E24
  (require 'init-elpa)
)

;; turn off toolbar.
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; menu bar mode only on OS X, just because it's pretty much out of
;; the way, as opposed to sitting right there in the frame.
(if  (and (window-system) (eq system-type 'darwin))
    (menu-bar-mode 1)
  (menu-bar-mode -1)
)

;; manually installed packages (find them in ./plugins/) - these could
;; probably all become auto-loaded. (next time)
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;; AsciiDoc mode
(autoload 'asciidoc-mode "asciidoc-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.asciidoc$" . asciidoc-mode))

;; Rainbow mode for css automatically
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Git gutter global mode
(add-hook 'prog-mode-hook 'git-gutter-mode)

;; Smoother scrolling (no multiline jumps.)
(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; show paren mode
(show-paren-mode 1)
(setq show-paren-delay 0)

;; prefer y / n to typing yes / no, but with power comes
;; responsibility.  Comment out for standard speed-cripling yes/no
;; behaviour.
(fset 'yes-or-no-p 'y-or-n-p)

;; allow advanced features
(put 'set-goal-column  'disabled nil)
(put 'erase-buffer     'disabled nil)
(put 'downcase-region  'disabled nil)
(put 'upcase-region    'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page   'disabled nil)

;; Lorem-ipsum hook for nxml modes
(add-hook 'nxml-mode-hook (lambda ()
			    (setq Lorem-ipsum-paragraph-separator "<br><br>\n"
				  Lorem-ipsum-sentence-separator "&nbsp;&nbsp;"
				  Lorem-ipsum-list-beginning "<ul>\n"
				  Lorem-ipsum-list-bullet "<li>"
				  Lorem-ipsum-list-item-end "</li>\n"
				  Lorem-ipsum-list-end "</ul>\n")))


;; find XCode and RVM command line tools on OSX (cover the legacy and current XCode directory structures.)
(when (eq system-type 'darwin)
  (when (file-exists-p "/Developer/usr/bin")
    (setq exec-path (append '("/Developer/usr/bin") exec-path)))
  (when (file-exists-p "/Applications/Xcode.app/Contents/Developer/usr/bin")
    (setq exec-path (append '("/Applications/Xcode.app/Contents/Developer/usr/bin") exec-path)))
  (when (file-exists-p "~/.rvm/bin")
    (setq exec-path (append '("~/.rvm/bin") exec-path)))
  (when (file-exists-p "/usr/local/bin/")
    (setq exec-path (append '("/usr/local/bin") exec-path)))
  (when (file-exists-p "/usr/local/share/npm/bin")
    (setq exec-path (append '("/usr/local/share/npm/bin") exec-path))))

(add-to-list 'exec-path "~/bin")

;; Ruby mode filetype hooks ------------------------------------------------------------------------
;; -- this will need migrating to init-ruby-mode.el or sumthin'

(dolist (pattern '("\\.rb$" "Rakefile$" "\.rake$" "\.rxml$" "\.rjs$" ".irbrc$" "\.builder$" "\.ru$" "\.rabl$" "\.gemspec$" "Gemfile$"))
   (add-to-list 'auto-mode-alist (cons pattern 'ruby-mode)))

(add-hook 'ruby-mode-hook 'flymake-ruby-load)

;; Markdown file handling

(dolist (pattern '("\\.md$" "\\.markdown$"))
  (add-to-list 'auto-mode-alist (cons pattern 'markdown-mode)))

;; Flymake - stop those !@$!*$ modal dialogs

(defun flymake-display-warning (warning) 
  "Display a warning to the user, using the message buffer"
  (message warning))

;; JavaScript/JSON special files

(dolist (pattern '("\\.jshintrc$" "\\.jslint$"))
  (add-to-list 'auto-mode-alist (cons pattern 'json-mode)))

;; -------------------------------------------------------------------------------------------------

(require 'flymake-jshint)
(add-hook 'javascript-mode-hook 'flymake-jshint)

;; -------------------------------------------------------------------------------------------------

;; Highlight TODO/FIXME/BUG/HACK/REFACTOR & THE HORROR in code - I'm hoping the last one will catch on.

(add-hook 'prog-mode-hook
               (lambda ()
                (font-lock-add-keywords nil
                 '(("\\<\\(NOTE\\|FIXME\\|TODO\\|BUG\\|HACK\\|REFACTOR\\|THE HORROR\\):" 1 font-lock-warning-face t)))))

;; -------------------------------------------------------------------------------------------------

;; use aspell for ispell
(when (file-exists-p "/usr/local/bin/aspell")
  (set-variable 'ispell-program-name "/usr/local/bin/aspell"))

(require 'init-dired) 
(require 'init-hideshowvis) 
(require 'init-multi-web-mode)

(require 'frame-adjust)                  ;; a few presets for sizing and moving frames (aka Operating System Windows)

;;;# Convenience and completion
(require 'auto-complete-config)        ;; Very nice autocomplete.
(ac-config-default)

(require 'switch-window)               ;; Select windows by number.
(require 'resize-window)               ;; interactively size window
(require 'highlight-indentation)       ;; visual guides for indentation
(require 'squeeze-view)                ;; squeeze view, give yourself a write-room/typewriter like writing page
(require 'kill-buffer-without-confirm) ;; yes, I really meant to close it.
(require 'scroll-bell-fix)             ;; a small hack to turn off the buffer scroll past top/end bell.
(require 'hexrgb)                      ;; hexrgb functions - my version is modified, lives in /plugins/
(require 'liquid-mode)

(setq custom-file "~/.emacs.d/custom/custom.el") ;; Customize stuff goes in custom.el
(load custom-file)
(require 'custom-keys)

;; Conditional start of Emacs Server
(setq server-use-tcp t)
(when (and (fboundp 'server-running-p) (not (server-running-p))) (server-start))

;; Default Font for different window systems
(when (window-system)
 (global-linum-mode 1)
  ;; Mac OS X 
  (when (eq system-type 'darwin)
    ;;(set-face-font 'default "Monaco")
    ;;(set-face-font 'default "Source Code Pro")
    (set-face-font 'default "Menlo"))
  ;; Sample Text for font viewing 
  '("ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    "abcdefghijklmnopqrstuvwxyz"
    "1234567890!@#$%^&*()-=_+[]\{}|;':<>?,./")
  
  ;; Windows whatever...
  (when (eq system-type 'windows-nt)
    (set-face-font 'default "Consolas")
    )

  ;; GNU Linux (Droid or Vera)
  (when (eq system-type 'gnu/linux)
    ;; (set-face-font 'default "Droid Sans Mono") ;; for quick swapping.
    (set-face-font 'default "Bitstream Vera Sans Mono")
    )
)

;; auto-load hyde mode for Jekyll
(require 'hyde-autoloads) ;; ./vendor/hyde

;; minimal clean / modeline
(load-file "~/.emacs.d/custom/mode-line-hack.el")

;; Try out Nyan-mode for a laugh... 
;; Stupid
(require 'nyan-mode)
(nyan-mode t) ;; on
;; (setq nyan-wavy-trail nil) ;; no wavy tail, I like things sensible!
;; (nyan-start-animation) ;; ok that is a bit much...

(load-theme 'deep-thought)
(set-face-attribute 'default nil :height 140)

(require 'rainbow-mode) ;; temporarily rolling back to 0.6 as 0.7 is broken.

(require 'handy-functions) ;; my lab area for little defuns, the sort
                           ;; of thing people blog about, when they
                           ;; have too much spare time.

(put 'dired-find-alternate-file 'disabled nil)

