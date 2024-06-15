

(server-mode 1)

(electric-pair-mode t)


(show-paren-mode t)


(setq make-backup-files nil)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)



(delete-selection-mode t)


(progn
	(defvar emax-root (concat (expand-file-name "~") "/emax"))
	(defvar emax-bin (concat emax-root "/bin"))
	(defvar emax-bin64 (concat emax-root "/bin64"))

	(setq exec-path (cons emax-bin exec-path))
	(setenv "PATH" (concat emax-bin ";" (getenv "PATH")))

	(setq exec-path (cons emax-bin64 exec-path))
	(setenv "PATH" (concat emax-bin64 ";" (getenv "PATH")))

	(setq emacsd-bin (concat user-emacs-directory "bin"))
	(setq exec-path (cons  emacsd-bin exec-path))
	(setenv "PATH" (concat emacsd-bin  ";" (getenv "PATH")))

	;;可选安装msys64
	;;下载地址: http://repo.msys2.org/mingw/sources/
	(setenv "PATH" (concat "C:\\msys64\\usr\\bin;C:\\msys64\\mingw64\\bin;" (getenv "PATH")))

	;; (dolist (dir '("~/emax/" "~/emax/bin/" "~/emax/bin64/" "~/emax/lisp/" "~/emax/elpa/"))
	;;   (add-to-list 'load-path dir))
	)
;; grep < ack < ag < ripgrep (rg)

;;hello2




;;ivy
;; Encoding
;; UTF-8 as the default coding system
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))

;;(set-language-environment 'chinese-gbk)
;;(prefer-coding-system 'utf-8-auto)

;;自动刷新配置
(global-auto-revert-mode 1)
(setq auto-save-default nil) ;;不自动生成备份文件
(setq ring-bell-function 'ignore) ;;忽略某些声音
(fset 'yes-or-no-p 'y-or-n-p) ;;emacs问yes或no替换成y或n

;;使用M-x时，显示上次执行的命令。增加history文件：记录minibuffers执行的内容
;;ensure设置nil的原因：这是内置的包，只需在emacs中require,不需要在镜像源上拉取
(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t
	      history-length 1000
	      savehist-additional-variables '(mark-ring
					      global-mark-ring
					      search-ring
					      regexp-search-ring
					      extended-command-history)
	      savehist-autosave-interval 300)
  )



;;打开文件，光标处于上次的位置
;;hook:优化手段，在init加载完之后，再执行save-place-mode
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

(use-package simple
  :ensure nil
  :hook (after-init . size-indication-mode)
  :init
  (progn
    (setq column-number-mode t)
    ))

(provide 'init-basic)
