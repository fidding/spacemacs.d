;;; packages.el --- fidding layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 fidding
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
;;fidding-packages
;;添加包依赖
(setq fidding-packages
      '(
        ;; 主题
        ;; dracula-theme
        ;; monokai-theme
        atom-one-dark-theme
        ;; material-theme
        ;;自动补全
        company
        ;;彩虹猫
        (nyan-mode
         :fetcher github
         :repo "TeMPOraL/nyan-mode"
         :files ("nyan-mode.el" "img" "mus"))
        ;;yasnippet
        yasnippet
        ;;web模式
        web-mode
        ;;js2模式
        js2-mode
        ;;php开发
        ;;(php-extras :location (recipe :fetcher github :repo "arnested/php-extras"))
        php-mode
        flymake-php
        ;;phpcbf
        ac-php
        ;;选中词匹配高亮
        idle-highlight-mode
        ;;markdown模式
        (markdown-mode :fetcher github :repo "jrblevin/markdown-mode")
        (markdown-mode :location (recipe
                                  :fetcher github

                                  ))
        ;;markdown在线预览，设置来源github
        (livedown :location (recipe
                             :fetcher github
                             :repo "shime/emacs-livedown"))

        ;; python
        elpy
        ;; python函数跳转
        ;; jedi-core
        ;; 图标
        all-the-icons
        spaceline-all-the-icons
        )
      )

;; 配置包
;; use-package 装载包
;; :init 在包装载之前执行的代码
;; :config 在包装载之后执行的代码
;; :bind 自定义绑定包快捷键，例如:bind ("C-." . jumpweb-mode))
;; :defer t 自动推迟加载，在空闲时间加载
;; :disabled t 禁用

;;图标
(defun fidding/init-all-the-icons ()
  (use-package all-the-icons
    :init
    :config
    (setq inhibit-compacting-font-caches t)
    ;; neotree
    (setq neo-theme 'icons)
    ))
(defun fidding/init-spaceline-all-the-icons ()
  (use-package spaceline-all-the-icons
    :after spaceline
    :config
    (spaceline-all-the-icons-theme)
    (setq spaceline-all-the-icons-separator-type 'slant)
    (spaceline-all-the-icons--setup-git-ahead)       ;; Enable # of commits ahead of upstream in git
    (spaceline-all-the-icons--setup-neotree)         ;; Enable Neotree mode line
    ;; (spaceline-all-the-icons--setup-anzu)            ;; Enable anzu searching
    ;; (spaceline-all-the-icons--setup-package-updates) ;; Enable package update indicator
    ;; (spaceline-all-the-icons--setup-paradox)         ;; Enable Paradox mode line
    ))

;;material-theme主题
;; (defun fidding/init-material-theme ()
;;   (use-package material-theme
;;     :init
;;     :config
;;     (load-theme 'material t)
;;     ))

;;monokai主题
;; (defun fidding/init-monokai-theme ()
;;    (use-package monokai-theme
;;     :init
;;     :config
;;     (load-theme 'monokai t)
;;     ))

;;atom io主题
(defun fidding/init-atom-one-dark-theme ()
  (use-package atom-one-dark-theme
    :init
    :config
    (load-theme 'atom-one-dark t)
    ))

;; dracula-theme主题
;; (defun fidding/init-dracula-theme ()
;;   (use-package dracula-theme
;;     :init
;;     :config
;;     (load-theme 'dracula t)
;;     ))

;;彩虹猫
(defun fidding/init-nyan-mode ()
  (use-package nyan-mode
    :init
    :config
    (nyan-mode t);;启动彩虹猫
    (nyan-toggle-wavy-trail);;开启彩虹波浪
    (nyan-start-animation);;开启猫动画
    ))

;;代码补全
(defun fidding/init-company ()
  (use-package company
    :init
    :config
    (add-hook 'after-init-hook 'global-company-mode);;激活自动补全
    ;;配合ac-php
    (add-hook 'php-mode-hook
            '(lambda ()
               (auto-complete-mode t)
               (require 'ac-php)
               (setq ac-sources  '(ac-source-php ) )
               ;; (yas-global-mode 1)

               (ac-php-core-eldoc-setup ) ;; enable eldoc
               (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
               (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back)    ;go back
               ))
    ))

;;js2-mode
(defun fidding/init-js2-mode ()
  (use-package js2-mode
    :config
    (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
    ))

;;web-mode
(defun fidding/init-web-mode ()
  (use-package web-mode
    :config
    (add-to-list 'auto-mode-alist '("\\.blade.php\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
    ;; (add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
    ;; (setq web-mode-content-types-alist
    ;;       '(("jsx"  . "/.*/react/.*\\.js[x]?\\'")))
    (setq web-mode-markup-indent-offset 4)
    (setq web-mode-css-indent-offset 4)
    (setq web-mode-code-indent-offset 4)
    ))

;;高亮匹配选中词
(defun fidding/init-idle-highlight-mode ()
  (use-package idle-highlight-mode
    :config
    (defun my-coding-hook ()
      (make-local-variable 'column-number-mode)
      (column-number-mode t)
      (if window-system (hl-line-mode t))
      (idle-highlight-mode t))
    ;;自选模式开启
    (add-hook 'emacs-lisp-mode-hook 'my-coding-hook)
    (add-hook 'js2-mode-hook 'my-coding-hook)
    (add-hook 'javascript-mode-hook 'my-coding-hook)
    (add-hook 'js-mode-hook 'my-coding-hook)
    (add-hook 'php-mode-hook 'my-coding-hook)
    ))

;;yasnippet
(defun fidding/init-yasnippet ()
  (use-package yasnippet
    :config
    (yas-global-mode 1)
    ))

;;php-mode
(defun fidding/init-php-mode ()
  (use-package php-mode
    :defer t
    :mode ("\\.php\\'" . php-mode)))

;;php-extras
;;(defun fidding/init-php-extras ()
;;  (use-package php-extras
;;    :defer t))

;;flymake-php错误提示
(defun fidding/init-flymake-php ()
  (use-package flymake-php
    :defer t
    :config
    (add-hook 'php-mode-hook 'flymake-php-load)))

;;phpcbf规范检测
;; (defun fidding/init-phpcbf ()
;;   (use-package phpcbf
;;     :init
;;     :config
;;     (custom-set-variables
;;     '(phpcbf-executable "/usr/local/bin/phpcbf")
;;     '(phpcbf-standard "PSR2"))
;;     (add-hook 'php-mode-hook 'phpcbf-enable-on-save)
;;     ))

;;ac-php语法提示
(defun fidding/init-ac-php ()
  (use-package ac-php
    :init
    :config
    ))



;;markdown-mode
(defun fidding/init-markdown-mode ()
  (use-package markdown-mode
    :ensure t
    :commands (markdown-mode gfm-mode)
    :mode (("README\\.md\\'" . gfm-mode)
           ("\\.md\\'" . markdown-mode)
           ("\\.markdown\\'" . markdown-mode))
    :init (setq markdown-command "multimarkdown")
    )
  )

;;markdown实时预览
;;在md文件下
;;M-x livedown:preview开启
;;M-x livedown:kill关闭
(defun fidding/init-livedown ()
  (use-package livedown
    :config
    (custom-set-variables
     '(livedown:autostart nil) ; 启动md自动打开预览功能 automatically open preview when opening markdown files
     '(livedown:open t)        ; 启动预览自动打开窗口automatically open the browser window
     '(livedown:port 1337))    ; 端口 port for livedown server
    (require 'livedown)
    )
  )

;; emacs lisp python
(defun fidding/init-elpy ()
  (use-package elpy
    :config
    (package-initialize)
    (elpy-enable)
    (add-hook 'elpy-mode-hook
              (lambda ()
                (set (make-local-variable 'company-backends)
                     '((company-dabbrev-code company-yasnippet elpy-company-backend)))))
    )
  )

;; python函数跳转
;; C-c . 跳转定义
;; C-c ? 跳转函数说明
;; (defun fidding/init-jedi-core ()
;;   (use-package jedi-core
;;     :config
;;     (add-hook 'python-mode-hook 'jedi:setup)
;;     (setq jedi:complete-on-dot t) ; optional
;;     )
;;   )

;;; packages.el ends here
