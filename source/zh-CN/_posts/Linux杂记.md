---
title: Linux杂记
date: 2019-02-27 23:23:09
categories:
---

最近使用Linux频繁了起来, 接触到更多各种各样的命令, 然后我脑容量不够了:grin:

<!-- More -->

1. [apt](#apt)
   1. [源列表备份与恢复](#源列表备份与恢复)
   2. [换源](#换源)
   3. [软件列表更新](#软件列表更新)
   4. [软件升级](#软件升级)
   5. [软件安装](#软件安装)
   6. [软件卸载](#软件卸载)
2. [解压/压缩](#解压压缩)
3. [环境变量](#环境变量)
4. [文本编辑](#文本编辑)
   1. [只打一行](#只打一行)
5. [文件权限设置](#文件权限设置)
6. [删除](#删除)
7. [复制](#复制)
8. [后台运行](#后台运行)
9. [链接](#链接)

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

# 解压/压缩

tar: tape archive. `tar` 命令原本是

# 环境变量

# 文本编辑

## 只打一行

# 文件权限设置

chmod (change mode)

# 删除

rm (remove)

# 复制

cp (copy)

# 后台运行

# 链接

ln (link)