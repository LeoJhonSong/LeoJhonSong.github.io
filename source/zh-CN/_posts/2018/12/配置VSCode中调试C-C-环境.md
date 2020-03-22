---
title: 配置VSCode中调试C/C++环境
date: 2018-12-30 02:43:35
updated: 2019-10-07 06:13:56
categories:
- [工具]
- [配置]
---

<div align='right'>Language:
<a href='{{ location.host }}/2018/12/30/Configure-C-C-environment-in-VSCode'><kbd>English</kbd></a>
<a href='{{ location.host }}/zh-CN/2018/12/30/配置VSCode中调试C-C-环境'><kbd>中文</kbd></a>
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
      2. [添加至Path](#添加至Path)
      3. [测试](#测试)
   2. [VSCode插件](#VSCode插件)
2. [配置文件](#配置文件)
   1. [配置IntelliSense](#配置IntelliSense)
   2. [配置编译配置文件](#配置编译配置文件)
      1. [合起来!](#合起来)
   3. [配置调试配置文件](#配置调试配置文件)
      1. [调试对象](#调试对象)
      2. [Debugger路径及选项](#Debugger路径及选项)
      3. [启动前编译](#启动前编译)
      4. [合起来!](#合起来-1)
3. [Enjoy](#Enjoy)

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

P.S. 实际上编译器的选择并不是个令人头疼的事, 我们随时可以轻易的更换VSCode使用的编译器

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
你会看到我们将要调用的`gcc`和`gdb`两个程序正在其中.

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
`launch.json`三样, 但现在不是这样了! 🎉 现在`c_cpp_properties.json`已经完全被
`settings.json`取代了, 也就是说在设置中就可以进行原来在`c_cpp_properties.json`中进行的
配置! 这样的好处是我们可以针对不同的工作区进行不同的设置等. 另外, 稍后你也会看到随着VSC的更新`tasks.json`和`launch.json`的生成也变得十分简单!

🔗 关于设置取代了`c_cpp_properties.json`的说明参见[这里](https://github.com/Microsoft/vscode-cpptools/blob/master/Documentation/LanguageServer/Customizing%20Default%20Settings.md),
另外给出对原本可以在`c_cpp_properties.json`中配置的内容的描述的[链接](https://github.com/Microsoft/vscode-cpptools/blob/master/Documentation/LanguageServer/c_cpp_properties.json.md)

:warning: 以下配置文件内容都以我的配置文件为例

## 配置IntelliSense

正如前面所说, 我们不需要VSCode就可以编译/调试C/C++, 因此能够提供智能补全功能的
IntelliSence是**cpptools**这个插件很重要的一部分, 通过在`settings.json` (原本是
`c_cpp_properties.json`)中进行设置来设定IntelliSense的模式. 主要设置以下几个:

```json
"C_Cpp.autocomplete": "Default",
"C_Cpp.clang_format_style": "{ BasedOnStyle: LLVM, UseTab: Never, IndentWidth: 4, TabWidth: 4, BreakBeforeBraces: Allman, AllowShortIfStatementsOnASingleLine: false, IndentCaseLabels: false, ColumnLimit: 0, AccessModifierOffset: -4 }",
"C_Cpp.clang_format_fallbackStyle": "{ BasedOnStyle: LLVM, UseTab: Never, IndentWidth: 4, TabWidth: 4, BreakBeforeBraces: Allman, AllowShortIfStatementsOnASingleLine: false, IndentCaseLabels: false, ColumnLimit: 0, AccessModifierOffset: -4 }",
"C_Cpp.default.compilerPath": "D:\\Softwares\\mingw-w64\\x86_64-8.1.0-posix-seh-rt_v6-rev0\\mingw64\\bin\\gcc.exe",
"C_Cpp.default.cStandard": "c99",
"C_Cpp.default.cppStandard": "c++11",
"C_Cpp.default.intelliSenseMode": "gcc-x64",
"C_Cpp.intelliSenseEngine": "Default",
"C_Cpp.errorSquiggles": "Enabled",
```

💡 其中**C_Cpp.clang_format_style**, **C_Cpp.clang_format_fallbackStyle**是VSC格式化C/C++代码的风格.
上面的配置是近似于**Visual Studio**格式化C/C++代码的风格.
我偏爱VS风格, 而如果你喜欢Google风格, 可以用下面这个值:

```json
"C_Cpp.clang_format_style": "{BasedOnStyleStyle: Google, IndentWidth: 4}",
"C_Cpp.clang_format_fallbackStyle": "{BasedOnStyleStyle: Google, IndentWidth: 4}",
```

随着VSC的更新, VSC提供了一些`tasks.json`和`launch.json`的模板, 这让生成这两个文件变得十分容易!
下面这个gif👇 是一个生成`tasks.json`和`launch.json`的示例.

![](配置VSCode中调试C-C-环境/example.gif)

💡 这个gif是在Linux系统 (Ubuntu) 下录制的.

下面则是对这两个文件内容的一些解释.

## 配置编译配置文件

然后配置编译用的`tasks.json`.

✔️ 这个文件和之后配置的`launch.json`都是针对特定程序的,
如何生成这两个文件请参见VSCode官方文档. 但你可以将满意的`tasks.json`和`launch.json`放
在一个包含许多工程的目录中, 那么这些工程都将使用这两个配置文件. 如果你想给这之中某个工程
配置不同的配置你可以在这个工程的根目录另外生成`tasks.json`和`launch.json`, 会覆盖上一层
的配置.

当你跟随VSCode官方文档创建了一个 `tasks.json` 之后, 将下面这个任务添加到tasks的列表,
至于自带的label为 **echo** 的任务你可以删掉或者不管他.

```json
{
   "label": "Compile",
   "type": "shell",
   "command": "gcc",
   "args": [
         "${file}",
         "-o",
         "${fileDirname}/${fileBasenameNoExtension}.exe",
         "-g",
         "-Wall",
         "-std=c++17"
   ],
   "group": {
         "kind": "build",
         "isDefault": true
   }
}
```

`label`的意思是给这个任务取名为**Compile**, [稍后](#启动前编译)会用到.

从中我们可以看出实际上当我们调用这个叫**Compile**的task的时候会在shell中输入:

```shell
gcc ${file} -o ${fileDirname}/${fileBasenameNoExtension}.exe -g -Wall -std=c++17
```

其中**${file}**等是[VSCode中定义的变量](https://code.visualstudio.com/docs/editor/variables-reference)

`-o`选项使我们可以[指定生成文件的名字](http://www.runoob.com/note/28613)

其他几个选项可以上网查查.

`group`这里的配置是我们能通过快捷键 `Ctrl+shift+B`来执行该任务.
参见[这里](https://code.visualstudio.com/docs/editor/tasks#_typescript-hello-world)

### 合起来!

因此我的 `tashs.json` 长这样:

```json
{
    // See https://go.microsoft.com/fwlink/?LinkId=733558
    // for the documentation about the tasks.json format
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Compile",
            "type": "shell",
            "command": "gcc",
            "args": [
                "${file}",
                "-o",
                "${fileDirname}/${fileBasenameNoExtension}.exe",
                "-g",
                "-Wall",
                "-std=c++17"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            }
        }
    ]
}
```

## 配置调试配置文件

最后配置的这个是`launch.json`. 实际上这很简单, 因为VSCode已经提供了很多种模板, 需要
改动的非常少.

通常我们选择 **(gdb) Launch** 这种模板. Launch指的是要调试的程序是在开始调试时才开始运行,
Attach指的是开始调试时程序已经在运行了 (比如在服务器上的程序)

需要改动/添加的非常少:

### 调试对象

```json
"program": "${workspaceFolder}/a.exe"
```

`program`指的是要调试的程序. 如果不特别指出的话大多数编译器默认将编译出来的可执行文件
命名为 **a.exe**. 而如果你的`tasks.json`也像我一样加了
"-o \${fileDirname}/${fileBasenameNoExtension}.exe" 这个选项的话, 将会生成和源文件
同名的可执行文件, 因此要用:

```json
"program": "${workspaceFolder}/${fileBasenameNoExtension}.exe"
```

### Debugger路径及选项

如果你在命令行输入 `gdb` 你会发现首先映入眼帘的是一串废话, 因此我们可以加上`-q`这个选项
来让它少说废话.

```json
"miDebuggerPath": "gdb.exe",
"miDebuggerArgs": "-q"
```

### 启动前编译

如果你担心自己忘记每次调试前先编译一遍已更改的代码 (不然你会哭出声响), 可以添加一个
**preLaunchTask**, 这个task指定为刚配置的那个**Compile**任务.
这样每次调试前程序都会被先编译一遍:thumbsup:

```json
"preLaunchTask": "Compile"
```

### 合起来!

因此我的`launch.json`长这样:

```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "(gdb) Launch",
            "type": "cppdbg",
            "request": "launch",
            "program": "${workspaceFolder}/${fileBasenameNoExtension}.exe",
            "args": [],
            "stopAtEntry": false,
            "cwd": "${workspaceFolder}",
            "environment": [],
            "externalConsole": true,
            "MIMode": "gdb",
            "miDebuggerPath": "gdb.exe",
            "miDebuggerArgs": "-q",
            "setupCommands": [
                {
                    "description": "Enable pretty-printing for gdb",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }
            ],
            "preLaunchTask": "Compile"
        }
    ]
}
```

# Enjoy

这下我们可以轻松愉快的开发C/C++了! 祝各位水平日益提高:tada: