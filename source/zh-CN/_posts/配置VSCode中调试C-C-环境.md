---
title: 配置VSCode中调试C/C++环境
date: 2018-12-30 02:43:35
categories: 工具
---

<div align='right'>Language:
<a href='{{ location.host }}/Configure-C-C-environment-in-VSCode'><code>English</code></a>
<a href='{{ location.host }}/zh-CN/配置VSCode中调试C-C-环境'><code>中文</code></a>
</div>

这里是为我在VSCode插件市场发布的
[C/C++扩展包](https://marketplace.visualstudio.com/items?itemName=LeoJhonSong.ccpp-extension-pack)
写的Windows下VSCode中C/C++配置教程:tada:

<!-- More -->

实际上在[VSCode的说明文档中C++部分](https://code.visualstudio.com/docs/languages/cpp)
对如何配置环境有十分详细的说明, 本文仅是对其的部分整理和解读:smile: 因此如果你的能力足够看
官方文档当然是更好的选择:thumbsup:

P.S.其实只要右键翻译成中文我觉得不难懂...

1. [准备工作](#准备工作)
   1. [编译器](#编译器)
      1. [安装](#安装)
      2. [添加至Path](#添加至path)
      3. [测试](#测试)
   2. [VSCode插件](#vscode插件)
2. [配置文件](#配置文件)

# 准备工作

VSCode本身只是一个编辑器, 也就是一个记事本, 是不包含编译器的. 即便我们安装了cpptools
这个扩展, 他也并没有为我们安装编译器 (如果你想看看cpptools这个扩展里都有什么可以前往
自己电脑的 **%HOMEPATH%\\.vscode\extensions**, 找到**ms-vscode.cpptools** 去看看)

## 编译器

因此第一步我们需要安装编译器. 编译器不止一家, 在VSCode官方文档中推荐的是:

- Windows平台: [MinGW-w64](https://sourceforge.net/projects/mingw-w64/)

  :warning: 要注意另有一个叫MinGW的东西, 虽然功能差不多, 但那个已经很久没更新了,
  安装没MinGW-w64容易, 还不是官宣, 因此不推荐. 后面所说的MinGW实际指的是MinGW-w64, 我
  只是懒得打那么多字了

- macOS: [clang](http://releases.llvm.org/download.html)
- Linux: [gcc](https://gcc.gnu.org/)

:exclamation:因为我没钱买Mac, 暂时也没需求在Linux配置VSCode, 本文仅针对**Windows**
平台, 当然也可以作为其他平台的参考. 甚至[有人在树莓派安装VSCode](https://pimylifeup.com/raspberry-pi-visual-studio-code/).

### 安装

将MinGW-w64下载下来之后点击安装, 以下几点要注意, 其余选项默认即可:

- 安装向导第一页有一项是选择`Architecture` (即电脑的架构, 此处i386代指32位电脑,
  x86_64代指64位电脑), 此处选择**x86_64**. (当然如果你的电脑竟然是32位的话不用变)

  :heavy_check_mark: 如何查看自己电脑是32位还是64位?

  Windows10的话, 前往 **设置** > **系统** > **关于** > **设备规格** > **系统类型**

  其他Windows的话上网搜索一下好啦 :wink:

- 安装在哪里都可以, 但一定要是你找得到的地方, 因为安装完成后还要手动将MinGW加入**Path**.

### 添加至Path

安装完毕后我们需要将MinGW添加至**Path**, 这样我们通过命令行就可以调用它啦 (VSCode编译/调试
C/C++程序实际上就是在内置命令行中调用MinGW)

要将什么路径添加到**Path**呢? 因为添加到Path的路径是要调用的程序的exe文件所在的文件夹
比如我将MinGW安装到了 **D:\Softwares\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0**
这个文件夹下, 那么我将
**D:\Softwares\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin**加入环境变量.
你会看到我们将要调用的`gcc`和`g++`两个程序正在其中.

:link: 关于如何添加系统变量, [这篇百度知道](https://jingyan.baidu.com/article/ca41422f17107a1eaf99ed64.html)应该就够了

### 测试

这之后! 我们测试一下, 在命令行输入`gcc`

:heavy_check_mark: 你看到的应当是:

```shell
C:\Users\LeoJh>gcc
gcc: fatal error: no input files
compilation terminated.
```

这是说gcc被成功唤起,我们已经成功完成编译器的配置了, 但你没告诉它要编译的文件路径, 所以他就报错了.

:x:而如果你看到的是:

```shell
C:\Users\LeoJh>gcc
'gcc' 不是内部或外部命令，也不是可运行的程序
或批处理文件。
```

这是说无法从命令行调用gcc. 一种情况是没有把正确的路径加入**Path**, 另一种情况是该换电脑了
:grin:

## VSCode插件

搞定了编译器我们就离完成不远了! 实际上你现在已经可以开始开发C/C++了, 只不过是硬核一些.
不信你可以搓一段hello world放进一个.c文件, 比如**test.c**, 在该文件所在文件夹空白处
按住`shift`同时按右键, 在此打开powershell, 输入`gcc test.c`, 然后你就会发现文件夹里
多了一个**a.exe**. 这便是编译好的可执行文件了!

但这样无论是编辑还是编译还是调试体验都太差了, 于是我们安装一些好用的扩展提高效率.

因为我并不常在VSCode中编写C/C++, 因此[我的扩展包](https://marketplace.visualstudio.com/items?itemName=LeoJhonSong.ccpp-extension-pack)
中并没有几个插件. 但我认为这几个很不错的:smile:

当然你看不上我的扩展包也没事:cry:只需要安装了[官方C/C++支持扩展](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
就能体验到很强大的支持了.

# 配置文件

在有些教程中, 要在VSCode中开发C/C++需要配置`c_cpp_properties.json`, `tasks.json`,
`launch.json`三样, 但现在不是这样了! :tada: 