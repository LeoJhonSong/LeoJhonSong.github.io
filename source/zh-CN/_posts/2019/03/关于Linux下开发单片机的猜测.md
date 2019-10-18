---
title: 关于Linux下开发单片机的猜测
date: 2019-03-28 10:30:54
categories:
- [Linux]
- [嵌入式]
- [配置]
---

现在也算个Linux爱好者啦, 但在Linux下怎么配置单片机开发环境我一直一头雾水, 直到最近我找到了相关文章!

<!-- More -->

💡 目前已经有
[PlatformIO](http://docs.platformio.org/en/stable/what-is-platformio.html)可以让
我们进行大部分单片机, 嵌入式系统的开发, 但也有部分开发板他们还没有收录, 除了向项
目提issue, 我们也可以尝试不用PlatformIO配置一套Linux下单片机开发环境.

网上虽然也有那么些讲在Linux开发单片机的文章, 但我看到的基本是开发C51, 顶多是有开发STM32的.
我是觉得没人会费事在 Linux 下开发C51, 反正我想开发的比如
[英飞凌 (infineon) 的 XC2267M](https://www.infineon.com/cms/en/product/microcontroller/16-bit-c166-microcontroller/xc2200-family-body/xc22xxm-series/sak-xc2267m-104f80lr-ab/),
[飞思卡尔 (Freescale) 的 k60](https://www.nxp.com/products/processors-and-microcontrollers/arm-based-processors-and-mcus/kinetis-cortex-m-mcus/k-seriesperformancem4/k6x-ethernet/kinetis-k60-100-mhz-mixed-signal-integration-microcontrollers-based-on-arm-cortex-m4-core:K60_100)
之类是没看到相关文章🤷‍

🌟🌟🌟 最近我看到了两篇配置英飞凌XMC系列单片机开发环境的文章!
[xmc4500-relax-linux](https://github.com/notandy/xmc4500-relax-linux)讲述了在
Linux开发xmc4500需要什么工具以及编译方式,
[Linux-XMC-Development](https://github.com/furtnerthomas/Linux-XMC-Development)
则**十分详细**地讲述了如何配置基于**eclipse**的XMC系列单片机开发环境.

🔗 参考:

- [在Linux下搭建51单片机的开发烧写环境](https://blog.csdn.net/thinkerleo1997/article/details/53145972)
- [ubuntu下安装stm32开发环境 秒杀keil和IAR](https://www.amobbs.com/thread-5568167-1-1.html)
- [Linux下STM32开发环境的搭建](https://www.cnblogs.com/amanlikethis/p/3803736.html#lab35)

参考以上几篇文章我明白了单片机开发都是以下流程, 那我猜只要找到对应工具就OK了:

1. 交叉编译生成 bin 或者 hex 文件
2. 烧录到单片机
3. 调试

也就是说我们找到对应的交叉编译器, 烧录工具, 调试工具就可以了.

而什么是对应工具, 要在哪里找到对应工具这个问题又让我苦恼了一阵子, 但后来我发现特么就在每个单片机的
页面上! (也可能是在该单片机的系列介绍页面)

比如 Infineon XC2267M 的交叉编译工具, 调试工具, 烧录工具都在
[这里](https://www.infineon.com/cms/en/product/microcontroller/16-bit-c166-microcontroller/xc2200-family-body/xc22xxm-series/#!tools)
列了出来! 当然有些工具是收费的, 但[这都不是事](http://www.infineonic.org/module/forum/thread-554295-1-1.html)😁. 不过似乎这个免费版[有点点局限](http://www.infineonic.org/module/forum/thread-487158-1-1.html)

另一款我提到的k60芯片也在介绍页面给出了相关工具的链接.

不过看起来很多工具都是基于Eclipse的. (但我觉得Eclipse的图标不好看所以就用过一次)

🔗 更多相关链接

- [单片机的下载方式分类](https://blog.csdn.net/passerbyyuan/article/details/51404226)
- [程序编译生成的Hex、Bin、axf和elf格式](https://blog.csdn.net/qlexcel/article/details/84374768)
- [单片机ISP、IAP和ICP几种烧录方式的区别](http://www.21ic.com/jichuzhishi/mcu/write/2014-03-20/216132.html)