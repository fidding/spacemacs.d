;;; config.el --- fidding Layer packages File for Spacemacs
;;
;; Copyright (c) 2016-2017 fidding;

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
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)

;;开启行号
(global-linum-mode nil)
(setq linum-format "%d ")
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

;;设置垃圾回收，在Windows下，emacs25版本会频繁出发垃圾回收，所以需要设置
;;(when (eq system-type 'windows-nt)
;;(setq gc-cons-threshold (* 512 1024 1024))
;;(setq gc-cons-percentage 0.5)
;;(run-with-idle-timer 5 t #'garbage-collect)
;;显示垃圾回收信息，这个可以作为调试用
;;(setq garbage-collection-messages t)
;;)

;;
;;更改spacemacs内置设置
;;

;;关闭layer安装提示
(setq dotspacemacs-enable-lazy-installation 'nil)

;;开启行号
(setq dotspacemacs-line-numbers nil)

;;设置底部状态栏样式
(setq-default mode-line-format
              (list
               " "
               ;; window number
               '(:eval (propertize
                        (window-number-mode-line)
                        'face
                        'font-lock-type-face))

               " "
               ;; evil state
               '(:eval evil-mode-line-tag)
               ;; code type
               mode-line-mule-info
               ;; file type
               'mode-line-modified
               " "
               ;; line and column
               "(" ;; '%02' to set to 2 chars at least; prevents flickering
               (propertize "%l" 'face 'font-lock-type-face) ","
               (propertize "%c" 'face 'font-lock-type-face)
               ") "
               " "
               ;; size
               (propertize "%I" 'face 'font-lock-constant-face)
               " %1"

               " [%1"

               ;; the buffer name; the file name as a tool tip
               '(:eval (propertize "%b" 'face 'font-lock-keyword-face
                                   'help-echo (buffer-file-name)))
               "] "

               ;; the current major mode for the buffer.
               '(:eval (propertize "%m" 'face 'font-lock-string-face
                                   'help-echo buffer-file-coding-system))
               " "
               ;; nyan
               '(:eval (list (nyan-create)))

               " "
               ;; git info
               `(vc-mode vc-mode)

               (mode-line-fill 'mode-line 20)

               mode-line-end-spaces
               ;; add the time, with the date and the emacs uptime in the tooltip
               ;; '(:eval (propertize (format-time-string "%H:%M")
               ;;                     'help-echo
               ;;                     (concat (format-time-string "%c; ")
               ;;                             (emacs-uptime "Uptime:%hh"))))
               ))
