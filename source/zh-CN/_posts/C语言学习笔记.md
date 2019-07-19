---
title: C语言学习笔记
date: 2019-07-12 16:22:42
categories: C/C++
---

这篇是学习笔记, 因为我决定最近专门重新学习一下C语言.

经常有人说自己入门C语言时觉得C语言很简单, 不到一个月就能入门, 但用久了会觉得C语
言很难, 觉得自己还没有入门. 而我现在觉得当时速成的C语言已经全部不记得了... 虽然
我目前并没有使用C的需求, 但总是看到各种C系代码, 一直头疼也不是办法, 不如温故而知
新, 再次"速成"一下.

<!-- More -->

# 语句与行

C语言我感觉对格式要求蛮宽松的, 可以一行多个语句 (每个语句必须以`;`结尾), 也可以
跨行写语句(在行末写`\`折行), 不像python对缩进都有严格要求.

💡 要注意的是预编译指令必须一行不能写多个语句, 但可以折行.

# 注释

有两种方式

## 推荐的方式

👇这种注释可以跨行写, 也可以在行内写

```C
#include /*comment*/ <stdio.h>
/*comment
comment
comment*/
```

💡值得一提的是只要出现 **/\*** 就会被识别为注释的开始, 如果想把y除z指向的内存的
值赋给x写成下面这样是不行的.

```C
x = y/*z
```

但这个问题也很好解决, 用空格或括号就能解决.

```C
x = y / *z
x = y/(*z)
```

## 不推荐的方式

这样只能单行注释

```C
code  // comment
```

❗️要注意这种注释方式是借鉴自C++, 在C99中才被标准化, 而目前使用最广泛的是C89标准,
也就是说不使用是比较保险的.

# 内存

C语言对内存的操作似乎很多, 也很注重内存管理.

C语言为内存的分配和管理提供了几个函数. 这些函数可以在 <stdlib.h> 头文件中找到.

**void \*malloc(size_t size)** 分配一块`size`大小的内存

**void \*calloc(size_t num, size_t size)** 分配一块储存了一个`num`长, 每个元素
`size`字节的内存并将所有位初始化为0

**void \*realloc(void \*ptr, size_t size)** 重新分配内存，把内存扩展到 newsize

**void free(void \*ptr)** 释放`ptr`所指向的内存

💡 malloc是memory allocate, realloc是reallocate, calloc不知道是啥.

# 段与栈与堆

**段** (segmentation)是指二进制可执行文件内的区域,所有某种特定类型信息被保存在里
面.可以用`size`命令得到可执行文件中各个段的大小. **正文段** (Text Segment)用于储
存指令, **数据段** (Data Segment)用于储存已初始化的全局变量, **BSS段** (BSS
Segment)用于储存未赋值的全局变量所需的空间.

**调用栈**并不储存在可执行文件中,而是在运行时创建.调用栈所在的段称为堆栈段(Stack
Segment). 和其他段一样, 堆栈段也有自己的大小, 不能被越界访问, 否则就会出现段错误
(Segmentation Fault). 这种情况叫**栈溢出**.

栈空间有多大和操作系统相关. 在Linux中, 栈大小是由系统命令`ulimit`指定的, 例如
`ulimit -a`显示当前栈大小, 而`ulimit -s 32768`将把栈大小指定为32MB. 但在Windows
中, 栈大小是储存在可执行文件中的. 使用gcc可以这样指定可执行文件的栈大小: `gcc
-Wl,--stack=16777216`, 这样栈大小就变为16MB

💡 栈溢出不一定是递归调用过多导致的, 也可能是局部变量太大. 因此较大的数组建议储存为全局变量.

**栈**是由编译器在需要时分配的，不需要时自动清除的变量存储区. 里面的变量通常是局
部变量, 函数参数等. **堆**是由`malloc()`函数分配的内存块,内存释放由程序员手动控
制, 在C语言由`free()`完成.

# 数组

较大的数组时应在main函数之外声明.

`memset(a, 0, sizeof(a))`能方便地把数组a清零,它在**string.h**中定义.

用strcpy(a, b), strcmp(a, b), strcat(a, b)来执行“赋值”、“比较”和“连接”操作, 在
**string.h**中定义

## 字符串

C语言中的字符串是以“\0”结尾的字符数组

不同操作系统的回车换行符是不一致的。Windows是“\r”和“\n”两个字符,Linux是“\n”,而
MacOS是“\r”. 如果在Windows下读取Windows文件, fgetc和getchar会把“\r""吃掉”, 只剩
下“\n”; 但如果要在Linux下读取同样一个文件, 它们会忠实地先读取“\r”, 然后才是“\n”.

很有意思的一个小问题: "5", '5' 和 5 有什么区别?  
"5"是一个字符串, '5'是一个字符常量, 5是一个数字常量

# 指针

用int* a声明的变量a是指向int型变量的指针. 赋值a = &b的含义是把变量b的地址存放在
指针a中, 表达式*a代表a指向的变量, 既可以放在赋值符号的左边(左值), 也可以放在右边
(右值) 注意: *a是指“a指向的变量”, 而不仅是“a指向的变量所拥有的值”. 理解这一点相
当重要. 例如, *a = *a + 1就是让a指向的变量自增1. 甚至可以把它写成(*a)++. 注意不
要写成*a++, 因为`++`运算符的优先级高于取内容运算符 `*`, 实际上会被解释成*(a++).

## 指针的运算

- 一个指针变量加/减一个整数是将该指针变量的原值(是一个地址)和它指向的变量所占用
  的内存单元字节数相加或相减.
- 两个指针变量间可以做减法, 但前提是这两个指针是指向同一个数组的元素. 两指针变量
  差是两个指针之间的元素个数
- 如果两指针变量指向同一数组的元素, 他们可以进行比较运算. 另外所有指针都可以和
  NULL进行相等/不想等比较.

# 预处理

## 宏定义

```C
#define 宏名 字符串
```

宏名一般为大写, 以下划线连接单词.

看了网上资料我感觉在C中宏定义主要是以下作用

### 增加代码抽象性

用宏定义替代magic number, 或者嵌入式中一些寄存器的位操作, 一方面增强代码可读性
(不像魔数让人不明所以, 而寄存器的位操作也很不直观), 一方面增强代码可移植性 (比如从一种单片机移植到另一种单片机, 只需更改宏定义即可)

### 防止重复定义

```C
#ifndef XXXX
#define XXXX
...
#endif
```

在头文件里用这样的语句来防止头文件被重复引用. 有一些头文件被重复引用会增加编译器
工作, 降低编译效率, 而有一些头文件被重复引用会引起冲突 (比如如果头文件里定义了全
局变量, 会发生重复定义错误).

### 控制代码编译

通过Makefile控制编译选项.

还能像轮子哥[这样](https://www.zhihu.com/question/22608939/answer/21963056)当模
板用.

❗️虽然宏定义的好处不少, 但除了以上情况尽量少用尽量不用宏定义, 因为这会让开发者看
到的代码与编译器看到的代码不同, 容易导致想不到的问题.

# 调试技巧

调试时重点关注两方面: **当前行的跳转**, **变量的变化**

循环结构程序设计中最常见的两个问题: **算术运算溢出**, **程序效率低下**

变量在未赋值之前的值是不确定的.

# gcc与gdb命令简记

## gcc

常用选项:

|name_of_option| 我猜的全名|含义|
|-|-|-|
|-o [filename]|output| 指定输出文件名|
|-g|gdb|生成调试用的符号表|
|-Wall| warning all|This enables all the warnings about constructions that some users consider questionable, and that are easy to avoid (or modify to prevent the warning), even in conjunction with macros.|
|-lm| link math.h| 链接math.h. C++编译器会自动链接, 但C的代码使用了math.h却不启动这个选项很可能出错|
|-ansi| ANSI| 检查代码是否符合ANSI标准 (常与-Wpedantic连用)|
|-Wpedantic| warning pedantic| Issue all the warnings demanded by strict ISO C and ISO C++; reject all programs that use forbidden extensions, and some other programs that do not follow ISO C and ISO C++. For ISO C, follows the version of the ISO C standard specified by any -std option used.|
|-O1, -O2, -O3|optimize|开启速度优化. 开启后编译出的程序比直接编译出的程序快, -O2比-O1快, -O3比-O2快, 但为了避免优化误解代码含义, 在算法比赛中推荐-O2. 当然如果程序十分规范就没有这种担心.|
|-DXX|define XX|在编译时定义XX符号 (此处XX是随意什么大写单词的意思), 位于#ifdef XX和#endif中间的语句会被编译|

## gdb

💡执行gdb时加选项`-q` (quiet)可以去掉进入gdb开头的废话.

常用命令:

|命令|全名|含义|
|-|-|-|
|l|list|列出十行代码. 但可以通过`set listsize`来更改显示多少行, 用`show listsize`能查看listsize. l后可以接行号, 函数名|
|r|run|开始运行程序|
|b|break|设置断点, b后接行号或函数名|
|c|continue|继续运行. 要注意在断点处停下后用c继续而不是r|
|n|next|下一行|
|s|step|与n的区别是n会执行完本行语句, 而有函数调用时s会停在函数内|
|u|until| 执行到指定行号或者指定函数的开头|
|i|info| 显示各种信息。如i b显示所有断点,i disp显示display,而i lo显示所有局部变量|
|disp|display| 把一个表达式设置为display, 当程序每次停下来时都会显示其值|
|cl|clear|取消断点, 和b的格式相同. 如果该位置有多个断点, 将同时取消|
|cond|condition|用来设置条件断点|
|ig|ignore|设置记次断点, count次以前不停止|
|wa|watch point|watch a(简写为wa a)可以在变量a修改时停下,并显示出修改前后的变量值|
|aw|all watch point| 读写时都停下|
|rw|read watch point| 被读取时停下|
|q|quit|退出gdb|
