---
title: vim使用杂记
date: 2019-07-10 15:58:14
categories: vim
---

使用vim开发也有半年多啦, 不过配置vim也是个漫长的过程. 记录一下常用快捷键和用法和配置过程.

<!-- More -->

🌟首先放上我的[vimrc链接](https://github.com/LeoJhonSong/vimrc)

在vim中, 多文件编辑主要涉及三个概念: **窗口**, **标签页**, **缓冲区**

相关参考:

🔗 [Vim 多文件编辑：窗口](https://harttle.land/2015/11/14/vim-window.html)  
🔗 [Vim 多文件编辑：标签页](https://harttle.land/2015/11/12/vim-tabpage.html)  
🔗 [Vim 多文件编辑：缓冲区](https://harttle.land/2015/11/17/vim-buffer.html)

❗️没有特别说明本文中的代码都是放在 `.vimrc` 中的.

# 阅读代码

## 翻页

<kbd>Ctrl f</kbd> 下翻一页  
<kbd>Ctrl b</kbd> 上翻一页  
<kbd>Ctrl d</kbd> 下翻半页  
<kbd>Ctrl u</kbd> 上翻半页

## 代码折叠

原本展开代码和折叠代码是绑定在了 `zo` (z open) 和 `zc` (z close), 不过我重新映射
到了空格键, normal模式下按一次展开, 再按一次折叠, 感觉更方便一些.

``` vim
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
```

另外 `zn` 为全部展开, `zN` 为全部折叠.

## 拼写检查

``` vim
set spell
set spellfile=~/.vim/spell/en.utf-8.add
```

按 `]s` 跳往下一错误拼写, `[s` 往前跳.

按 `zg` 将当前光标所在单词记录到字典 (指出当前word 是 good word), `zw` 将当前单词
从字典删除 (指出当前word为wrong word)

vim允许同时使用多个字典, 通过输入 `:set spellfile+=path/to/dic/en.utf-8.add` 来添
加, 但要注意这个文件后缀名一定是 **.[encoding].add**

这之后你可以输入 `set spellfile?` 来查看当前在使用哪些字典, 要将单词添加到第一个
字典就按 `1zg` , 添加到第二个就按 `2zg` . 很好的一点是spellfile这个变量只在当前缓
冲区有效, 即每个文件可以使用不同的spellfile值. 这给保存单词到当前工作区带来了可
能. 因此我设置了一个快捷键:

``` vim
nnoremap <leader><C-z> :exe "setlocal spellfile+=" . <C-r>=shellescape(fnamemodify("en.utf-8.add", ":p"), 1)<CR><CR>
```

这样每次按<kbd>Ctrl , z</kbd>就会添加一个当前文件所在文件夹的字典到spellfile

# 调整窗口

💡 <kbd>Ctrl w</kbd> 开头的都是与窗口有关的快捷键, w指window

## 在窗口间移动

<kbd>Ctrl w</kbd> 接 hjkl上下左右在各窗口间移动光标  
<kbd>Ctrl w t</kbd> 移动光标至最左上窗口  
<kbd>Ctrl w b</kbd> 移动光标至最右下窗口

## 调整大小

宽度调整:

<kbd>Ctrl w [n] ></kbd> 右移边界  
<kbd>Ctrl w [n] <</kbd> 左移边界

💡默认增减1个字符宽度, 可以在Ctrl w和+/-间加数字来指定增减宽度. 不是最右边的窗口
调整的是右边界, 最右边的窗口调整的是左边界.

高度调整:

<kbd>Ctrl w [n] +</kbd> 增加高度  
<kbd>Ctrl w [n] -</kbd> 减小高度

通过设置以下几个键映射我可以十分方便地调整窗口大小

``` vim
nnoremap <F2> <C-w>+
nnoremap <F3> <C-w>-
nnoremap <F4> <C-w><
nnoremap <F5> <C-w>>
```

## 调整位置

<kbd>Ctrl w</kbd> 接HJKL移动窗口至最上下左右并且宽度或高度为最大.
<kbd>Ctrl w r</kbd> 顺时针移动窗口  
<kbd>Ctrl w R</kbd> 逆时针移动窗口

# 键映射

vim是能够进行高度个性化的编辑器, 因此每个人肯定都会添加一些自己顺手的快捷键, 因
为我是从VSCode转来vim的, 因此我的快捷键设置一定程度上参考了VSC的快捷键设置. 用以
在 **\.vimrc** 中设定快捷键的命令有好几个, 我的vimrc里比较常用的是 `nnoremap` 和 `map` . 以下是我常用的命令及其含义.

|命令|含义|
|-|-|
|:noremap|nonrecursive map, 不可递归的映射|
|:nnoremap|normal nonrecursive map, 只在normal模式有效的noremap|
|:inoremap|insert nonrecursive map, 只在insert模式有效的noremap|
|:vnoremap|visual nonrecursive map, 只在visual模式有效的noremap|
|:map|可递归的映射|
|:nmap|normal map, 只在normal模式有效的map|

以下是各种映射命令对应有效的模式. 具体解释可以在vim里用 `:help` 命令查看.

💡顺带一提是可以把[vim的帮助文档设为中文](https://www.liuhaolin.com/vim/272.html)的

|命令|模式|
|-|-|
|:map   :noremap  :unmap |    Normal, Visual, Select, Operator-pending|
|:nmap  :nnoremap :nunmap|    Normal|
|:vmap  :vnoremap :vunmap|    Visual and Select|
|:smap  :snoremap :sunmap|    Select|
|:xmap  :xnoremap :xunmap|    Visual|
|:omap  :onoremap :ounmap|    Operator-pending|
|:map!  :noremap! :unmap!|    Insert and Command-line|
|:imap  :inoremap :iunmap|    Insert|
|:lmap  :lnoremap :lunmap|    Insert, Command-line, Lang-Arg|
|:cmap  :cnoremap :cunmap|    Command-line|
|:tmap  :tnoremap :tunmap|    Terminal-Job|

💡 关于应当避免使用 `map` 的具体原因可以参考[这
里](http://learnvimscriptthehardway.stevelosh.com/chapters/05.html#nonrecursive-mapping)

# 插件

## vim-plug

我用[vim-plug](https://github.com/junegunn/vim-plug)来管理我的vim插件, 使用很简单, 写法可以参照我的vimrc. 每次要下载插件时在vim中输入 `:PlugInstall` 即可. 超好用😆

## NERDtree

NERDtree是一个不错的文件资源管理器, 体验和VSC的explorer差不多. 觉得每次输
`:NERDTreeToggle` 太麻烦的话可以键绑定一下:

``` vim
nnoremap <leader><C-e> :NERDTreeToggle<CR>
```

我绑定到了<kbd>Ctrl , e</kbd>, 和本来想绑的VSC里的<kbd>Ctrl shift e</kbd>不同. 因为在终端中<kbd>Ctrl
shift 字母</kbd>和<kbd>Ctrl 字母</kbd>的输出没有区别.

以下是几个我比较常用的NREDtree命令

| | |
|-|-|
|C|切换NERDtree根目录到光标所在文件夹|
|R|刷新根目录|
|r|刷新光标所在目录|
|s|水平分屏打开|
|i|竖直分屏打开|

