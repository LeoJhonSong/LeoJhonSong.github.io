---
title: Linux杂记
date: 2019-02-27 23:23:09
categories: 杂记
---

最近使用Linux频繁了起来, 接触到更多各种各样的命令, 然后我脑容量不够了:grin:

<!-- More -->

# apt

apt: **Advanced Packaging Tools**

## 源列表备份与恢复

:exclamation: 我建议换源之前做好备份. 使用如下命令可备份**source.list**至
**source.list_backup**. 甚至再谨慎一些每次更新源列表后都可以做一份备份, 在文件名中
加入时间或者更新信息来作区分.

```shell
sudo cp /etc/apt/sources.list /etc/apt/sources.list_backup
```

如果哪天把源列表弄脏了可以随时用一下命令恢复.

```shell
sudo cp /etc/apt/sources.list_backup /etc/apt/sources.list
```

## 换源

```shell
sudo sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
```

另一种换源方式是进入source.list进行修改, 参见以下链接.

:link: [中科大Ubuntu镜像使用帮助](https://lug.ustc.edu.cn/wiki/mirrors/help/ubuntu)

(我对这个和我校校名只有一字之差的学校还是很有好感:smile:)

## 包列表更新

```shell
sudo apt update
```

## 包升级

```shell
sudo apt upgrade
```

:warning: 需在运行`sudo apt update`后运行

## 包搜索

这怕是少数几条不用sudo的`apt`命令

```shell
apt search [package]
```

## 包安装

```shell
sudo apt install [package]
```

## 包卸载

```shell
sudo apt remove [package]
```

# 文件系统

:link: 在搜索过程中看到
[这篇文章](https://www.ibm.com/developerworks/cn/linux/l-cn-hardandsymb-links/index.html),
感觉对Linux下文件系统描述得很好, 比如其中说

> Linux系统中进程之外皆文件, 即便文件夹也是一个文件, 是记录了其他文件名的文件.
> 设备也被视为一个文件.

再比如其中说到了
[Linux系统有多个文件系统](https://www.ibm.com/developerworks/cn/linux/l-cn-hardandsymb-links/index.html/#major4),
VFS 作为一个通用的文件系统, 抽象了文件系统的四个基本概念: 文件, 目录项
(dentry, directory entry的缩写), 索引节点 (inode) 及挂载点.

> 文件名仅是为了方便人们的记忆和使用, 系统或程序通过inode号寻找正确的文件数据块.

## 链接

ln: link

:link: [这里](https://www.ibm.com/developerworks/cn/linux/l-cn-hardandsymb-links/index.html/#major2)
有对软链接与硬链接的比较. 其中:

- 软链接以**路径**的形式存在,类似于Windows操作系统中的**快捷方式**. 硬链接以
  **文件副本**的形式存在, 但不占用实际空间
- 软链接可以跨文件系统创建，硬链接不可以
- 软链接可以对一个不存在的文件名进行链接
- 软链接可以对目录进行链接, 硬链接不可以

暂时还没用过这条指令, 记下[命令讲解](http://www.runoob.com/linux/linux-comm-ln.html)

## 复制

cp: copy

:warning: 目标位置必须已经存在, `cp`命令无法创建目录. 另外如果没有文件复制的权限会
报错. `cp`命令不止可以复制, 还可以建立链接.
`cp`命令支持..表示上级文件夹等, 支持正则表达

### 常用选项

- -a：此选项通常在复制目录时使用，它保留链接、文件属性，并复制目录下的所有内容。其作用等于dpR参数组合
- -d：复制时建立软链接
- -f：覆盖已经存在的目标文件而不给出提示
- -i：与-f选项相反，在覆盖目标文件之前给出提示，要求用户确认是否覆盖，回答"y"时目标文件将被覆盖

  :warning:保险起见每次都加上此选项
- -p：除复制文件的内容外，还把修改时间和访问权限也复制到新文件中。
- -r：若给出的源文件是一个目录文件，此时将复制该目录下所有的子目录和文件
- -l：建立硬链接, 不复制文件

### 正则使用举例

将目录 **/usr/men** 中的以`m`打头的所有`.c`文件复制到目录 **/usr/zh** 中

```shell
cp /usr/men m*.c /usr/zh
```

## 删除

rm: remove

### 常用选项

- -i 删除前逐一询问确认
- -f 即使原档案属性设为唯读，亦直接删除，无需逐一确认
- -r 将目录及以下之档案亦逐一删除

### 删除文件

```shell
rm [path/to/file] [path/to/another/file]
```

### 删除文件夹

```shell
rm -r [path/to/folder]
```

### 删除当前文件夹下所有文件及文件夹

```shell
rm -r *
```

## 解压/压缩

tar: tape archive. `tar` 命令原本是用来建立，还原备份文件的工具程序, 但Linux下最常见的
压缩包就是tar.gz格式的. **.gz**是GNU zip的缩写.

### 常用选项

- -c或--create 建立新的备份文件
- -f<备份文件>或--file=<备份文件> 指定备份文件
- -t或--list 列出备份文件的内容
- -v或--verbose 显示指令执行过程
- -x或--extract或--get 从备份文件中还原文件
- -z或--gzip或--ungzip 通过gzip指令处理备份文件

### 列出压缩文件内容

```shell
tar -tvzf [source.tar.gz]
```

### 解压文件

```shell
tar -xvzf [source.tar.gz]
```

### 压缩文件

```shell
tar -czvf [target.tar.gz] [file1] [file2] [file3]
```

# 环境变量

## 查看环境变量

### 查看所有环境变量

```shell
export -p
```

### 查看PATH

```shell
echo $PATH
```

### 查看当前运行shell

```shell
echo $SHELL
```

:exclamation: shell不止一种, 大多数Linux系统默认shell为
**Bash shell** (Bourne Again shell), 似乎**Bourne shell**仍是许多Unix系统默认的shell. 比较著名的还有
**Z shell** (Zsh), **friendly interactive shell** (fish).

## 添加路径到PATH

### 临时添加

```shell
export PATH=$PATH:[path/to/append]
```

:warning: 应注意export命令仅作用于当前终端.

### 永久添加

首先我们需要了解哪些文件与环境变量有关.

在Linux系统中**最常见**与环境配置有关的文件是四个shell初始化文件, 想要添加环境变量最常见的
方法就是将命令添加到适当文件中, 这样每当shell被唤起, 在初始化时, 环境变量都会被添加进去.
但但不同情况下会加载不同的初始化文件, 究竟需要更改哪一个/几个呢? 他们的比较如下:


| |`/etc/profile`|`/etc/bash.bashrc`|`~/.profile`|`~/.bashrc`|
|-|-|-|-|-|
|等级|系统级|系统级|用户级|用户级|
|自动加载的情况|login shell|interactive shell|login shell|interactive shell|
|作用于哪些shell|Bourne系shell|仅Bash|Bourne系shell|仅Bash|
|加载顺序|先|先|后|后|

:link:关于何时哪个文件会被加载也可以参考[这里](http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_01_02.html)

:warning: 在有些系统中不是`/etc/bash.bashrc`, 而是`/etc/bashrc`

:warning: `/etc/profile`仅针对Bourne系shell是指当shell为Bourne Shell, Bash, ksh
等的时候`/etc/profile`才可能被加载, 而当我唤起一个**zsh**时, **以上四个初始化文件都没有被加载**
:man_shrugging:

:warning: 在用户目录可能还存在`~/.bash_profile`, `~/.bash_login`这两文件, 系统会
依次查找`~/.bash_profile`, `~/.bash_login` 和 `~/.profile`这三个配置文件, 读取和执行
这三个中的**第一个**存在且可读的文件中命令, 因此建议将三个合并为一个.

:warning: 当**bashrc**一系和**profile**一系都会被加载时两者哪个会先被加载并不
一定, 有点玄学... 经我测试运行`bash -cl bash` **profile**一系会先被加载, 而运行
`bash -l`则**bashrc**一系会先被加载:man_facepalming: 但很明确的一点是:
系统级初始化文件一定会先与用户级文件被加载. 即便根据应当允许用户个性化设置这种尝试也能
推断出 (用户级初始化文件后于系统级初始化文件被加载, 所以用户级文件中的配置会覆盖系统级
文件的对应配置)

:heavy_check_mark:有关四种shell模式个人感觉坑挺多的:

- **login shell**: 笼统地理解就是有**输入用户名和密码**这一过程才能进入的shell, 比如
  **通过ssh访问远程服务器**, 否则
  就是**non-login shell** 但是! 比如**通过`su`切换用户**时默认进入的是**non-login shell**,
  如需切换用户进入login shell需要加选项`-l`:man_facepalming: 还有, 经过GitHub
  广大网友建议, **进入WSL**默认进入的是**login shell**, 即便你并没有输入用户名密码.
- **interactive shell**指的是你一句电脑一句这样交互式的终端, 而**no-interactive shell**
  指的是**通过脚本**, **运行`bash -c [command]`**之类指哪打哪和电脑没有交流的shell.

- 检测当前是login shell还是non-login shell: 有一个特点是login模式运行的shell进程名
  第一个字符是-, 因此如果你输入`echo $0`输出的是**-bash**, 那么你就是在login shell中,
  如果是**bash**, 那就是在non-login shell中.

:star2:有了以上的知识储备我们就知道需要将环境变量添加到什么文件里了.

## 删除一个环境变量

### 临时删除

```shell
export -n [VARIABLE]
```

### 永久删除

参考永久添加的操作.

# 文本编辑

## 显示文件内容

cat: concatenate

### 常用选项

- -n 或 --number：由 1 开始对所有输出的行数编号。

- -b 或 --number-nonblank：和 -n 相似，只不过对于空白行不编号。

### 镜像

cat 也可以用来制作镜像文件. 例如要制作软盘的镜像文件, 将软盘放好后输入：

```shell
cat /dev/fd0 > [OUTFILE]
```

相反的, 如果想把 image file 写到软盘, 输入：

```shell
cat [IMG_FILE] > /dev/fd0
```

## 覆盖目标文件的写入

:exclamation:一定别和添加内容到文件的命令搞混了!

### 写入一些文件的内容

```shell
cat [file1] [file2] > [target_file]
```

### 写入一个字符串

```shell
echo ["string"] > [target_file]
```

## 添加到目标文件的写入

### 写入一些文件的内容

```shell
cat [file1] [file2] >> [target_file]
```

### 写入一个字符串

```shell
echo ["string"] >> [target_file]
```

## 清空文件内容

```shell
cat /dev/null > [target_file]
```

# 文件权限设置

chmod: change mode

# 后台运行
