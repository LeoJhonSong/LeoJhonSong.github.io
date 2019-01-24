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

> 基本参照[这个](https://www.zhihu.com/question/30315894). 当然VSC的
> [官方指导](https://code.visualstudio.com/docs/languages/cpp)也是很OK的

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

在VSC中打开一个C/C++文件后点侧边栏的`debug`一栏, 一个刚由VSC接手的工作区或者刚建立的项目
需要先添加配置文件. 添加`(gdb)Launch`即可.

**launch.json**中大部分变量变量的含义知乎博主解释得蛮清楚, 整理如下 (不知含义的没有列出) :

| 变量 | 建议值 | 含义 |
| --- | ------ | ---- |
| **name** | "(gdb) Launch" | 配置名称，将会在启动配置的下拉菜单中显示
|**type** | "cppdbg" | 配置类型，这里只能为cppdbg
|**request"** | "launch"| 请求配置类型，可以为**launch**（启动）或**attach**（附加）
|`program` | "\${fileDirname}/${fileBasenameNoExtension}.exe"| 将要进行调试的程序的路径
|**args** | []| 程序调试时传递给程序的命令行参数，一般设为空即可
|`stopAtEntry` | false | 设为true时程序将暂停在程序入口处，我一般设置为true
|**cwd** | "${workspaceFolder}" | 调试程序时的工作目录
|**externalConsole**| true | 调试时是否显示控制台窗口，一般设置为true显示控制台
|**internalConsoleOptions**| "neverOpen" | 如果不设为neverOpen，调试时会跳到“调试控制台”选项卡，你应该不需要对gdb手动输命令吧？
|**MIMode**| "gdb"| 指定连接的调试器，可以为gdb或lldb。但目前lldb在windows下没有预编译好的版本。
|**miDebuggerPath**| "gdb.exe"| 调试器路径，Windows下后缀不能省略，Linux下则去掉
|`preLaunchTask`| "Compile" | 调试会话开始前执行的任务，一般为编译程序。与tasks.json的label相对应

`框起来`的几个是重点.