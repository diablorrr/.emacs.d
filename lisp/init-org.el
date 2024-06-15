(require 'org-tempo)

;;pin:之前配置了配置源gnu和melpa,pin就是指定在哪个源下载
;;这里C-x C-e没有安装：原因是这个org使用emacs内置的
(use-package org
  :pin org
  :ensure t)

(use-package org-contrib
  :pin nongnu
  :ensure t)

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
	      (sequence "WAITING(w@/!)" "SOMEDAY(S)" "|" "CANCELLED(c@/!)" "MEETING(m)" "PHONE(p)"))))

;;加入列表清单功能
(require 'org-checklist)

;;使任务日志可以折叠
(setq org-log-done t)
(setq org-log-into-drawer t)

;;org-agenda相关设置
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-files '("~/gtd.org"))
(setq org-agenda-span 'day)

;;快速生成一些模板
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/gtd.org" "Workspace")
	"* TODO [#B] %?\n %i\n %U"
	:empty-lines 1)))

(global-set-key (kbd "C-c r") 'org-capture)

;;在org-agenda的菜单中增加 紧急且重要的事，快捷键为c
(setq org-agenda-custom-commands
      '(("c" "重要且紧急的事"
	 ((tags-todo "+PRIORITY=\"A\"")))
	;;...other commands here
	))



(provide 'init-org)
