;;; funcs.el --- fidding Layer packages File for Spacemacs
;;
;; Copyright (c) 2016-2017 fidding;

;; Author: 洪加煌 <fidding@395455856@qq.com>
;; URL: https://github.com/fidding/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun spaceline--unicode-number (str)
  "Return a nice unicode representation of a single-digit number STR."
  (cond
   ((string= "1" str) "①")
   ((string= "2" str) "②")
   ((string= "3" str) "③")
   ((string= "4" str) "④")
   ((string= "5" str) "⑤")
   ((string= "6" str) "⑥")
   ((string= "7" str) "⑦")
   ((string= "8" str) "⑧")
   ((string= "9" str) "⑨")
    ((string= "0" str) "⑩")))

(defun window-number-mode-line ()
  "The current window number. Requires `winum-mode' to be enabled."
  (when (bound-and-true-p winum-mode)
    (let* ((num (winum-get-number))
           (str (when num (int-to-string num))))
      (spaceline--unicode-number str))))

(defun mode-line-fill (face reserve)
  "Return empty space using FACE and leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 20))
  (when (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " "
              'display `((space :align-to
                                (- (+ right right-fringe right-margin) ,reserve)))
              'face face))
