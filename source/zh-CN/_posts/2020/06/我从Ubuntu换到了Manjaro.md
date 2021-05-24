---
title: 我从Ubuntu换到了Manjaro
date: 2020-07-26 10:26:37
updated: 2020-07-26 10:26:37
categories:
- [操作系统, Linux]
- [工具, 软件配置]
---

前几天闲来无事下了一个听说了很久的Manjaro (KDE版), 在Live CD体验了一会果断装了实体机. 体验比Ubuntu好太多了!

<!-- More -->

<!-- TODO -->

## Manjaro-KDE比起Ubuntu的优势

在实体机上使用快要有一个月了, 体验下来相比于Ubuntu, 从不是专业软件开发者, 而是机器人开发者的角度, Manjaro KDE最吸引我的三个关键词是: KDE, 不太激进的Arch系, MHWD. 当然两者还有些其他区别, 但我目前感触最深的就是这三个关键词.

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

比如deepin全系软件都对Gnome有一定依赖, 在Manjaro KDE直接安装AUR里打包好的tim是无法启动的, 需要[再安装一个依赖, 编辑一段代码](https://github.com/wszqkzqk/deepin-wine-ubuntu/issues/90#issuecomment-653921540).

这些其实不算大问题, 都能在网上较为容易地找到解决方案, 但确实不是新手难度.

### 坐靠AUR的好处

要注意Manjaro虽然是Arch系, 但又与Arch Linux不完全相通.

cuda, cudnn被升到11.0, 8.0, 与libtorch不兼容. 但是降级很容易

TODO

### Manjaro Hardware Detection (MHWD)

## Manjaro是否对Linux新手友好