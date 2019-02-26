# ??????
echo "[archlinuxcn]" | sudo tee -a /etc/pacman.conf
echo "Server = https://mirrors.ustc.edu.cn/archlinuxcn/\$arch" | sudo tee -a /etc/pacman.conf
sudo pacman -Syy && sudo pacman -S archlinuxcn-keyring
sudo pacman -S yay

# ??
sudo pacman -S wqy-microhei wqy-zenhei noto-fonts noto-fonts-cjk ttf-dejavu

# ??????
sudo pacman -S ntfs-3g exfat-utils

# ??
yay -S neofetch

# ranger????????
yay -S ranger

# ????
# ps:google-chrome-stable --proxy-server=sock5://ip:????????
yay -S google-chrome
yay -S firefox firefox-i18n-zh-cn
yay -S wps-office ttf-wps-fonts
# ??(ss-qt5)
yay -S shadowsocks-qt5   

# ????
yay -S deluge

# ???
yay -S fcitx-im fcitx-configtool fcitx-sogoupinyin

echo "export LANG=zh_CN.UTF-8" | sudo tee -a /etc/X11/xinit/xinitrc
echo "export LANGUAGE=zh_CN.UTF-8" | sudo tee -a /etc/X11/xinit/xinitrc
echo "export LC_CTYPE=en_US.UTF-8" | sudo tee -a /etc/X11/xinit/xinitrc
echo "export GTK_IM_MODULE=fcitx" | sudo tee -a /etc/X11/xinit/xinitrc
echo "export QT_IM_MODULE=fcitx" | sudo tee -a /etc/X11/xinit/xinitrc
echo "export XMODIFIERS=\"@im=fcitx\"" | sudo tee -a /etc/X11/xinit/xinitrc

# vscode
yay -S visual-studio-code-bin

# ????
yay -S netease-cloud-music
