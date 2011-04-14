(add-to-list 'load-path "~/.emacs.d")

;;; Column indicator at mode-line area
(column-number-mode 1)

;;; Show matching parenthesis
(show-paren-mode 1)

;;; Duplicate  line shortcut
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")

;;; Copy line shorcut
(global-set-key "\C-c\C-k" "\C-a\C- \C-n\M-w")

;;; Settings
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#1a1a1a" :foreground "#ffffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "Droid Sans Mono")))))

;;; pymacs settings
(setq py-python-command "python")
(setq pymacs-python-command py-python-command)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(require 'pycomplete)

;;; anything
(require 'anything-config)   
(require 'anything-match-plugin)   
(global-set-key "\C-ca" 'anything)   
(global-set-key "\C-ce" 'anything-for-files)   

;;; python-mode
(autoload 'python-mode "python-mode" "Python Mode." t)   
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))   
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;;; linum
(require 'linum)   
(global-linum-mode 1)
(setq linum-format "%4d ")

;;; pyflakes
;;===== PyFlakes
;; code checking via pyflakes+flymake
(when (load "flymake" t)
 (defun flymake-pyflakes-init ()
 (let* ((temp-file (flymake-init-create-temp-buffer-copy
 'flymake-create-temp-inplace))
 (local-file (file-relative-name
 temp-file
 (file-name-directory buffer-file-name))))
 (list "pyflakes" (list local-file))))
 
 (add-to-list 'flymake-allowed-file-name-masks
 '("\\.py\\'" flymake-pyflakes-init)))
 
(add-hook 'find-file-hook 'flymake-find-file-hook)

;;' YASnippet
(add-to-list 'load-path "~/.emacs.d/yasnippet-0.6.1c")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets")

