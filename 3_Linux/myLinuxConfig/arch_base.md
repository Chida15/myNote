## archlinux 安装基础篇

写于2019年1月26日

 -本人实验了基于BIOS模式下archlinux的安装

参考资料：
1.[安装 Arch Linux 记录——配置](https://www.jianshu.com/p/2c45c5b4c1ab)
2.[ArchLinux(BIOS引导)](https://blog.csdn.net/cristianojason/article/details/80033330)
3.[ArchLinux安装图文教程(EFI模式)](https://blog.csdn.net/r8l8q8/article/details/76516523)
4.[ArchLinux安装、配置、美化和优化(gnome桌面)](https://www.cnblogs.com/bluestorm/p/5929172.html)
5.[安装ArchLinux记录--配置(i3wm)](https://www.jianshu.com/p/2c45c5b4c1ab)

### 1.同步时间和网络
同步时间：```timedatectl set-ntp true ```
无线网络：```wifi-menu```
拨号：```pppoe-setup```
测试网络：```ping -c 3 www.baidu.com```

### 2.编辑国内源
编辑镜像站文件：```vim /etc/pacman.d/mirrorlist```
将China下网址复制到最开头


更新软件仓库：```pacman -Syy```

### 3.查看启动类型和分区

检查引导方式：```ls /sys/firmware/efi/efivars```
若无该文件，则处于BIOS启动模式，反之EFI模式



BIOS模式分区(最基本):只分一个区用于挂载 /
EFI模式：至少需要/boot(>200M)、/boot/EFI(>200M)、/三个分区
具体分区过程省略(自行百度fdisk教程)

格式化：
EFI分区需要fat32文件系统：```mkfs.fat -F32 /dev/你的分区```
boot分区最好使用ext4文件系统：```mkfs.ext4 /dev/你的分区```
根分区随意

挂载：
根目录挂载：```mount /dev/根分区	/mnt```

(EFI模式)启动分区：
```mkdir /mnt/boot```
```mount /dev/boot分区	/mnt/boot```

(EFI模式)EFI分区：
```mkdir /mnt/boot/EFI```
```mount /dev/EFI分区	/mnt/boot/EFI```

### 4.安装基本系统并切换
安装基本系统：```pacstrap -i /mnt base base-devel```
解释：/mnt对应根目录	，也就是之前挂载的根分区。base和base-devel是基本系统包

配置开机挂载文件(fstab)：```genfstab -U /mnt >> /mnt/etc/fstab```

查看配置文件：```cat /mnt/etc/fstab```

切换新系统：```arch-chroot /mnt```

### 5. vim和语系、时区设置并设置同步时间

安装vim：```pacman -S vim```

编辑语系：```vim /etc/locale.gen```
将en_US.UTF-8和zh_CN.UTF-8,前面#删除

使其有效：```locale-gen```

时区设置(使用hwclock)：
```ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime```
```hwclock --systohc```

### 6.引导设置
BIOS模式：
安装检测启动项软件：```pacman -S os-prober```

安装grub：```pacman -S grub```

部署grub：```grub-install --target=i386-pc /dev/磁盘名(sda、sdb一类，不带数字)```

生成配置文件：```grub-mkconfig -o /boot/grub/grub.cfg```

EFI模式：
安装引导程序：```pacman -S dosfstools grub efibootmgr```

部署grub：```grub-install --target=x86_64-efi --efi-directory=/boot/EFI --recheck```

生成配置文件：```grub-mkconfig -o /boot/grub/grub.cfg```

### 7.用户设置和配置zsh
设置root密码：```passwd```

安装zsh(更加好用的shell)：```pacman -S zsh```

安装sudo：```pacman -S sudo```

新建用户：```useradd -m -G wheel -s /bin/zsh 你的用户名```
其中的群组wheel是为了设置sudo，并让新用户默认使用zsh

设置新用户密码：```passwd 设置的用户名```

配置sudo：```visudo```
然后将# %wheel All=(All)All中去除#号

切换至新用户：```sudo su - 你的用户名```
安装oh-my-zsh(zsh一个配置)：
```sudo pacman -S git wget curl```
```sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"```
之所以要切换用户，是因为oh-my-zsh自动改变安装时用户的终端设置

#### 8.开机联网和swap文件

有线连接开机启动：```systemctl enable dhcpcd```

设置交换文件(可选)：
生成交换文件：```fallocate -l 大小(4G) /swapfile```

更改权限：```chmod 600 /swapfile```

格式化为swap：```mkswap /swapfile```

启用交换文件：```swapon /swapfile```

设置自动挂载：```vim /etc/fstab```
最后一行添加：```/swapfile none swap defaults 0 0```

至此，基本系统安装完毕，下面是桌面系统安装和常用软件配置。 
请重启后继续。