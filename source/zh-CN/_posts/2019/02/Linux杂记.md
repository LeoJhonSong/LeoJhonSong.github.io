---
title: Linux杂记
date: 2019-02-27 23:23:09
updated: 2021-01-25 11:50:37
categories:
  - [操作系统, Linux]
  - [杂记]
---

最近使用Linux频繁了起来, 接触到更多各种各样的命令, 然后我脑容量不够了:grin:
由于有[TLDR](https://github.com/tldr-pages/tldr)这种神器, 在这里并不会无脑记录所有
看到的命令, 而是小白最常用或者不太容易懂含义的几个命令.

:link:如果弄不清命令的含义, 我在
[另一篇博客](https://leojhonsong.github.io/zh-CN/%E5%B8%B8%E8%A7%81%E6%9C%AF%E8%AF%AD%E7%BC%A9%E5%86%99/)
记录了一些缩写及对应含义, 希望有所帮助.

💡 推荐一个觉得很不错的Linux命令入门教程[LGCB](https://happypeter.github.io/LGCB/)

<!-- More -->

# 查看版本

## 查看内核版本

```shell
uname -r
```

这条更加详细, 提issue时常用到

```shell
cat /proc/version
```

## 查看发行版版本

```shell
cat /etc/issue
```

这个更详细:

```shell
sudo lsb_release -a
```

# 软件安装卸载等

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

💡 其中以**deb-src**开头的行是源代码的地址, 只有取消这些行的注释才能下载源代码.

## 包列表更新

这一命令虽然看似唰唰唰下了好些东西, 实际上只是下载了个软件目录, 然后我们执行 `sudo apt install
[package]` 的时候apt就会从这个列表中找到名字对应的下载连接之类的去下载和安装. 这就是为什么很多
安装教程都会要求先执行一次这条命令 -- 保证安装的是最新版.

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

💡`apt remove`只会删除软件包而不会删除配置文件, 而手动删除配置文件还容易有
[麻烦](https://www.jianshu.com/p/f6176973b56f), 因此不想用某软件了应当运行:

```shell
 sudo apt purge [package]
 ```

中文唤做**净化**! 💪

## 进阶操作

有很多东西并不是用包管理工具就能轻松搞定的， 让人欲哭无泪， 主要有以下几种情况：

### 下载下来的压缩包里有看着像安装脚本的玩意

这种一般会给出**README**的, 不用担心, 即便没给也可以用编辑器点开看着像安装用脚本的文件脑力运行
一边看看是不是它😏 有的安装脚本是交互式的, 还是挺有趣的, 有的甚至有图形界面 (一般需要加选项才能
有图形界面)

### 有deb包

#### 普通安装

1. 有图形界面的话点击就能安装
2. 终端进入deb包所在文件夹, 运行`sudo dpkg -i [package]`

#### 遇到报错

##### 修复依赖关系

有时候我们会因为缺少一些包而安装失败, 这个是个很容易解决的问题, 只需运行
`apt --fix-broken install`. 这样普通问题apt就能帮我们解决了✌️

💡另一条相同作用的命令是`apt install -f`

##### 需要对包的依赖关系进行修改

1. **在要安装的deb包所在目录中**创建相关文件夹:

   ```shell
   mkdir extract
   mkdir extract/DEBIAN
   mkdir build
   ```

2. 解压出包中的文件到**extract**目录下:

   ```shell
   dpkg -X [package] extract/
   ```

3. 解压出包的控制信息到**extract/DEBIAN/**下:

   ```shell
   dpkg -e [package] extract/DEBIAN/
   ```

4. 将修改后的内容重新进行打包生成deb包到**build**目录下:

   ```shell
   dpkg-deb -b extract/ build/
   ```

5. 进入**build**文件夹安装修改后的deb包

### 需要自己编译

```shell
make
make install
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

目前我只用到了软链, 还没有用到硬链. 个人觉得软链很方便, 它使得一个文件/文件夹在另一个地方有了
一个时刻同步的备份. 比如可以像[这样](https://github.com/LeoJhonSong/vimrc), 从github
下载了一个.vimrc, 将它软链到home目录 (vim默认从这里读取.vimrc). 这样一来无论是修改了这两处
那一个.vimrc另一个也会同步. 这很方便将更改备份到github.

### 建立软链

```shell
ln -s [source] [destination]
```

❗️要注意的是此处`destination`和`source`似乎必须写**绝对路径**, 不然建立的链接就是损坏的.
如果`destination`处写的是一个目录, 那会生成一个和源文件/文件夹同名的软链, 而如果`destination`
写的是一个存在的目录下一个不存在的名字, 那么会生成一个这个名字的软链, 和源文件/文件夹链接.

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

❗️ 要注意`tar`命令无法解压 **.rar** 格式的压缩包, 也无法生成 **.rar** 格式. 需要另外安装
rar工具:

```shell
sudo apt install rar
```

另外在Linux下解压来自Windows的zip压缩包容易出[文件名乱码问题](#解压.zip压缩包中文文件名为乱码).

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

如果是.rar文件:

```shell
rar x [source.rar]
```

### 压缩文件

```shell
tar -czvf [target.tar.gz] [file1] [file2] [file3]
```

如果是要压缩成.rar文件 (不是别人要求的话不推荐):

```shell
rar a [compressede_package_name] [source_folder_name]
```

## 格式化U盘

虽然在 Ubuntu 下图形化界面里可以无脑格式化U盘, 但是有时候U盘出问题的时候需要在命令行蛮力格式化.
此处以U盘为 **/dev/sdb1** 为例.

首先确保U盘未挂载:

```shell
sudo umount /dev/sdb1
```

然后将之格式化为FAT32格式(Linux, Windows都可识别的格式):

```shell
sudo mkfs.vfat -F 32 /dev/sdb1
```

这样之后可以回图形界面设置U盘的名字或者重新格式化为其他格式之类.
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
export PATH=[path/to/append]:$PATH
```

:warning: 应注意export命令仅作用于当前终端.

:bulb: 在有些文档中会使用下面这样的方式来添加路径到PATH, 但我觉得这样不够稳妥. 因为用下面
这种方式的话如果这个变量原本不存在, 假如我们添加`/usr/bin/bash`到PATH, 那么当我们使用
`echo $PATH`来查看PATH变量的值会发现其值为 **:/usr/bin/bash**. 这是因为bash会将
**PATH=**后的视为一整个字符串, 而 **$PATH**是取PATH现在的值的意思. 个人认为`/usr/bin/bash:`
比`:/usr/bin/bash` OK一些:sweat_smile:

```shell
export PATH=$PATH:[path/to/append]
```

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

🔗 实际上在Linux系统中有非常多配置文件可以用来设置环境变量, 可以看看[Linux的环境变量怎么设](https://blog.lilydjwg.me/2020/7/22/linux-environment-variables.215496.html)

⚠️ 在有些系统中不是`/etc/bash.bashrc`, 而是`/etc/bashrc`

⚠️ `/etc/profile`仅针对Bourne系shell是指当shell为Bourne Shell, Bash, ksh
等的时候`/etc/profile`才可能被加载, 而当我唤起一个**zsh**时, **以上四个初始化文件都没有被加载**
:man_shrugging:

⚠️ 在用户目录可能还存在`~/.bash_profile`, `~/.bash_login`这两文件, 系统会
依次查找`~/.bash_profile`, `~/.bash_login` 和 `~/.profile`这三个配置文件, 读取和执行
这三个中的**第一个**存在且可读的文件中命令, 因此建议将三个合并为一个.

⚠️ 当**bashrc**一系和**profile**一系都会被加载时两者哪个会先被加载并不
一定, 有点玄学... 经我测试运行`bash -cl bash` **profile**一系会先被加载, 而运行
`bash -l`则**bashrc**一系会先被加载:man_facepalming: 但很明确的一点是:
系统级初始化文件一定会先与用户级文件被加载. 即便根据应当允许用户个性化设置这种尝试也能
推断出 (用户级初始化文件后于系统级初始化文件被加载, 所以用户级文件中的配置会覆盖系统级
文件的对应配置)

✔️ 有关四种shell模式个人感觉坑挺多的:

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

🌟 有了以上的知识储备我们就知道需要将环境变量添加到什么文件里了.

## 删除一个环境变量

### 临时删除

```shell
export -n [VARIABLE]
```

### 永久删除

参考永久添加的操作.

## 系统命令软链

⭐️⭐️⭐️ `update-alternatives`是一条十分实用的命令! 这是Debian一系系统 (比如Ubuntu)
中创建, 删除, 管理系统命令软链的工具. 在一个系统中同时存在同一软件的多个版本是很常见的事, 比如
python2和python3并存, gcc多个版本并存. 当在命令行输入`python`时到底该进入python2还是
python3呢? update-altenatives能够帮助我们.

### 创建/添加一个系统命令软链

```shell
update-alternatives --install [path/to/system_link] [command_name] [path/to/command_binary] [priority]
```

几个参数分别是: 系统命令的链接, 系统命令名, 要用系统命令调用的软件的二进制文件的链接, 优先级大小

以**python**这个命令举例:

```shell
update-alternatives --install /usr/bin/python python /home/leo/anaconda3/bin/python3 100
```

### 配置系统命令软链

```sehll
update-alternatives --config [command_name]
```

alternative软链系统会把优先级数值最大的一个软件二进制文件链接作为当前该系统命令链接到的二进制
文件地址, 因此比如要改变python版本只需调整优先级大小.

### 删除一个系统命令软链

```shell
update-alternatives --remove [path/to/system_link] [command_name] [path/to/command_binary] [priority]
```

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

chmod: change file mode bits

chown: change file owner and group

## 所有人可运行

```shell
chmod a+x
```

拥有者, 群组可读写, 运行, 其他用户可读, 执行

```shell
chmod 755
```

用一个三位八进制数来表示文件权限, 规定4, 2和1表示读、写、执行权限, 每一位都是这三个数相加
的结果, 三位分别表示u (user), g (group), o (others).

# 后台不挂起运行

通过在命令尾加上`&`可以让命令在后台运行. **后台运行**是指**当前进程不在前台占用
屏幕**. 后台运行的程序一样会把输出显示到终端, 通常通过在命令末尾加上`1>/dev/null
2>error.log` 将标准输出重定向至黑洞 (`/dev/null`是一个很特殊的设备, 写入它的内容
都会被丢弃, 而读取它会得到EOF), 输出标准错误输出到当前文件夹的`error.log`.

💡 `&`能让进程在后台运行, 但**一旦当前终端关闭这个进程就会被挂起**. 当进程被切换
到后台, 称为**job**

而`nohup [command]`能让进程不挂起地运行, 即退出当前终端进程仍然在运行. 但这条命
令会一直占据终端而且不再接受输入, 因此关闭这个终端会提示还有程序在运行, 强行关闭
的话这条命令就会被终止, 就更不用说不挂起运行了.

如果想不挂起后台运行要用下面这条. 这样关闭当前终端程序也会继续运行了😄

```shell
nohup [command] & 1>/dev/null 2>error.log
```

💡 丢弃标准输出并将标准错误输出重定向到当前文件夹的`error.log`是我的习惯, 当然你
可以重定向到别的地方.

# TCP/UDP工具

nc: netcat, 是一个读写TCP/UDP协议下数据的工具.

我感觉netcat能当作Windows下的TCP调试助手, 但也有远比TCP调试助手多的功能和用途,是
很强大的工具, 但得自己加选项来实现各种功能, 可能还需要和其他工具配合, 使用不是很
直观.

常用选项:

- -l listen, 监听
- -u 使用UDP协议而不是默认的TCP协议
- -v 显示详细信息
- -z 指定nc只扫描端口而不发送数据过去, 不能和-l选项一起用
- -w 一定时间内无法连接则timeout, 单位为秒

我目前遇到的几种用法:

## 监听某端口

```shell
nc -l localhost 8000
```

❗️ nc的manpage说在建立链接后就不要在意哪边是server哪边是client了.

## 发送一段16进制的ASCII码

在看网友们实现这个时我体会到了linux命令是多么强大, 以下收录几个例子

```shell
echo '0006303030304e43' | xxd -r -p | nc -l localhost 8000
```

```shell
echo -ne '\x00\x06\x30\x30\x30\x30\x4e\x43' | nc -l localhost 8000
```

```shell
echo -ne "$(echo '0006303030304e43' | sed -e 's/../\\x&/g')" | nc -l localhost 8000
```

## 以16进制显示接收到的信息

hd: hexdump
xxd: make a hexdump or do the reverse

hexdump和xxd都可以将数据转为16进制, 但体验后我觉得xxd更易记, 显示更直观.

xxd默认按单字节转换, 而hexdump默认按双字节小端转换, 差评.

### 按单字节以一定格式显示

```shell
nc localhost 8000 | xxd -c [cols]
```

选项-c指定一行显示列数, 如果显示的数据是定长的话设置为数据长度很舒服. xxd默认两
字节一组显示, 即两个字节间一个空格, 可以用`-g [bytes]`指定几个字节一组.

```shell
nc localhost 8000 | hexdump -C
```

选项-C指定按单字节以一定格式显示. 这个格式可以看hexdump的manpage下`-C`选项的描述

不过看manpage似乎hexdump支持的骚显示方式更多.

## 扫描端口

```shell
nc -v -n -z -w 1 localhost 1-1000
```

nc甚至可以通过重定向文件描述符来在端口使用终端 🐮🍺

在nc的manpage可以找到操作方式.

# 遇到过的问题

## Ubuntu开机紫屏

linux文件系统损坏导致的不正常开/关机, 此时一般等一等系统就会提示你进行文件系统修复.

```shell
fsck -a /dev/sda1
```

一般用这条命令修复. fsck (file system check) 是检测与修复文件系统的命令.`-a`选项会报告损坏
block并自动修复 (反正手动修复也只是确认是否修复).

具体参考[这里](https://blog.csdn.net/liujianlin01/article/details/82937708)

## Ubuntu烦人的开机报错

把这个报错关了就完事了😁

参考[Ubuntu开机弹出System porgram detected](https://www.cnblogs.com/greatfish/p/8042026.html)

## ibus的中文输入法无法选择除第一个的候选词bug

需要删除几个缓存的数据库文件

```shell
sudo rm -rf ~/.cache/ibus/libpinyin/
```

这个issue具体参考[这里](https://github.com/libpinyin/ibus-libpinyin/issues/127)

⭐️推荐直接换掉ibus转用**fcitx**. fcitx的中文输入法推荐**GooglePinyin**, 日语输入法推荐
**Mocz**. 通过以下命令可以安装.

```shell
# 安装谷歌拼音
sudo apt install fcitx-googlepinyin
# 安装Mocz日语输入法
sudo apt install fcitx-mozc
```

❗️值得一提的是fcitx的输入法分激活和非激活 (通常将英语设为非激活), 输入法切换快捷键也分两种,
一种在非激活输入法和激活输入法间切换, 一种在激活输入法间切换.

## 没有显卡驱动无法正常显示

有时候买了不靠谱的显卡可能你的发行版中没有, 或者你安装的时候没有安装对应的驱动, 因此开机后可能是
花屏或者黑屏. 解决方法是: 开机时在grub界面按 `e` 进入编辑模式将什么什么splash后的---改为 
`nomodeset`. 这样就会让内核不改变显示设置, 保证至少能看到东西. (但这模式很有可能显示出来辣
眼睛😅)

## 解压.zip压缩包中文文件名为乱码

当我在Ubuntu1804像往常解压`.tar.gz`文件那样用右键菜单的**extract here**解压`.zip`文件后
我发现中文文件名全部变成了乱码, 文件里面倒是没问题.

这是因为**zip压缩包并没有指明编码格式**, 解压工具会以Linux的默认编码格式**UTF-8**解压, 而在
系统语言为简体中文的Windows系统下默认**字符集**为`GBK`, **编码格式**为`EUC-CN`, 所以会
文件名乱码.

我目前的解决方法是命令行输入以下命令解压.

```shell
unzip -O cp936 [filename]
```

此处选项`-O`指以指定编码格式解压. **cp936**指[微软编写的代码页936页](https://en.wikipedia.org/wiki/Code_page_936_(Microsoft_Windows))的编码格式
(注意与[IBM的code page936](https://en.wikipedia.org/wiki/Code_page_936_(IBM))区别),
即字符集为GBK, 编码格式为EUC-CN. (经我实验UTF-8编码的文件名以cp936编码解压出来显示正常...
我也不知道为什么)

## Linux系统时间和Windows系统时间差8小时

这个问题蛮有意思的:

Linux系统将硬件时间 (BIOS中的时间) 作为系统的**UTC时间**, 而Windows系统将硬件时
间作为**本地时间**.也就是说如果现在我有一台在北京 (东八区) 的电脑, **BIOS时间**
为8:30 (24小时制), 那**Linux系统时间**为16:30, **Windows系统时间**为8:30.

因此Linux系统时间与Windows系统时间有时差是正常的 (可以通过设置让Windows系统将硬
件时间作为UTC时间). 但我的Linux和Windows系统都开启了网络校时功能, 理论上即便存在
上述问题也不应当表现出来, 而应是开机后自动校准了. 我面临的问题是Linux系统时间是
准确的,而Windows系统时间总是早了8小时, 这说明Windows系统的网络校时功能未生效.

后来我发现是有个叫**Windows Time**的服务 (网络校时功能在这个服务里) 的启动类型不
合理 (**服务**可以通过在开始搜索框搜索打开). 这个服务的缺省启动类型为`手动(触发
器启动)`, 也就是说需要通过我们手动在某处触发. (与另一种启动类型`手动`的区别是后
者只能在**服务**页面手动启动)举例来说, 每次我从Linux系统关机,重启打开Windows系统
后, Windows系统显示的时间是不准确的, 此处**Windows Time**服务因为未触发,处于未运
行状态, 而当我在设置的时间与地区里手动关闭 **"自动设置时间"** 再打开后, 我发现
**Windows Time**服务此时已经处于运行状态了.

🤦‍... 没准是微软的锅? 咱也不知道, 咱也不敢问.

当我将这个服务的启动类型设置为`自动(延迟启动)` (延迟启动指在所有系统服务启动后再
启动本服务) 后问题解决.

## fcitx无法用Super+Space切换输入法

这是因为这个组合键被系统的输入法切换快捷键占用了. 在系统设置里 **Devices ->
Keyboard -> Switch to next input source** 关掉这个快捷键就可以了.
