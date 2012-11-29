(custom-set-variables
 ;; disable tool bar
 '(tool-bar-mode nil)
 ;; disable scroll bar
 '(scroll-bar-mode nil))

;; disable the startup page
(setq inhibit-startup-message t)

;; set the *strach* buffer text
(setq initial-scratch-message 
      (concat ";; Emacs\t;; Evenings\t;; Escape\n"
	      ";; Makes\t;; Mornings,\t;; Meta\n"
	      ";; A\t\t;; And a\t;; Alt\n"
	      ";; Computer\t;; Couple of\t;; Control\n"
	      ";; Slow\t\t;; Saturdays\t;; Shift\n\n"))

;; display time in the mode line
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; make the point keep at the same screen position when scroll
(setq scroll-preserve-screen-position t)

;; let the title show the buffer name
(setq frame-title-format "Emacs@%b")

;; bind c-w to kill-backward word
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)

;; set the c style
(setq c-default-style "linux"
      c-basic-offset 8)

;; make *.h as c++ header
(setq auto-mode-alist
      (cons '("\\.h$" . c++-mode)
	    auto-mode-alist))

;; set the org-mode
(global-set-key "\C-ca" 'org-agenda)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((latex . t)
   (dot . t)
   (ditaa . t)))

;; set my org html configuration
(setq org-export-html-style
      (concat
      "<link rel= \"stylesheet\" type=\"text/css\" href=\"assets/css/style.css\" />"
      "<link rel=\"SHORTCUT ICON\" href=\"images/favicon.ico\" type=\"image/x-icon\" />"))
(setq org-export-html-style-include-default nil)
(setq org-export-html-postamble t)
(setq org-export-html-postamble-format 
      '(("en" "<p class=\"author\">作者: %a (%e)</p>\n<p class=\"date\">更新日期: %d</p>\n")))

;; load the elisp to load directory automatically
(load "~/.emacs.d/plugins/subdirs.el")

;; set auto-complete mode
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; set yasnippet mode
(require 'yasnippet)
(yas/global-mode 1)

;; set graphviz-dot mode
(load-file "~/.emacs.d/plugins/misc/graphviz-dot-mode.el")

;; set clojure mode
(require 'clojure-mode)

;; set jade mode
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; set markdown mode
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; set coffee mode
(require 'coffee-mode)

;; set less mode
(require 'less-mode)
(add-to-list 'auto-mode-alist '("\\.less$" . less-mode))
