(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(tab-width 4)
 '(text-mode-hook
   (quote
	(flyspell-mode turn-on-auto-fill text-mode-hook-identify)))
 '(truncate-lines t)
 '(truncate-partial-width-windows t))

;; Initializations
(setq inhibit-splash-screen t)

(tabbar-mode t)
;; (global-font-lock-mode t)

;;; set title name
(setq frame-title-format "Emacs -- %b")
(toggle-scroll-bar -1)

;; Color Themes
(require 'color-theme)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai t)

;; open several files side-by-side
(setq split-height-threshold 48)
(setq split-width-threshold 52)

;; melpa repositories
(require 'package)
(add-to-list 'package-archives
			 '("melpa-stable" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

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
(setq fci-rule-column 80)
(setq fci-rule-use-dashes t)
