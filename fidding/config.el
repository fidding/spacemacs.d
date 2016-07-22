;;; config.el --- fidding Layer packages File for Spacemacs
;;
;; Copyright (c) 2016-2016 fidding;

;; Author: 洪加煌 <fidding@395455856@qq.com>
;; URL: https://github.com/fidding/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;隐藏工具栏
(tool-bar-mode -1)
;;隐藏菜单栏
(menu-bar-mode -1)
;;隐藏滚动条
(scroll-bar-mode -1)
;;自定义buffer头
;;显示更多的buffer标题信息
(setq frame-title-format
      '("" " fidding ☺ "
        (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name)) "%b"))))


;;初始窗口最大化
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;保存时自动清除行尾空格及文件结尾空行
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;;tab&空格
(setq-default indent-tabs-mode  nil)
;;开启行号
(global-linum-mode t)
(add-hook 'org-mode-hook (lambda () (linum-mode 0)));;关闭org-mode的行号

;;设置org的任务状态
(setq org-todo-keywords
      '(
        ;;note笔记 idea想法
        ;;todo准备做 done完成 abort中止
        (sequence "TODO(t!)" "|" "DONE(d!)" "ABORT(a@/!)" "NOTE(n!)" "IDEA(i!)")
        ))
;;底部分割线锯齿平滑
(setq ns-use-srgb-colorspace nil)
