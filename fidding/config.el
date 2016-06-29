;;; config.el --- fidding Layer packages File for Spacemacs
;;
;; Copyright (c) 2016-2016 fidding;

;; Author: 洪加煌 <fidding@395455856@qq.com>
;; URL: https://github.com/fidding/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;自定义buffer头
;;显示更多的buffer标题信息
(setq frame-title-format
      '("" " fidding ☺ "
        (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name)) "%b"))))

;;(setq auto-save-default nil)
;;初始窗口最大化
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;开启行号
(global-linum-mode t)
(add-hook 'org-mode-hook (lambda () (linum-mode 0)));;关闭org-mode的行号
