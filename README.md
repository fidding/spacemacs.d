# fidding emacs配置
个人的spacemacs layer配置
##安装

1.安装emacs

 https://www.gnu.org/software/emacs/download.html 

2.安装spacemacs
```
cd /
git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
```
3.安装我的配置
```
cd /
git clone git@github.com:fidding/.spacemacs.d.git ~/.spacemacs.d/
```
##如何配置
安装完成之后，打开你的.spacemacs文件。

1.添加配置路径  
```
dotspacemacs-configuration-layer-path '("~/.spacemacs.d/")
```
2.引用配置
```
dotspacemacs-configuration-layers '(fidding）
```
##都有什么

**插件**

1.monokai主题

2.自动补全

3.彩虹猫

4.web-mode

5.php-mode

**快捷键**

```
C-c f 增添窗口大小，步长10
C-c b 减小窗口大小，步长10
```
**基本配置**

1.自定义窗口标题

2.初始化窗口最大化

3.显示行号

**将持续更新，欢迎star&fork！！**
##Happy Join In