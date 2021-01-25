---
title: 为什么我用Linux而不是Windows
date: 2019-05-17 14:48:06
updated: 2019-09-13 17:12:17
categories:
- [操作系统, Linux]
---

# 更新

又过了一段时间, 我觉得对于这个问题我已经不在需要去想那么多理由来说服自己了. 在习
惯了在Linux开发后我再在Windows试着做点小东西便发现这一切比起在Linux下来得束手束
脚得多. 没有强大而美观的终端, 无法只通过编辑配置文件就轻松对软件进行配置, 无法一
个命令改变文件权限, 系统语言为中文时的默认编码格式为cp936有时候也会给开发带来麻
烦... 更别说windows没有强大的包管理工具...总之**一切Windows防止普通用户误操作的措
施让开发者变得十分拘束**.

**WSL也不顶用**. 我也一度十分推崇WSL, 但体验了一天不到我就果断删除了. **我连自己
环境都没配出来!** 目前的WSL还bug很多, 比如我的终端字体根本不能正确显示 (这很重要
好吧), 比如在Windows系统和WSL同时对一个文件进行了操作似乎会造成文件权限问题, 再
比如我在Ubuntu1804的WSL中执行`sudo apt install pip`结果报错了... (这个问题并不只
有我一个人遇到)

<!-- More -->

# 前言

虽然上大学前我是完全没听说过Linux的 (不是Linux不nb是我太菜), 但进大学后身边人人都说他好, 我也
就早早地开始接触它. 从最开始在Win10上在虚拟机里装了Ubuntu16.04摸了几把, 到发现双系统爆炸好装
就顺手装上了Ubuntu18.04体验, 到现在思考为什么我要用Linux, 思考要不要试试Ubuntu之外的Linux
系统, 感觉自己对Linux还是有了一定的了解.

在我刚装了双系统时就有同学问我Linux到底咋好, 我当时也没太体会出, 就一气胡说, 什么"没有毒瘤360"
啊, "不像Windows下乱七八糟的软件有各种开机加载项, 我这快坏掉的电脑运行Linux系统开机快"啊 (当
时我的硬盘刚出现[要爆炸的迹象](https://leojhonsong.github.io/zh-CN/%E6%88%91%E6%89%93%E7%AE%97%E6%8D%A2%E7%94%B5%E8%84%91%E4%BA%86/)),
总之我当时也说不上Linux哪里好到值得我不用Windows和它的Office套装.

# 相关链接

因此当最近我再次想起这个问题时我进行了一番搜索:

- 首先我搜了Linux和Windows的比较, 发现其实问题并不是"Linux比Windows好在哪"而是"Linux和
Windows哪个好?"

🔗[知乎话题-微软的 Web 服务器为何能屹立不倒？](https://www.zhihu.com/question/24439007/answer/27872778?utm_source=qq&utm_medium=social&utm_oi=575568675688419328)

🔗[LINUX vs WINDOWS](https://www.michaelhorowitz.com/Linux.vs.Windows.php)

- 然后我想到了解Linux和Windows的起源来发现他们设计理念, 运行方式的差异.

🔗[操作系统Unix、Windows、Mac OS、Linux的故事](https://www.bbsmax.com/A/mo5kVo2JwR/)

🔗[一段关于 Unix 与 Linux 的暗黑史](https://linux.cn/article-3789-1.html)

我顺便搜了一下Linux在电影行业的应用

🔗[Linux与电影制作](https://blog.csdn.net/neo_liukun/article/details/6787507)

- 还有些杂乱的

🔗[浏览黑暗网络的操作系统：Windows，Mac还是Linux？](https://www.jianshu.com/p/71158a9c8d03)

🔗[Comparison of operating systems](https://en.wikipedia.org/wiki/Comparison_of_operating_systems)

🔗[What tools and technologies are used to build the Stack Exchange Network?](https://meta.stackexchange.com/questions/10369/which-tools-and-technologies-are-used-to-build-the-stack-exchange-network)

🔗[Some Windows Server 2016 vs. Linux Network Benchmarks](https://www.phoronix.com/scan.php?page=news_item&px=Netperf-Windows-Linux)

🔗[京东用 .NET 架构的原因是什么？](https://www.zhihu.com/question/19818863)

🔗[如何评价微软的 UI 设计？](https://www.zhihu.com/question/50117613/answer/119798303)

# 信息整理

我们可以发现虽然Linux是在服务器领域发家的, 但现在Windows也在服务器领域占领了不小的份额. 并且
在某些领域比起Linux反而Windows更受青睐. 很有意思的是在银行业Unix因为稳定性被使用, 而Windows
因为能提供因为Windows系统的原因出现的损失提供补偿而被使用, Linux看起来在银行业倒是没几家使用的
样子.

实际上Linux和Windows在各方面的性能上并无什么差异, 让人们决定到底选择Linux还是Windows的因素
我觉得可以**主要**可以分**服务器领域**和**个人电脑领域**两个方面来讨论.

## 服务器领域

服务器都是公司在使用, 而公司是一定要赚钱的 (就算是非营利组织也是要靠钱来维持的), 因此很多决定因素
都和💰有关.

因为是公司用的服务器, 因此很容易受到攻击, 另外因为很可能保存有公司重要资料因此要有公司内部人员来
管理, 开发. 然后我们就看到: **中小型IT企业普遍选择Windows, 而大型IT企业更倾向于选择Linux.**

❗️

- 此处仅讨论IT领域, 因为其他领域我没了解到那么多, 并且讨论价值没那么大, 比如文学界的数据库服务器
我不认为会使用Linux系统
- 此处的中小型公司指有一定技术水准的程序员的数量较少, 反之大型公司指技术实力雄厚的, 比如BAT

中小型IT企业更青睐Windows是因为:

1. Window**s学习成本相对低**, 甚至微软能提供良好的技术支持.
2. 使用Linux看似省下了Windows激活码的钱, 但却需要大量资金来养一批有实力的技术人员在公司里才能
   达到或者超过使用来自微软的服务的体验 (紧急情况处理, 技术支持, 损失赔偿等), 对人手不够的公司
   来说Windows是个很好的选择. 就比如 Stack Exchange这公司, 还是很nb吧, 但人家的服务器一直
   在Windows平台使用微软的方案, 因为这公司一共就一百多人, 还分散在世界各地. 他们很明显没有足
   够的人手去搞骚东西, 而微软的服务很好地解决了他们的烦恼: 俺们就是想**省心**.
3. 有许多银行也会使用Windows, 因为**微软能为损失背锅**. 另外不算各巨头公司的魔改的话Windows
   系统的**安全性很高**, 毕竟他的源码是闭源的, 更不容易被人发现0day漏洞, 而微软的事故响应也很
   快, 比开源社区修bug不知快到哪去了. 经常有人认为Linux系统公布了源码, 那各位大牛肯定早把
   它修补得差不多了, 但事实并非如此, Linux也有许多漏洞, SUSE就曾爆出过重大漏洞. 而与Linux
   有血缘的Unix则是因为在贝尔实验室已经经历了十数年的打熬, 才能做到如今的稳定性.

而大型公司则是相反, 因为技术雄厚因此更愿意用Linux这样的开源系统, 甚至基于Linux魔改. 比如Google
就糊了*Goobuntu*, *gLinux*内部使用. 这些公司有钱有人, 那当然是选择高度定制化, 自己能完全把控
的系统. 而没人会去魔改Windows拿来用, 那太骚了.

## 个人电脑领域

以下的观点就主观一些了, 毕竟本文标题是 "我为什么用Linux" 😁

其实在PC端Windows各方面都有着很不俗的表现, 抛开游戏方面不谈 (这方面当然是Windows更合适, 但我是不打游戏的).

比如**办公方面**吊打Linux: Word, PPT, Excel, OneNote为首的Office套件实在好
用, 虽然这些软件在Linux上可以访问网页版, 但经我测试有许多有用功能网页版并不具备. (OneDrive现
在能在Linux很好的使用了倒是一大喜事) 无论WPS还是LibreOffice都存在很严重的图文串位问题. 至于
Latex在Linux平台体验并没有和Windows平台有什么区别.

再比如**驱动方面**, Windows确实比Linux做得好不少, 驱动比Linux全很多 (就比如很多电脑刚装了
Linux会有显卡, 网卡, 蓝牙等各种各样驱动问题而且解决起来没有在Windows那么容易). 甚至很多做硬件
相关的企业都用Windows. 很多设备只做了Windows平台的驱动, 但我是没听说过只做了Linux平台驱动的
设备.

而在**美观程度**方面个人认为只要想做, Linux桌面可以做到高度个性化, 因此可以很美观, 不像在
Windows即便你觉得什么东西丑爆了你也只能按照Windows的规矩来个性化. 即便自己配置觉得麻烦也可以
直接偷别人的配置. 比如我打算以后按[这个样子](https://www.zhihu.com/question/26031045/answer/356288402)
折腾一番, 实在炫酷.

但要说到**开发方面**我认为Linux是比Windows好的选择. 无赖一点的解释: 既然以后在IT界很有可能
需要用Linux, Linux学习成本又不低, 那何不早些接触Linux? 在微软实习的学长说他觉得那里的人人均会
Linux. 曾经看到说我们身周的设备90%以上用的系统都是Linux (虽然我觉得有点过了但反正极多, 而
Windows IoT才起步). 在和目标平台相同的平台上开发能提高发现问题的可能性. 另外Linux上没有
Windows上那么多针对普通用户设置的开关, 不会还需要自己开启IIS之类. 而且Linux不使用 `\\` 作为
文件夹名称分割符, 感觉没那么容易混乱. 再有Windows自带的Windows Defender过于烦人, 默认设置
甚至会实时扫描所有进程, 占用很多内存. 然后Linux文件以`LF`为换行符, 而Windows以`CLRF`为换行
符, 因此到了Linux强迫症表示Git提交时再也看不到将文件从CRLF转到LF的提示了😁. Linux的好处太多
啦, 还有环境好配, 命令行比图形界面更能让人提高效率等...

而还有一点超脱以上所有并且十分重要的原因: **生态**.

如果你要使用的工具, 祖传代码, 社区已有的成果, 公司生态等逼着你用Linux, 你又能有什么办法.

---

我又发现了Windows可以diss的地方: 编码方式.

实例参见[这里](https://leojhonsong.github.io/zh-CN/Linux%E6%9D%82%E8%AE%B0/#%E8%A7%A3%E5%8E%8B%20-zip%20%E5%8E%8B%E7%BC%A9%E5%8C%85%E4%B8%AD%E6%96%87%E6%96%87%E4%BB%B6%E5%90%8D%E4%B8%BA%E4%B9%B1%E7%A0%81). 这里有详细的吐槽 🔗[知乎-Windows记事本的ANSI, Unicode, UTF-8这三种编码模式有什么区别？-梁海的回答](https://www.zhihu.com/question/20650946/answer/15745831)