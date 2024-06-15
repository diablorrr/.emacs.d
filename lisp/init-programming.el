;;eglot是一个用于与lsp兼容的语言服务器交互的客户端。emacs29自带
;;lsp:Language Server Protocol,用于编辑器获取语言服务器的语法分析、代码补全、错误检查等功能
(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)

;;用于快速运行
(use-package quickrun
  :ensure t
  :commands (quickrun)
  :init
  (quickrun-add-command "c++/c1z"
			'((:command . "g++")
			  (:exec . ("%c -std=c++1z %o -o %e %s" 
				    "%e %a"))
			  (:remove . ("%e")))
			:default "c++"))
(global-set-key (kbd "<f5>") 'quickrun)

;;treesit用于解析源代码的现代语法分析器生成器，用于生成高效的语法树解析器。提供语法高亮、代码折叠、自动完成等功能
;;相比于eglot，精确度和性能更好
(use-package treesit-auto
  :demand
  :init
  (progn
    (setq treesit-font-lock-level 4))
    (add-to-list 'major-mode-remap-alist '(c++-mode . c++-ts-mode))
  :config
  (global-treesit-auto-mode)
  )

;;写函数时自动出现占位符，可以替换
(use-package yasnippet
  :ensure t
  :hook ((prog-mode . yas-minor-mode)
	 (org-mode . yas-minor-mode))
  :init
  :config
  (progn
    (setq hippie-expand-try-functions-list
	  '(yas/hippie-try-expand
	    try-complete-file-name-partially
	    try-expand-all-abbrevs
	    try-expand-dabbrev
	    try-expand-dabbrev-all-buffers
	    try-expand-dabbrev-from-kill
	    try-complete-lisp-symbol-partially
	    try-complete-lisp-symbol))))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

(provide 'init-programming)
