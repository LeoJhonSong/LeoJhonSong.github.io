---
title: Git杂记
date: 2019-02-27 23:12:27
categories: 杂记, Git
---

稍微记录一下常用git命令

<!-- More -->

<!-- TODO -->

# 登陆git

```shell
git config --global user.name "Your Name"
git config --global user.email "email@example.com"
```

:warning: 每台机器要使用不同的user.name! 为了方便记忆可以同意使用**昵称-机器型号**
的命名方式.

值得一提的是git的配置文件分三级: 系统级(所有用户的), 全局级(当前用户的), 仓库级.
在配置时分别使用`--system`, `--global`, `--local`参数来访问.如果想直接进入配置文件而
不是一个一个元素输入可以使用

```shell
git config -e
```

要注意默认情况下`git config -e`访问**仓库级配置文件**.

# 获取SSH Key

首先查看有没有**~/.ssh**这个文件夹以及文件夹下有没有`id_rsa`和`id_rsa.pub`两个文件.
如果有, 那就不用生成了.

这两个就是SSH Key的秘钥对，`id_rsa`是私钥，不能泄露出去，`id_rsa.pub`是公钥
可以放心地告诉任何人. 比如加入GitHub的SSH Key.

## 生成key

```bash
ssh-keygen -t rsa -C "youremail@example.com"
```

如果没有特别需求(比如甚至想设置密码), 直接连敲三次回车.

有趣的是我发现同一台机器, 如果仍是敲三次回车生成的Key每次是一样的.

# 下载一个repository

:warning: 有http和ssh两种链接, 推荐使用ssh, 有时http形式并不被支持, 比如hexo的git
上传功能.

```shell
git clone [url]
```

# 查看状态

```shell
git status
```

# 暂存所有更改

```shell
git add .
```

# 提交

```shell
git commit
```

# 上传

```git push
```

:warning: 个人仓库的话提交之后一定不要忘记上传! 我在格式化电脑前忘记将本地commit
上传, 失去了好几篇博文啊:cry: (但应该一般没有我这么蠢的)
