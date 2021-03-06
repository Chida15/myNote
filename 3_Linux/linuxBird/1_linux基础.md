## linux基础

### 一.初次使用

| 基础指令     | 帮助系统 | 系统操作 | 系统信息 |
| ------------ | -------- | -------- | -------- |
| 日期时间date | man      | shutdown | uname    |
| 日历cal      | info     | reboot   | PATH     |
| 计算器bc     |          | sync     |          |

### 二.文件权限

| 改变权限 | 默认权限 | 隐藏属性                   | 特殊权限                                            |
| -------- | -------- | -------------------------- | --------------------------------------------------- |
| chgrp    | umask    | chatter(change attributes) | SUID(使用者暂时拥有root权限)                        |
| chown    |          | lsatter(list attributes)   | SGID(执行者获得该程序用户组的支持)                  |
| chmod    |          |                            | SBIT(用于目录,该目录文件仅所有者和root才有权限删除) |

### 三.文件操作

| 目录操作 | 文件操作 | 路径选取 | 查看文件信息 |
| -------- | -------- | -------- | ------------ |
| ls       | touch    | basename | less         |
| cd       | cp       | dirname  | head         |
| pwd      | rm       |          | tail         |
| mkdir    | mv       |          |              |
| rmdir    |          |          |              |

### 四.文件检索

| which        | whereis | locale | find |
| ------------ | ------- | ------ | ---- |
| 寻找执行文件 |         |        |      |

### 五.打包和压缩

| tar压缩                                 | 查询                 | 解压缩                         | cpio单文件包 |
| --------------------------------------- | -------------------- | ------------------------------ | ------------ |
| tar -jcv -f 目的文件 被压缩文件或文件夹 | tar -jtv -f 压缩文件 | tar -jxv -f 压缩包 -C 目的目录 |              |