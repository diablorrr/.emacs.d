;;引入emacs内置的包管理器
(require 'package)
;;镜像源配置
(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org")))
(package-initialize);;将安装的包在本地初始化一下
;;防止反复调用package-refresh-contents 会影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))

;;更安全的require，比如require一个包时，没有包，只会出现警告，而不会在此终止
;; (use-package use-package)

;;不使用内置的org
(assq-delete-all 'org package--builtins)
(assq-delete-all 'org package--builtin-versions)

;;除非安装过package了，否则刷新package源，再安装package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;在使用use-package的时候，默认有ensure了
(require 'use-package-ensure)
(setq use-package-always-ensure t)
(setq use-package-always-defer t)

;;重启emacs,use-package的ensure可以替代package-install来安装包
;;用package-install来安装包的一个问题，每次启动emacs都会安装包（在message中可以看到）,影响emacs的启动速度
(use-package restart-emacs
  :ensure t)

;;将init-packages.el作为一个特性提供出去。这样就可以在init.el中require
(provide 'init-packages)


