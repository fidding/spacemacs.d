
# fidding emacs配置
个人的spacemacs layer配置

## 安装

1. 安装emacs

 https://www.gnu.org/software/emacs/download.html

2. 安装spacemacs
```
cd /
git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
```
3. 安装我的配置
```
cd /
git clone https://github.com/fidding/spacemacs.d.git ~/spacemacs.d
```

## 如何配置

安装完成之后，打开你的.spacemacs文件。

1. 添加配置路径
```
dotspacemacs-configuration-layer-path '("~/spacemacs.d/")
```
2. 引用配置
```
dotspacemacs-configuration-layers '(fidding）
```

## 都有什么
**插件**

1. dracula-themt主题

2. cpmpany自动补全

3. 彩虹猫

4. web-mode

5. php-mode

6. markdown-mode

7. livedown markdown实时预览

    1. 需要先安装npm与node
    2. 然后安装livedown，```npm install -g livedown```

8. ace-jump-mode 快速跳转

9. idle-highlight-mode选中词匹配高亮

10. magit git版本控制

11. jade-mode模式

12. yasnippet自定义模版

**快捷键**

```
C-c f ;; 增添窗口大小，步长10
C-c b ;;减小窗口大小，步长10

C-c SPC ;; ace-jump-word-mode 首字母跳转
C-u C-u C-c SPC ;;ace-jump-line-mode 行跳转
```

**指令**

```
M-x livedown:preview ;;开启markdown实时预览
M-x livedown:kill ;;关闭markdown实时预览
```

**基本配置**

1. 自定义窗口标题

2. 初始窗口最大化

3. 显示行号

4. 保存buffer时移除多余空格

***
**将持续更新，欢迎star&fork!!**
# happy joining！
