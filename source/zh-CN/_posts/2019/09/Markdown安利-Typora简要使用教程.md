---
title: Markdown安利&Typora简要使用教程
date: 2019-09-23 14:45:31
updated: 2020-03-17 00:14:59
categories:
- [语言, Markdown]
- [杂记]
- [工具]
---

在此我来安利一下**Markdown**和**Typora**.

<!-- More -->

## Markdown安利

### 什么是Markdown

Markdown是一门语言, 一门轻量级的**标记语言** (Markup Language). 有没有觉得这个词
很眼熟? 是的, HTML全称**HyperText Markup Language**. Markdown和HTML同属于Markup
Language(Markdown是一门Markup Language是Markdown作者的恶趣味), 它们与C, Python等
编程语言并不是一类东西. **Markup**这个词源自**印刷业**, 指的是在电子排版技术出现
之前人们对印刷物内容的排版进行标记的方式. 比如一段文字应当是**粗体**, *斜体*,
<u>有下划线</u>还是~~有删除线~~, 使用什么字体, 字体大小, 左页边距应当是多少, 一
张图片该放在哪里, 多大等等...

💡 也就是说以前的人们在将原稿最终印刷出来前想知道会印成什么样基本靠脑补, 而现在
我们称这个由标记语言文件得到最终效果的过程为**渲染** (render).

而之所以我们说Markdown是一门**轻量级**的标记语言是因为在Markdown的语法比HTML等标
记语言要简洁太多😆

- 一
- 二

比如👆 上面这个列表的Markdown实现代码为

```Markdown
- 一
- 二
```

而HTML实现代码为

```html
<ul>
    <li>一</li>
    <li>二</li>
</ul>
```

但Markdown有时候也会让人觉得太过轻量级以至于缺少一些语法, 比如这个<u>下划线</u>
其实是用HTML标签实现的. 好在你也可以在Markdown文件中写HTML, 如今的Markdown渲染工
具基本都支持这个功能.

也是由于上面这个原因, 在Markdown作者们推出的
[**CommonMark**](https://commonmark.org/)的基础上有了添加了更多语法的各种
Markdown超集, 比如GitHub发布的[**GitHub Flavored
Markdown**](https://github.github.com/gfm/).

### Markdown应用广泛吗

实际上如今Markdown的使用相当广泛, 只要是支持所谓**富文本**的社区/论坛等, 比如说
**GitHub**, **知乎**, **Stack OverFlow**, **CSDN博客**, **Wikipedia**都是使用的
Markdown. 另外因为Markdown和HTML的转换十分容易, 目前大多个人博客都是编辑Markdown
格式的文章再生成HTML页面, 比如我正在码的也是Markdown文件.

再有就是目前大多数项目根目录的**README**文档都是Markdown格式, 而在线查看项目代码时
GitHub等代码托管网站都会自动将项目中所有Markdown文件渲染出来.

### 为什么我们使用Markdown

以下是网上的一些总结和我个人的体会.

1. Markdown的设计理念是易读易写, 因此**即便不渲染Markdown文件的可读性也很高**,
   这让没有Markdown渲染工具的人也能很好地阅读, 而如果要脑力渲染HTML, 一会就眼晕
   了.
2. 这种格式能让文档很方便的排列为很简洁好看的排版, **能让人专注于书写内容**, 不必费神排版
3. 支持代码按语言的语法高亮
4. **能很方便的进行版本管理**. 在要进行版本管理的项目中的Word文件简直是毒瘤, 不
   操作一番的话版本管理工具比如git并不能识别word文件具体变化, 而使用纯文本的
   Markdown能让每次的更改被体现出来!
5. **占用空间小** (可以想一想一个word文档的大小)
6. **能很容易地转为多种格式**. Markdown和HTML是兄弟关系,因此Markdown文件能轻松转换成
   **HTML**文件格式以及HTML文件能轻易转换为的格式(**PDF**, **jpg**, **Epub**等)
   是显而易见的. 通过一些额外工具(比如[Pandoc](https://pandoc.org/))的帮助,
   Markdown文件还能一键转化为更多文件格式,比如**LaTeX**, **Word**,
   **OpenOffice**, **Media Wiki**等.
7. 能方便的插入图片, 表格, 超链接等
8. 兼容HTML语法, 因此我们想让页面显示成什么样就可以显示成什么样
9. 可以兼容LaTeX语法, 可以很方便的显示复杂公式
10. 还可以兼容**Graphviz**, **Mermaid**等流程图工具等等...

### Markdown简明语法

- 一个标题以几个`#`开头, 空格后是文字. 以#的个数来表示第几级标题

- 以 - 开头接一个空格开始一个子弹列表, 以 1. 接空格开始一个有序列表

- 在要加粗的词两侧加 \*\* 来加粗. 如果要打出 \*\* 等特殊字符要在星号前加 \ 来转义 

- 在**行内代码**两侧加 \` .  注意这不是单引号, 在我键盘上在<kbd>Esc</kbd> 键下面. 当然这个不只是用来放行内代码的, 也可以放别的.

- 在代码块上下行加 \`\`\` , 第一个\`\`\`后写代码的语言.

- 在Typora这个软件里插入图片很容易, 直接`Ctrl V`粘贴就好了, 或者右键, 里面有插入图片的按键. 插入图片的markdown语法是

  ```markdown
  ![当图片失效时此处显示的文字](图片地址)
  ```

- 插入超链接的语法和插入图片的语法很像, 此处举例说明. 这是点击进入百度的链接👉 [百度](https://www.baidu.com)

  ```mark
  [百度](https://www.baidu.com)
  ```

- 表格用`|`分隔每个元素, 第一行是各列的名字, 第二行的 `| `间是`-`, 分隔列名和值. 以下是一个例子

| 第一列 | 第二列 | 第三列 |
| ------ | ------ | ------ |
| a      | b      | c      |

- 更详细的语法说明在Typora内可以查看Typora自带的Markdown语法参考手册

![1569274096465](Markdown%E5%AE%89%E5%88%A9-Typora%E7%AE%80%E8%A6%81%E4%BD%BF%E7%94%A8%E6%95%99%E7%A8%8B/1569274096465.png)

## Typora安利

那么用什么软件来写Markdown呢? 认准[**Typora**](https://typora.io/#download)!

Typora的优点多到我不想写 (不其实是单纯不想写了), 最突出的优点我觉得是它的**颜值**,
以及**能直接将图片粘贴到文件中**.

### Typora快速入门

#### 主题

在**Themes**一栏可以切换软件的主题

![1569271897771](Markdown%E5%AE%89%E5%88%A9-Typora%E7%AE%80%E8%A6%81%E4%BD%BF%E7%94%A8%E6%95%99%E7%A8%8B/1569271897771.png)

#### 大纲视图

可以按这个**OutLine**或者按左下角的小圆圈触发大纲视图, 点击大纲视图里的标题可以快速跳转.

![1569272130639](Markdown%E5%AE%89%E5%88%A9-Typora%E7%AE%80%E8%A6%81%E4%BD%BF%E7%94%A8%E6%95%99%E7%A8%8B/1569272130639.png)

#### 源代码视图

按左下角这个<kbd>\<\/\></kbd>可以切换到源代码视图

![1569272534032](Markdown%E5%AE%89%E5%88%A9-Typora%E7%AE%80%E8%A6%81%E4%BD%BF%E7%94%A8%E6%95%99%E7%A8%8B/1569272534032.png)

#### 拼写检查

右下角这里可以选择进行拼写检查的语言或者关闭这个功能.

![1569272445049](Markdown%E5%AE%89%E5%88%A9-Typora%E7%AE%80%E8%A6%81%E4%BD%BF%E7%94%A8%E6%95%99%E7%A8%8B/1569272445049.png)

#### 更多设置

按这个**Preference**可以进行更多偏好设置.

![1569272312746](Markdown%E5%AE%89%E5%88%A9-Typora%E7%AE%80%E8%A6%81%E4%BD%BF%E7%94%A8%E6%95%99%E7%A8%8B/1569272312746.png)

以下是我的推荐设置

![](Markdown%E5%AE%89%E5%88%A9-Typora%E7%AE%80%E8%A6%81%E4%BD%BF%E7%94%A8%E6%95%99%E7%A8%8B/TIM%E5%9B%BE%E7%89%8720190924051240.png)

![image-20200227124912356](Markdown安利-Typora简要使用教程/image-20200227124912356.png)

勾选**对网络图片应用上述规则**那直接粘贴从浏览器复制的图片时Typora会自动将该图片下载到这个指定文件夹.

忽略单个换行让Typora遵循GFM: 单个换行不渲染为换行, 两个换行才渲染为换行

![](Markdown%E5%AE%89%E5%88%A9-Typora%E7%AE%80%E8%A6%81%E4%BD%BF%E7%94%A8%E6%95%99%E7%A8%8B/TIM%E5%9B%BE%E7%89%8720190924051204.png)

