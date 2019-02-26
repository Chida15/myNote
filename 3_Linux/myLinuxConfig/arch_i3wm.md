## arch下i3wm和基础软件安装

参考资料：
1.  [在Archlinux中安装使用i3-gaps和polybar](https://www.jianshu.com/p/fd07c3081493)
2. [ArchLinux搭建高效便捷的平铺式桌面](https://segmentfault.com/a/1190000008280278#articleHeader0)

### 1.包管理器设置(添加中国社区)
添加中文社区：
```echo "[archlinuxcn]" | sudo tee -a /etc/pacman.conf```
```echo "Server = https://mirrors.ustc.edu.cn/archlinuxcn/\$arch" | sudo tee -a /etc/pacman.conf```

更新软件仓库并安装社区密钥：```sudo pacman -Syy && sudo pacman -S archlinuxcn-keyring```

安装aur包管理器yay：```sudo pacman -S yay```

### 2.图形服务安装

```pacman -S xorg```(自动安装独显驱动)

### 3.桌面管理器(登录用户和密码的界面)

安装xinit+xdm：```pacman -S xorg-xinit xdm-archlinux```
启动开机进入登录界面：```systemctl enable xdm-archlinux```

### 4.字体安装
```pacman -S wqy-microhei wqy-zenhei noto-fonts noto-fonts-cjk ttf-dejavu```

#### 5.i3wm桌面管理器安装
i3桌面主体：```pacman -S i3-gaps i3exit i3lock```
文件管理器：```pacman -S pcmanfm```
终端：```yay -S lilyterm```
程序菜单：```pacman -S rofi ```
截图工具：```pacman -S flameshot```
声卡和声音图标：```sudo pacman -S alsa-utils volumeicon```
透明特效：```pacman -S compton```
网络管理安装：```pacman -S networkmanager network-manager-applet```
网络管理开机启动：```systemctl enable NetworkManager```
壁纸：```pacman -S feh```
通知：```pacman -S dunst```
状态栏：```pacman -S py3status```

### 6.文件系统支持
ntfs：```pacman -S ntfs-3g```
exfat：```pacman -S exfat-utils```

### 7.窗口主题和图标选取
```shell
sudo pacman -S materia-gtk-theme
sudo pacman -S deepin-icon-theme
sudo pacman -S lxappearance
```
### 8.装逼
```yay -S neofetch```

### 9.ranger命令行文件管理器
```yay -S ranger```

### 10.压缩
```sudo pacman -S xarchiver```

### 11.浏览器和办公软件
ps:```google-chrome-stable --proxy-server=sock5://ip:端口```可以启动代理
谷歌浏览器：```yay -S google-chrome```
火狐：```yay -S firefox```
火狐中文包：```yay -S firefox-i18n-zh-cn```
WPS：```yay -S wps-office ttf-wps-fonts```
梯子(ss-qt5)：```yay -S shadowsocks-qt5   ```

### 12.下载工具
种子下载：```yay -S deluge```

### 13.输入法
```sh
yay -S fcitx-im
yay -S fcitx-configtool
yay -S fcitx-sogoupinyin

echo "export LANG=zh_CN.UTF-8" | sudo tee -a /etc/X11/xinit/xinitrc
echo "export LANGUAGE=zh_CN.UTF-8" | sudo tee -a /etc/X11/xinit/xinitrc
echo "export LC_CTYPE=en_US.UTF-8" | sudo tee -a /etc/X11/xinit/xinitrc
echo "export GTK_IM_MODULE=fcitx" | sudo tee -a /etc/X11/xinit/xinitrc
echo "export QT_IM_MODULE=fcitx" | sudo tee -a /etc/X11/xinit/xinitrc
echo "export XMODIFIERS=\"@im=fcitx\"" | sudo tee -a /etc/X11/xinit/xinitrc
```

### 14.编辑器
vscode：```yay -S visual-studio-code-bin```

### 15.影音工具
网易云：```yay -S netease-cloud-music```
深度播放器：```yay -S deepin-movie```

### 16.配置文件
xinitrc(用于配置启动界面)：```/etc/X11/xinit/xinitrc```
i3-wm配置文件：```~/.i3/config```
vim配置文件：```~/.vimrc```

