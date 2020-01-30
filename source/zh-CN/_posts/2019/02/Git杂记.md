---
title: Git杂记
date: 2019-02-27 23:12:27
categories: [版本控制]
---

稍微记录一下常用git命令

<!-- More -->

<!-- TODO -->

## 登陆git

```shell
git config --global user.name "Your Name"
git config --global user.email "email@example.com"
```

:warning: 每台机器要使用不同的`user.name`! 为了方便记忆可以统一使用**昵称-机器型号**
的命名方式.

值得一提的是git的配置文件分三级: 系统级(所有用户的), 全局级(当前用户的), 仓库级.
在配置时分别使用`--system`, `--global`, `--local`参数来访问.如果想直接进入配置文件而
不是一个参数一个参数地设置可以使用:

```shell
git config -e
```

要注意默认情况下`git config -e`访问**仓库级配置文件**.

## 有关SSH

用ssh方式登录git的话只是生成秘钥和在远程端添加秘钥麻烦一次, 后面就可以免密码, 而
用http登录的话每次push都需要输入密码, 略微麻烦.

### 获取SSH Key

首先查看有没有**~/.ssh**这个文件夹以及文件夹下有没有`id_rsa`和`id_rsa.pub`两个文件.
如果有, 那就不用生成了.

这两个就是SSH Key的秘钥对，`id_rsa`是私钥，不能泄露出去，`id_rsa.pub`是公钥
可以放心地告诉任何人. 比如加入GitHub的SSH Key.

### 生成key

```bash
ssh-keygen -t rsa -C "youremail@example.com"
```

如果没有特别需求(比如甚至想设置密码), 直接连敲三次回车.

💡 其实在输入命令后第一个选项是指定生成的秘钥文件名, 可以指定为`id_rsa_github`,
`id_rsa_gitee`这样, 加上远程端的名字, 这样有多个远程端时也不会混乱.

有趣的是我发现同一台机器, 如果仍是敲三次回车生成的Key每次是一样的.

### 同时上传到多个远程端

新建`~/.ssh/config`, 如果远程端是github和gitee, github和gitee的ssh key是像上面说
的这样命名的, 那么内容如下:

```shell
# github
Host github.com
HostName github.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa_github

# gitee
Host gitee.com
HostName gitee.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa_gitee
```

## 下载一个repository

:warning: 有http和ssh两种链接, 推荐使用ssh, 有时http形式并不被支持, 比如hexo的git
上传功能.

```shell
git clone [url]
```

### 下载特定分支

```shell
git clone -b [branch] [url]
```

## 查看状态

```shell
git status
```

## 暂存所有更改

```shell
git add .
```

## 提交

```shell
git commit
```

## 上传

```shell
git push
```

:warning: 个人仓库的话提交之后一定不要忘记上传! 我在格式化电脑前忘记将本地commit
上传, 失去了好几篇博文啊:cry: (但应该一般没有我这么蠢的)

## git仓库瘦身

我也终于遇到了git仓库被搞太大需要瘦身的情况了.

> [BFG](http://rtyley.github.io/bfg-repo-cleaner/) 是为将像大文件或者密码这些不想要的数据从 Git 仓库中删除而专门设计的，所以它有一一个简单的标志用来删除那些大的历史文件（不在当前的提交里面）：`--strip-blobs-bigger-than`
>
> ```shell
> $ java -jar bfg.jar --strip-blobs-than 100M
> ```
>
> 大小超过 100MB 的任何文件（不包含在你*最近的*提交中的文件——因为 BFG [默认会保护你的最新提交的内容](http://rtyley.github.io/bfg-repo-cleaner/#protected-commits)）将会从你的 Git 仓库的历史记录中删除。如果你想用名字来指明具体的文件，你也可以这样做：
>
> ```shell
> $ java -jar bfg.jar --delete-files *.mp4
> ```

这个体验不错.