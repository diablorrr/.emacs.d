(global-set-key (kbd "<f1>") 'func)

(global-set-key (kbd "s-p") 'toggle-chinese-search)


(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

(global-set-key (kbd "C-x b") 'consult-buffer)

;;swiper
(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "M-s i") 'consult-imenu)

(global-set-key (kbd "C-;") 'embark-act)

(with-eval-after-load 'embark  
  (define-key embark-file-map (kbd "E") #'consult-directory-externally))


(define-key minibuffer-local-map (kbd "C-c C-e") 'embark-export-write)

(global-set-key (kbd "C-c p f") 'project-find-file)
(global-set-key (kbd "C-c p s") 'consult-ripgrep)



(provide 'init-keybindings)
