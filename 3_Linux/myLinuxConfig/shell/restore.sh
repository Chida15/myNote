#!/bin/bash
# 恢复i3wm配置
mkdir $HOME/.i3
cp ../config/config $HOME/.i3/config

# 恢复Xresources
cp ../config/.Xresources $HOME/.Xresources

# 恢复vimrc
cp ../config/.vimrc $HOME/.vimrc
