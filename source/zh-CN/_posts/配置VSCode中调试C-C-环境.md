---
title: 配置VSCode中调试C/C++环境
date: 2018-12-30 02:43:35
categories: 工具
---

<div align='right'>Language:
<a href='{{ location.host }}/Configure-C-C-environment-in-VSCode'><code>English</code></a>
<a href='{{ location.host }}/zh-CN/配置VSCode中调试C-C-环境'><code>中文</code></a>
</div>

软件这东西更新太快了, 别人的教程总有自己这里不适用的地方:cry:, 记录一下自己配置VSC
下C/C++的过程.

> 基本参照[这个](https://www.zhihu.com/question/30315894)

由于我已经用了一阵子VSC了, 最近才开始学着写一点C/C++, 所以跳过了一点上面提及的知乎文章
的步骤. 另外我也蛮庆幸我一开始用VSC主要是在写Python, Web什么的, 而我那打主意用VSC写点C/C++
的同学一看到如此麻烦的配置就放弃VSC了:smirk:

# 下载安装LLVM和MinGW-w64

虽然那篇文章中推荐下**MinGW-w64** 而不是**MinGW**, 看样子是担心MinGW太久没有更新会与哪里不兼容吧?
但我前阵子摆弄的时候已经下了一个MinGW...
看了看感觉不是MinGW-w64, 但我懒得折腾了, 目前来看没有问题 (而且那位知乎博主也只是说不推荐):smile:
因此我只是把**MinGW/bin**添加到了**path**里, 并没有复制任何东西到LLVM.

:heavy_check_mark: 下载链接:

- [LLVM](https://link.zhihu.com/?target=http%3A//releases.llvm.org/download.html)
  选**Pre-Built Binaries**中的Clang for Windows (64-bit)，不需要下.sig文件
- [MinGW-w64](https://link.zhihu.com/?target=https%3A//sourceforge.net/projects/mingw-w64/)

然后按文中方法测试一下clang是否安装成功

# 安装VSC插件

## 必装插件

- [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)

## 推荐插件

- [Code Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner) : 拿来编译可执行文件不错的
  (反正会在VSC写的C/C++程序只会是小程序, 大型工程还是VS走着)
- [vscode-clangd](https://marketplace.visualstudio.com/items?itemName=llvm-vs-code-extensions.vscode-clangd) : LLVM官方出品, 我觉得OK

## 配置配置文件和task文件

此处与知乎文章的做法出入还是有一些, 大概是VSC更新了的缘故吧. 总之操作变简单了.

在VSC中打开一个C/C++文件后点侧边栏的`debug`一栏, 一个刚由VSC接手的工作区或者刚建立的