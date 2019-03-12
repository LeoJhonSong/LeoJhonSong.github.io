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

## 软件列表更新

```shell
sudo apt update
```

## 软件升级

```shell
sudo apt upgrade
```

:warning: 需在运行`sudo apt update`后运行

## 软件安装

```shell
sudo apt install [package]
```

## 软件卸载

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

## 删除

rm: remove

### 常用选项

- -i 删除前逐一询问确认
- -f 即使原档案属性设为唯读，亦直接删除，无需逐一确认
- -r 将目录及以下之档案亦逐一删除

### 删除文件

```shell
rm test.txt
```

### 删除文件夹

```shell
rm -r test
```

### 删除当前文件夹下所有文件及文件夹

```shell
rm -r *
```

## 解压/压缩

tar: tape archive. `tar` 命令原本是用来建立，还原备份文件的工具程序, 但Linux下最常见的
压缩包就是tar.gz格式的.

### 常用选项

- -c或--create 建立新的备份文件
- -f<备份文件>或--file=<备份文件> 指定备份文件
- -t或--list 列出备份文件的内容
- -v或--verbose 显示指令执行过程
- -x或--extract或--get 从备份文件中还原文件
- -z或--gzip或--ungzip 通过gzip指令处理备份文件

### 列出压缩文件内容

```shell
tar -tzvf test.tar.gz
```

### 解压文件

```shell
tar -xzvf test.tar.gz
```

### 压缩文件

```shell
touch a
tar -czvf test.tar.gz a   #压缩 a文件为test.tar.gz
```

# 环境变量

# 文本编辑

## 只打一行

# 文件权限设置

chmod: change mode

# 后台运行
