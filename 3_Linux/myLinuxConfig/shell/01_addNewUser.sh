#!/bin/bash

# 用于设置新用户
# 设置管理员密码
passwd

# 新建用户并设置sudo
pacman -S sudo
useradd -m -G wheel spring
passwd spring
visudo

echo -e "请自行设置开机联网\n"
echo "然后重启以新用户身份继续"