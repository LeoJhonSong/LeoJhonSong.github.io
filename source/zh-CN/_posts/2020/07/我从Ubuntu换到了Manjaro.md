---
title: 我从Ubuntu换到了Manjaro
date: 2020-07-26 10:26:37
updated: 2022-01-19 14:00:00
categories:
- [操作系统, Linux]
- [工具, 软件配置]
---

前几天闲来无事下了一个听说了很久的Manjaro (KDE版), 在Live CD体验了一会果断装了实体机. 体验比Ubuntu好太多了!

<!-- More -->

<!-- TODO -->

## Manjaro-KDE比起Ubuntu的优势

在实体机上使用快要有一个月了, 体验下来相比于Ubuntu, 以不是专业软件开发者, 而是机器人开发者的角度, Manjaro KDE最吸引我的三个关键词是: KDE, 不太激进的Arch系, MHWD. 当然两者还有些其他区别, 但我目前感触最深的就是这三个关键词.

### KDE的好处

Manjaro有好几个版本, Architect, Gnome, KDE Plasma, XFCE四个官方版本, i3等九个社区版本, 这几个版本都是给x64/x86平台用的, 主要区别是窗口管理器不同. 确切的说:
- Architect没有图形界面
- Gnome, KDE Plasma, XFCE是桌面环境, 有各自的窗口管理器 (比如Plasma的窗口管理器是KWin), 但他们提供的不只有窗口管理器, 这几个大社区各自开发了一套配套基础应用, 总的来说都很有用
- 9个社区版相当与Manjaro Architect+一个预装的窗口管理器, 据我观察没有提供什么配套的东西

而另外还有针对arm平台几款常见单板机的Manjaro, 每款都提供KDE Plasma和XFCE两个版本. Linux平台桌面环境有很多, 其中我认为最有价值的就是XFCE和KDE. XFCE以**轻量级, 稳定的同时足够友好**著称, 是在电脑性能不太好时的首选桌面. 而KDE Plasma以**现代, 高度可定制, 友好**著称. 至于Gnome... 自从体验过KDE后, 除了很多软件或多或少依赖Gnome这一点, 我找不出它比起XFCE或者KDE有什么优势...

值得一提的是, KDE的初衷只是开发一个桌面环境, **K**ool **D**esktop **E**nvironment, 但随着社区的发展, **KDE现在代表的是一个软件社区**, 而桌面环境被分离出来, 只作为其中的一个产品, KDE Plasma. 另外还有KDE Applications, KDE Framework. 这样以来许多KDE软件在Windows, OS X也能运行.

#### 能轻松高度个性化且稳定的Plasma桌面环境

在体验KDE前我用了许久Gnome, 还折腾了许多个性化, 把Grub界面, Plymouth界面, 登录界面, 窗口主题, gnome shell主题, 图标主题都以较为硬核, 需要输入一些网上看来的命令的方式换掉了. 但体验了KDE后觉得自己实在是愚蠢: 有那功夫折腾Gnome的个性化, 直接换到KDE在系统设置点几下鼠标进行个性化多好? 上面提到的几个除了GRUB界面系统设置没有提供设定入口, **统统在系统设置就可以下载, 更换主题**! KDE还提供了更多可以个性化的东西, 比如一堆桌面特效, 应用窗口切换动画, 一堆任务栏的挂件等等. 实在是现代, 友好, 高度可定制!

💡 值得一提的是在Manjaro KDE的系统设置的`Time and Date`一栏即可勾选**Hardware clock in local time zone**, 也就是说勾选上这个Manjaro就会将硬件时间作为当前时区时间!

当然, 功能如此丰富的Plasma桌面环境运行起来消耗的资源比XFCE多, 但仍比Gnome消耗的资源少, 是较新的电脑的首选桌面环境😆

#### 齐全而贴心的系统自带软件

KDE自带的软件的贴心程度震撼到我:
- 虽然Ubuntu也有类似**FileLight**的磁盘空间分析工具, 但是我总觉得有些bug, 体验不是很好, 而FileLight没有这些毛病, 甚至在扫描时是有动画的, 很贴心.
- KDE自带的图片查看器, pdf阅读器比Gnome自带的功能更加丰富, 但也不会杂乱.
- KDE的硬件信息查看软件, 类似任务管理器的软件比Gnome的更加直观, 信息更加丰富.
- Manjaro KDE这个软件商店 (叫Add/Remove Software, 我也不知道算不算是KDE的) 吊打Ubuntu应用商店. 我基本没有成功从UBuntu应用商店下下来过东西, 但Manjaro KDE这个软件商店体验很好, 可以图形化设置是否开启AUR, Snap, Flatpak的支持, 设置如何处理包的缓存文件等.

### KDE的缺点

KDE也不是没有缺点. KDE, Gnome均遵循GPL协议, Gnome采用的图形库GTK遵循GPL协议, 但**KDE采用的图形库Qt不遵循GPL协议**. 这导致Gnome获得的商业支持远多于KDE, 所以现在很多主流发行版的默认桌面环境是Gnome, 进一步导致很多软件或多或少依赖Gnome, 很多教程也是针对Gnome的.

~~比如deepin全系软件都对Gnome有一定依赖, 在Manjaro KDE直接安装AUR里打包好的tim是无法启动的, 需要[再安装一个依赖, 编辑一段代码](https://github.com/wszqkzqk/deepin-wine-ubuntu/issues/90#issuecomment-653921540).~~ **2022年更新:** *应该是从去年开始就基本没这问题了, 在Manjaro很久没遇到安装不是一行命令搞定的软件了. aur源里总会有一个热心网友解决好依赖问题的版本 😁 目前TIM我用的[com.qq.tim.spark](https://aur.archlinux.org/packages/com.qq.tim.spark/), 微信用的[com.qq.weixin.deepin](https://aur.archlinux.org/packages/com.qq.weixin.deepin/), 都是最新版, 体验也很流畅*

这些其实不算大问题, 都能在网上较为容易地找到解决方案, 但确实不能算新手难度.

### Manjaro与Arch Linux

#### Manjaro不是Arch Linux

要注意Manjaro虽然是Arch系, 但又与Arch Linux不完全兼容. AUR (Arch User Repository) 更多是面向Arch Linux用户的, 社区主导的第三方仓库, 里面都是社区用户**自行维护**的软件包 (足够热门足够好的话也会被Arch Linux官方收入官方维护的community仓库). 而Manjaro官方则只会对Arch Linux官方仓库的更新进行测试, 兼容性适配等后以一两周的延迟同步到Manjaro自己的官方仓库 (不过我感觉Manjaro是一批一批同步的, 因此不像Arch用户每天都可以更新一点什么, Manjaro是几天更新一批). 这意味着如果AUR上的软件维护者只在Arch Linux上进行测试的话, Manjaro用户可能发现自己从AUR上下下来的软件有问题. 不过Manjaro与Arch Linux绝大部分是兼容的, 就我这一年多的使用经验来看 (这段内容是2022年更新的), 主流的软件都没有兼容性问题, 冷门一些的软件小概率会碰到兼容性问题. 我仅有几次遇到的AUR软件问题基本都是因为Manjaro仓库与Arch Linux仓库之间的更新延迟, 导致软件的依赖或者依赖的依赖只更新了一部分, 因此依赖关系断了, 出现的问题. 这种问题我还没碰到过影响很重要软件的时候, 不急的话稍等几天就自然修复了, 急用的话回滚一下版本就好.

总的来说要记住**Manjaro不是Arch Linux** 😏 去Arch社区提问的话记得先说自己是Manjaro用户, 不然一群Arch老哥怎么也不能复现你遇到的问题才发现你其实是Manjaro用户的话会骂人的.

那为什么不直接用Arch Linux? 因为设计理念不一样. Arch Linux的用户是一群凡事更情愿自己啃文档自己动手丰衣足食的极客, 对于只是把Linux系统当一个工具的人来说Arch Linux使用起来太麻烦了. 正相反, Manjaro, 尤其是Manjaro-KDE提供了很多非常人性化的功能, 界面也非常现代等... 是非常阳间的操作系统 ❤️

#### 坐靠AUR的好处

虽然如前面提到, 在Manjaro系统使用AUR上的软件可能遇到兼容性的问题, 但AUR社区的软件之丰富, 版本之新, 使用之简便, 社区之活跃足够让我忽视那小概率弊端.

举个例子. 我有一台有N卡的电脑, 我现在需要运行一个开启了CUDA加速的基于OpenCV的图像识别C++程序. 如果支持用最新版本的CUDA和OpenCV运行, 那么运行`yay -S opencv-cuda`, 然后最新的CUDA, cuDNN, 开启了CUDA加速的OpenCV的C++, Python库就都装好了🎉 N卡驱动是装Manjaro系统时选安装闭源驱动然后Manjaro就会很省心配置好的, 当然装好后在系统设置也能一键装好闭源驱动. 非常省心. 即便是有版本要求, 比如需要CUDA10.1和OpenCV3.4, 那先`yay -S cuda-10.1 cudnn7-cuda10.1`, 然后OpenCV确实是需要手动下载源码编译的了, 不过至少可以参考`opencv-cuda`包的**PKGBUILD**的写法.

### Manjaro Hardware Detection (MHWD)

MHWD绝对是让Manjaro从众多Linux系统中脱颖而出的一个重要原因. 这个工具能自动检测你的硬件并安装驱动, 当然你也可以自己选. 他主要是解决了我N卡驱动装着麻烦的问题, 在系统安装的时候引导就会问你是否安装闭源驱动, 然后这个工具就会帮你安好闭源的N卡驱动.

## Manjaro是否对Linux新手友好

从Manjaro提供的众多贴心功能来说他对任何用户都是友好的, 比如如果安装Manjaro之前已有Windows系统的话安装好Manjaro后 Windows盘就自动被挂载了, 在资源管理器能看到侧边栏有个Windows图标, 可以说非常贴心了.

但另一方面, 滚动更新让Manjaro相比Ubuntu更容易出现问题, 虽然也更容易解决, 但是需要对Linux有一点了解. 但是我体验下来基本就这一个毛病, 学一学就不是大问题了 👍