;;; packages.el --- fidding layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 fidding
;;
;; Author: 洪加煌洪 <fidding@395455856@qq.com>
;; URL: https://github.com/fidding/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `fidding-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `fidding/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `fidding/pre-init-PACKAGE' and/or
;;   `fidding/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst fidding-packages
  '()
  "The list of Lisp packages required by the fidding layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")




;;
;;fidding private config start
;;

;;添加包依赖
(setq fidding-packages
      '(
        monokai-theme;;monokai主题
        company;;自动补全
        nyan-mode;;彩虹猫
        web-mode;;web模式
        php-mode;;php模式

        )
      )

;;配置包
;; use-package 装载包
;; :init 在包装载之前执行的代码
;; :config 在包装载之后执行的代码
;; :bind 自定义绑定包快捷键，例如:bind ("C-." . jumpweb-mode))
;; :defer t 自动推迟加载，在空闲时间加载
;; :disabled t 禁用
ca
;;monokai主题
(defun fidding/init-monokai-theme ()
  (use-package monokai-theme
    :init
    :config
    (load-theme 'monokai t)
    ))

;;代码补全
(defun fidding/init-company ()
  (use-package company
    :init
    :config
    (add-hook 'after-init-hook 'global-company-mode);;激活自动补全
    ))
;;彩虹猫
(defun fidding/init-nyan-mode ()
  (use-package nyan-mode
    :init
    :config
    (nyan-mode t);;启动彩虹猫
    (nyan-toggle-wavy-trail);;开启彩虹波浪
    (nyan-start-animation);;开启猫动画
    ))

;;web-mode
(defun fidding/init-web-mode ()
  (use-package web-mode
    ))
;;php-mode
(defun fidding/init-php-mode ()
  (use-package php-mode
    ))


;;; packages.el ends here
