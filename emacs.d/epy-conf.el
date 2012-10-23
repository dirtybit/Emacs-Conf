;;; Flymake checker
(epy-setup-checker "pyflakes %f")

;;; IPython integration
(epy-setup-ipython)

;;; Highlight indentation
(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation)