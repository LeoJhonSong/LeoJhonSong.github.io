---
title: vim使用杂记
date: 2019-07-10 15:58:14
categories: vim
---

使用vim开发也有半年多啦, 不过配置vim也是个漫长的过程. 记录一下常用快捷键和用法和配置过程.

<!-- More -->

🌟首先放上我的[vimrc链接](https://github.com/LeoJhonSong/vimrc)

在vim中, 多文件编辑主要涉及三个概念: **窗口**, **标签页**, **缓冲区**

相关参考:

🔗 [Vim 多文件编辑：窗口](https://harttle.land/2015/11/14/vim-window.html)  
🔗 [Vim 多文件编辑：标签页](https://harttle.land/2015/11/12/vim-tabpage.html)  
🔗 [Vim 多文件编辑：缓冲区](https://harttle.land/2015/11/17/vim-buffer.html)

# 调整窗口

## 在窗口间移动

`Ctrl w` 接 hjkl上下左右在各窗口间移动光标  
`Ctrl w t` 移动光标至最左上窗口  
`Ctrl w b` 移动光标至最右下窗口

## 调整大小

宽度调整:

`Ctrl w [n] >` 右移边界  
`Ctrl w [n] <` 左移边界

💡默认增减1个字符宽度, 可以在Ctrl w和+/-间加数字来指定增减宽度. 不是最右边的窗口
调整的是右边界, 最右边的窗口调整的是左边界.

高度调整:

`Ctrl w [n] +` 增加高度  
`Ctrl w [n] -` 减小高度

## 调整位置

`Ctrl w` 接HJKL移动窗口至最上下左右并且宽度或高度为最大.  
`Ctrl w r` 顺时针移动窗口  
`Ctrl w R` 逆时针移动窗口

# 代码折叠

# 拼写检查

# 键映射

# 插件

## vim-plug

## NERDtree

C
R
r
s
i
