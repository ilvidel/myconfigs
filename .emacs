(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
	("95b0bc7b8687101335ebbf770828b641f2befdcf6d3c192243a251ce72ab1692" default)))
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(package-selected-packages
   (quote
	(easy-hugo smart-tabs-mode coffee-mode gradle-mode js-auto-beautify crontab-mode fill-column-indicator dash-functional yaml-mode web-beautify puppet-mode markdown-mode lorem-ipsum json-mode flymd flymake-shell flymake-python-pyflakes flymake-puppet flycheck ecb)))
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(tab-width 4)
 '(truncate-lines t)
 '(truncate-partial-width-windows t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "gray30"))))
 '(region ((t (:inherit highlight :background "dark magenta")))))

;; Initializations
(setq inhibit-splash-screen t)

;; melpa repositories
(require 'package)
;; Add melpa package source when using package list
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; Load emacs packages and activate them
(package-initialize)

;; (tabbar-mode t)
;; (global-font-lock-mode t)

;;; set title name
(setq frame-title-format "Emacs -- %b")
(toggle-scroll-bar -1)

;; Color Themes
;; (require 'color-theme)
(load-theme 'monokai t)

;; open several files side-by-side
(setq split-height-threshold 48)
(setq split-width-threshold 52)

;; Deleting the trailinbg whitespaces and new-lines
(add-hook 'write-file-hooks 'delete-trailing-whitespace)
(setq delete-trailing-whitespace-p t)

;; completion of existing words in buffer
(global-set-key [(C-tab)] 'dabbrev-expand)

;; line numbers on the left margin
(global-linum-mode t)

;; add line separator for linum mode
(setq linum-format "%4d\u2502")

;; key mappings for backspace
(global-set-key (kbd "C-h") 'backward-kill-word)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; python lintian tips
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(setq flymake-python-pyflakes-executable "flake8")
(setq flymake-python-pyflakes-extra-arguments '("--ignore=E501"))

;; use fill-column-indicator
(require 'fill-column-indicator)
(add-hook 'prog-mode-hook 'fci-mode)
(setq fci-rule-color "dark khaki")
(setq fci-rule-column 80)
(setq fci-rule-use-dashes t)
