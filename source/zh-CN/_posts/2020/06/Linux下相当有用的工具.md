---
title: Linux下各用途我最认可的工具推荐
date: 2020-07-26 10:26:37
updated: 2021-03-31 12:53:00
categories:
- [操作系统, Linux]
- [工具]
---

用Linux的时间已经比用Windows的时间还长了, 随着使用逐渐找到了各用途我最认可的工具, 或从软件源安装, 或在线使用. 在此整理一份我的Linux下各用途好用工具推荐. (出于私心将从一个Manjaro用户角度介绍)

<!-- More -->

<!-- TODO -->

> 首先, 不得不吹一下Manjaro是一个多么贴心的系统. Manjaro自带了一个叫**Manjaro Hello**的入门程序, 点进这个程序的`Applications`入口能看到Manjaro为各常见用途已经提供了一些推荐, 勾选就可以安装. (其中Office套件下的MS Office Online是Manjaro专门为微软Office Online写的本地客户端) 可以说没有更贴心的系统了!
>
> ![](Linux下相当有用的工具/Manjaro_Hello.png?70)

## 日常使用

### 中文输入法

随着fcitx5日渐成熟, 现在有了两种我推荐的中文输入法方案:

#### fcitx5框架+配套中文输入法

```shell
yay -S fcitx5-im
yay -S fcitx5-chinese-addons
yay -S fcitx5-material-color
```

这个**fcitx5-material-color**是一个模仿win10的中文输入法的皮肤, 在fcitx5的设置中可以更换皮肤, 可以做到下面这样的效果 👇
![](Linux下相当有用的工具/inputMethod.gif?80)

#### fcitx4框架+搜狗输入法

```shell
yay -S fcitx-im fcitx-configtool
yay -S fcitx-sogoupinyin
```

---

安装完输入法框架和中文输入法后还需要在配置文件中设置几个环境变量. 有很多配置文件会在用户登录过程中被加载, 我是在`~/.pam_environment`中写了这样几行:

```shell
GTK_IM_MODULE DEFAULT=fcitx
QT_IM_MODULE DEFAULT=fcitx
XMODIFIERS DEFAULT=@im=fcitx
```

我目前使用的是fcitx5的方案. 我一个同学体验后觉得搜狗的词库做得更好, 能提供更精确的联想. 这点我倒是没什么感觉, 完全满足我的使用. 但另一方面fcitx5配套的中文输入法的优势非常明显:

- 有一个Quick Phrase功能, 支持类似snippets一样根据关键词插入设定好的内容的功能. 默认提供了一些颜文字, emoji, LeTaX片段, 也可以自己加
- 整个方案成体系, 使用体验非常好! fcitx4+搜狗输入法这个方案始终是缝合怪, 很容易有点小问题. 比如我之前用的时候每次从英文输入法切换回搜狗输入法, 我对搜狗输入法的一些设置 (比如使用半角标点符号) 都会恢复默认值
- 支持导入搜狗细胞词库, 可以导入许多专业词汇的词库
- 支持云拼音
- 配置起来很简单直观

**总的来说我是推荐试试fcitx5框架+配套中文输入法这个方案的**

### 截图

很遗憾我没有找到一个像snipaste那样功能非常齐全的Linux平台截图/贴图软件. 我下了两个软件, 结合着用:

```shell
yay -S flameshot
yay -S deepin-screenshot
```

|                   | 优点                                                     | 缺点                                                         |
| ----------------- | -------------------------------------------------------- | ------------------------------------------------------------ |
| Flameshot         | 支持像snipaste一样将截图贴在屏幕最上层                   | 1. 在KDE上无法设置截图质量, 只能是原画质, 2. 无法自动贴靠屏幕上的窗口 |
| Deepin Screenshot | 1. 能将截图区域自动贴靠屏幕上的窗口, 2. 可以调节截图质量 | 因为[一些原因](https://github.com/linuxdeepin/deepin-screenshot/issues/8)KDE版无法将截图存到剪贴板 |

### 录屏

```shell
yay -S simplescreenrecorder
yay -S peek
```

SimpleScreenRecorder名字里虽然有simple, 但是实际上关于录屏的功能非常全, 有好几屏的设置项, 可以设置帧率, 视频源可以来自屏幕, 摄像头, 也可以设置音频源, 支持录制成`mkv`, `mp4`, `gif`, `mp3`等多种各种格式, 视频编码参数, etc... 可以说功能非常全面了.

而如果只是想随手录一个gif, 那使用**peek**是很好的.

### 显示按键

```shell
yay -S screenkey
```

这个可以在屏幕上显示按下了的键盘按键, 鼠标按键. 在演示, 示教时很好用 👍

## 驱动

### 显卡驱动

这里又不得不点名表扬一下Manjaro, 在装机时勾选了安装**Proprietary Driver** (非自由驱动)的话会自动装好N卡驱动! 比如我的笔记本有一个UHD Graphics (集显) 和一个RTX2070 (独显), 安装好系统后已经自动安装了采用最新的intel集显与Nvidia独显共存的[Prime方案](https://wiki.archlinux.org/index.php/PRIME)的混合驱动**video-hybrid-intel-nvidia-prime** 🎉

我也没有细看Prime方案和Bumblebee方案的具体差异, 看起来大概意思就是BUmblebee是软件实现, 有一定性能损失, 而Prime方案是更为推荐的新一代方案.

Prime技术让我们能够同时使用两个显卡: 以intel核显渲染画面, 以独显运行高负荷任务. 但是目前无论Prime方案还是Bumblebee方案都有个缺陷: 同时使用两个显卡时N卡无法输出画面, 即从直连N卡的HDMI接口无法输出画面, 但仅使用N卡的话可以从N卡输出画面. 仅使用N卡从性能方面没什么问题, 但是耗电, 发热会很夸张, 这对日常使用来说很不划算. 因此我们还是需要一个方法让我们能在需要N卡输出画面时能切换到仅N卡模式.

> 至于外接屏幕, 我的解决办法是买一个有雷电接口 (雷电接口是直连CPU的, 其视频输出由intel核显承担) 的电脑, 这样一来在混合模式也能从雷电接口输出视频信号 😅

```shell
yay -S optimus-manager-qt
```

💡 optimus-manager的文档说Manjaro KDE用户[需要编辑一个文件](https://github.com/Askannz/optimus-manager#important--manjaro-kde-users), 但我没动似乎使用起来也没什么问题

[optimus-manager](https://github.com/Askannz/optimus-manager)允许我们在**仅intel显卡模式**, **仅N卡模式**, **混合模式**三种模式间切换. 而optimus-manager-qt则为我们提供了一个GUI界面来进行设置, 一个系统托盘小图标来进行快速切换 (和装饰)

除了显卡模式切换这个主要功能, optimus-manager也能用来进行独显的电源管理, 根据自己的情况选择适合的方案. 因为我的笔记本满足 "N卡为Turing架构及以上, intel CPU为CoffeeLake架构及以上" 的条件, 因此用N卡自带的动态电源管理, Runtime D3 Power Management, 省心又省电 👍 不用时我的N卡功耗可以低到**4W**, 整个电脑的功耗最低到过9W (虽然还是被长续航轻薄本吊打)

- xrandr
- balenaEtcher
- powertop
- filelight
- kde partition
- ventoy

## 系统工具

### 资源管理器

**Dolphin**绝对是最好用的资源管理器! 多标签页, 显示预览等功能不在话下. Dolphin的右键菜单很贴心, Gnome自带资源管理器所没有的右键新建文件功能 (就离谱) 当然是有的, 也有创建快捷方式, 解压 (不论是rar还是zip还是tar都是同一个按键), 也可以很方便地自己创建脚本添加右键菜单的功能.

而Dolphin最突出的功能是按<kbd>F4</kbd>可以直接打开一个**Dolphin内嵌终端**. 这个终端的路径会随着在资源管理器里点击自动切换 (除非已经打开类似vim这样的程序), 使用起来超方便, 结合了终端的便捷和GUI的可视化等优势.

![](Linux下相当有用的工具/Dolphin.png?70)

### 任务管理器

**htop**是升级版的top. 一是交互人性化很多, 支持鼠标交互, 设置页面分了页, 直观很多. 二是能以列表或者树的样式显示丰富得多的值, 比如该进程的线程数等, 还支持以关键词过滤显示的进程等功能.

### "电脑管家"

```shell
yay -S stacer
```

虽然很多Linux老哥们认为Linux用户不需要这种东西, 但如果是习惯了在各种电脑管家打卡的Windows用户, 我推荐**Stacer**. 这是一个系统优化与监控软件 (和CCleaner等电脑管家画风很像), 可以看系统资源使用该要, 有任务管理器一栏, 可以清理垃圾, 可以管理开机自启项, 卸载已安装软件等... (是个很Windows画风的东西😅)

TODO: nmap+ncat

## 通讯

### QQ/微信

这两个软件在国内基本是必备了吧 :man_shrugging:. 在Linux上我体验下来最推荐的版本是以deepin-wine为容器, 星火应用商店打包版:

```shell
yay -S wqy-microhei  # 需要装一个文泉驿版微软雅黑来让deepin-wine系软件正常显示中文文字 (不然会显示为方框)
yay -S com.qq.tim.spark  # 比起QQ我更喜欢简洁的TIM (夹带私货)
yay -S com.qq.weixin.spark
```

如果使用的是高清屏, deepin-wine系软件显示得很小, 可以在**deepin-wine5`中**行设置屏幕分辨率. 比如设置**com.qq.tim.spark**的分辨率:

```shell
env WINEPREFIX=$HOME/.deepinwine/Spark-TIM deepin-wine5 winecfg
```

然后会打开一个设置界面. 调节其中的`Graphics > Screen resolution`. 我是4k屏幕, 感觉设成**192dpi**比较OK

### 会议

```shell
yay -S zoom-system-qt
yay -S teams
yay -S com.tencent.meeting.deepin
```

我在Linux目前体验能用的视频会议软件有三个:

- **zoom**: AUR里还有一个就叫**zoom**的版本, 但是看起来没有适配显示的全局缩放 (高分屏笔记本肯定是要设置个缩放的), 会变得很大一个. 随着国内疫情几乎目前大陆帐号已经无法发起zoom会议了, 但是用教育邮箱登录的话是可以发起会议的 👍 
- **Microsoft Teams**: teams不是专门的视频会议软件, 是微软Office中的办公聊天软件, 不过它的视频会议版块功能丝毫不比zoom少, 甚至得益于Office套件间的联动使用体验非常流畅, 有很多类似到时间提醒参会成员, 自动生成会议云录制的字幕等很贴心的功能. 其界面非常现代, 功能也很多 (有很多插件). 其实这个也支持在网页参加会议, 体验很好的.
- **腾讯会议**: 前两个的问题是会议用的服务器似乎都在国外, 网络质量不是很有保障. 腾讯会议的速度是很有保障的, 可惜是deepin-wine版, 功能不全.

其中zoom和teams是有官方全平台安装包的. zoom甚至提供很多个Linux发行版的安装包, 因此这两个软件的各种功能和Windows/Mac版没有任何区别, 支持共享屏幕, 远程控制, 会议录制 (本地/云), 摄像头, 音频等功能都没有问题. 而腾讯会议则是deepin-wine版, 一开启摄像头程序就会崩溃 (可以通过放一个播放摄像头画面的vlc小窗口在屏幕上的方式来解决), 观看别人共享屏幕时有时候会出现画面闪烁问题, 总之只是勉强能用的程度. 另外, 用海外手机号注册的腾讯会议用户无法通过链接下载云录制的视频.

总结下来就是: 如果有翻墙条件, 参会成员都能接受, 那teams是最好选择 ✔

## 下载/云盘

- 百度云 (官方)
## 图片/视频处理

### 视频压缩

```shell
yay -S handbrake
```

handbrake是一个支持非常丰富的视频格式转换/压缩工具. 视频编辑方面接触不多的人会意识不到一个录屏只需放进压缩软件简单**无损压缩**一下通常可以减小为原本体积的**一半以下**.而handbrake提供了许多直观的预设参数组. 我通常就用的`Offical>General>Very Fast 1080p30`这个预设. handbrake支持批量处理, 操作起来也很简单.

### 图片压缩

```shell
yay -S jpegoptim
yay -S optipng
yay -S imagemagick
```

**jpegoptim**, **optipng**这两个终端程序可以分别对jpg/jpeg, png进行无损压缩, 调用也很简单, 普通无损压缩的话跟的参数就图片名就可以.

**imagemagick**是一套用于创建, 编辑, 显示图片的强大终端工具, 其中有一个**magick**终端程序可以实现jpg转png, 也可以压缩jpg, png等. 但是参数比上面两个复杂一些, 我反正记不住.

💡没有用到透明图层的png图片可以转为jpg, 能大幅压缩体积

### 视频播放器

```shell
yay -S vlc
```

**vlc是一个很神奇的播放器**.

它不光支持非常多种视频文件格式, 还可以播放网络视频流, 比如RTSP视频流, IPTV网络电视, 还可以播放摄像头视频流... 加上它有截取视频一帧画面, 录制视频流, 高倍速播放, 在截取的画面上显示当前视频时间等功能, 他可以:

- 当Linux上的相机软件
- 用来调试usb摄像头/IP摄像头
- 当网络电视 (顺便放一个非常全的[IPTV频道合集](https://github.com/iptv-org/iptv))
- 看网课视频利器

🐮🍺

### 视频编辑器

```shell
yay -S kdenlive
```

**Kdenlive**是一个界面很像Adobe Premiere的软件, 现在是KDE旗下项目. Kdenlive的语言看起来是继承的系统语言, 支持中文 (汉化得还是比较全面的). Kdenlive操作起来还是很简单的, 零基础随便看一看教程也就会用个大概了. Kdenlive的特效我感觉和Pr差不多多, 我觉得定位和Pr应该是一样也是视频剪辑软件 (Linux平台也有对标Ae的软件, Natron).Kdenlive也有Windows版, 而且安装包只有80MB, 很值得尝试的 👍

### 制图

#### 图片

因为我处理图片的需求不大, 因此我有稍微复杂一点的PS需求时都是使用的这个[在线PS](https://www.uupoop.com/#/old), 支持PhotoShop的**PSD**, sketch的**sketch**格式, GIMP的**XCF**格式等, 覆盖了常见格式, 十分方便 😆

#### UML图

- [**diagrams.net**](https://www.diagrams.net/): 这个是全平台的, 有在线版, 也有各系统的安装包. 它有非常丰富的元素, 能画出很好看很复杂的图, 但是无法自动整理布局
- Graphviz: 这是一个根据"代码"自动生成图形的程序, 有[在线版](https://dreampuf.github.io/GraphvizOnline/), 也有[VSCode插件版本](https://marketplace.visualstudio.com/items?itemName=joaompinto.vscode-graphviz)什么的. (顺便[这里](/zh-CN/2020/03/12/Graphviz简要语法/)是我写的介绍Graphviz语法的博客)
- [ASCIIFlow Infinity](http://asciiflow.com/): 这个在线绘图工具是用来绘制**纯文本**框图. 不过因为它开源了, 因此也可以在本地使用 `yay -S asciiflow2-git`

#### 其他

- [Text to ASCII Art Generator (TAAG)](http://patorjk.com/software/taag/): 是一个生成文本的ASCII Art的在线工具 (就是oh-my-zsh更新时会显示的那种文本拼出来的大logo)

## 办公

### 文档

- typora
- okular (与gnome的evience)
- Chrome
- PDFMod

### latex

- overleaf
- vsc/vim + tex + okular

### Office套件

- libreoffice
- 在线Office365
- onedrive Linux版
- ao

- 邮件 在线outlook

## 工程

- 串口调试助手 cutecom

- Ventoy
- Gparted

### 终端

- zsh
- tmux
- fzf
- lsd

### 服务器

- sshfs
