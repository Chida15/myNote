#!/bin/bash
# xrog框架
sudo pacman -S xorg

# 窗口管理器
sudo pacman -S xorg-xinit xdm-archlinux
sudo systemctl enable xdm-archlinux

# 包管理器设置
echo "[archlinuxcn]" | sudo tee -a /etc/pacman.conf
echo "Server = https://mirrors.ustc.edu.cn/archlinuxcn/\$arch" | sudo tee -a /etc/pacman.conf
sudo pacman -Syy && sudo pacman -S archlinuxcn-keyring
sudo pacman -S yay

# 字体
sudo pacman -S wqy-microhei wqy-zenhei noto-fonts noto-fonts-cjk ttf-dejavu

# 桌面相关程序
# i3主程序
sudo pacman -S i3-gaps i3lock
# 文件管理器
sudo pacman -S pcmanfm
# 终端
yay -S lilyterm
# 程序菜单
sudo pacman -S rofi 
# 截图工具
sudo pacman -S flameshot
# 声卡和声音图标
sudo pacman -S alsa-utils volumeicon
# 透明特效
sudo pacman -S compton
# 网络管理
sudo pacman -S networkmanager network-manager-applet
sudo systemctl enable NetworkManager
# 壁纸
sudo pacman -S feh
# 通知
sudo pacman -S dunst
# 状态栏
sudo pacman -S py3status

# 文件系统支持
sudo pacman -S ntfs-3g exfat-utils

# 窗口主题和图标选取
sudo pacman -S materia-gtk-theme deepin-icon-theme lxappearance

# 装逼
yay -S neofetch

# ranger命令行文件管理器
yay -S ranger

# 压缩
sudo pacman -S xarchiver

# 办公软件
# ps:google-chrome-stable --proxy-server=sock5://ip:端口可以启动代理
yay -S google-chrome
yay -S firefox firefox-i18n-zh-cn
yay -S wps-office ttf-wps-fonts
# 梯子(ss-qt5)
yay -S shadowsocks-qt5   

# 下载工具
yay -S deluge

# 输入法
yay -S fcitx-im fcitx-configtool fcitx-sogoupinyin

echo "export LANG=zh_CN.UTF-8" | sudo tee -a /etc/X11/xinit/xinitrc
echo "export LANGUAGE=zh_CN.UTF-8" | sudo tee -a /etc/X11/xinit/xinitrc
echo "export LC_CTYPE=en_US.UTF-8" | sudo tee -a /etc/X11/xinit/xinitrc
echo "export GTK_IM_MODULE=fcitx" | sudo tee -a /etc/X11/xinit/xinitrc
echo "export QT_IM_MODULE=fcitx" | sudo tee -a /etc/X11/xinit/xinitrc
echo "export XMODIFIERS=\"@im=fcitx\"" | sudo tee -a /etc/X11/xinit/xinitrc

# vscode
yay -S visual-studio-code-bin

# 影音工具
yay -S netease-cloud-music
yay -S deepin-movie

# 配置文件返回
sh restore.sh
echo "请自行修改xinitrc"