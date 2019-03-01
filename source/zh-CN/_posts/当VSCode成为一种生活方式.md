---
title: 当VSCode成为一种生活方式
date: 2019-01-07 01:11:16
categories: 杂记
---

<div align='right'>Language:
<a href='{{ location.host }}/When-VSCode-Becomes-A-Lifestyle'><code>English</code></a>
<a href='{{ location.host }}/zh-CN/当VSCode成为一种生活方式'><code>中文</code></a>
</div>

<!-- TODO -->
在此为我认为不错的一些VSCode插件做一下安利:smirk:

<!-- More -->

:warning: 要注意的是最好不要在一个项目中使用过多插件, 这会让VSCode最开始的加载非常慢,
这是得不偿失的. 我们仍要记得VSCode只是一个编辑器. 而我们通常面临的尴尬情况是:有很多日常
会用到的插件, 但并不是在每个项目中都需要用到全部的插件, 有很多插件只是浪费资源.
而通过将一些插件设为**禁用(工作区)**可以仅在这个项目中禁用这个插件! 这样能大大缩短VSCode启动时间:smile:



# VSCode 个性化设置

## 改编辑器选项卡关闭按钮位置至左边

在这之前有一件让我很恼火的事: 我经常由于文件标题过长而选项卡关闭按钮在右侧而不能轻松地
关闭一个选项卡, 因为关闭按钮没能显示出来! 而我将关闭按钮改至左侧后, :satisfied:爽到!

:heavy_check_mark: 更改方法: 在设置中搜索 `workbench.editor.tabCloseButton`, 设置为**left**

## 在一定数量的等宽字符后显示垂直标尺

VSCode有许多很好用的功能!:satisfied: 这是其中之一. 你可以设置任意多个标尺来作为字数
的参考线!

:heavy_check_mark: 设置方法: 在设置中搜索`editor.rulers`, 选择后在数组中填入要画线处的字数.

## 代码格式化

统一用 `Alt+shift+F` 作为代码格式化快捷键

## 查看键盘快捷方式

如果你新安装了一个插件, 其中几个快捷键不知道为什么不好用或者效果不对, 你应当到
**键盘快捷方式**查看一下这个快捷键在该情况下是不是对应了不止一个命令.

## 关闭Enter键接受建议

很多时候原本想换行的, 但是按Enter却接受了VSCode的沙雕建议, 令人郁闷, 通过关掉Enter接受
建议能让心情好很多:smirk: 虽然习惯Enter接受建议突然改成只能用Tab接受建议会有点不适应,
但再适应一下就会觉得非常舒服了:clap:

:heavy_check_mark: 设置方法: 在设置中搜索`editor.acceptSuggestionOnEnter`, 改为
**off**