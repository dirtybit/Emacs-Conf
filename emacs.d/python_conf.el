;;; Python configurations

(add-to-list 'load-path "~/.emacs.d/python_conf")

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

;; flymake show errors
(defun my-flymake-show-next-error()
  (interactive)
  (flymake-goto-next-error)
  (flymake-display-err-menu-for-current-line)
  )
(global-set-key "\C-c\C-e" 'my-flymake-show-next-error)

;;; IPython integration
(require 'ipython)
(setq py-python-command-args '( "--colors" "Linux"))

;;; Show python help at point
(global-set-key (kbd "C-c C-a") (kbd "<f1>"))

;;' YASnippet
(add-to-list 'load-path "~/.emacs.d/python_conf/yasnippet-0.6.1c")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/python_conf/yasnippet-0.6.1c/snippets")
