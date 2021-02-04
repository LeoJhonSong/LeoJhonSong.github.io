---
title: Linux终端呈现彩色输出
date: 2019-09-12 02:35:48
updated: 2020-03-20 23:51:31
categories:
- [操作系统, Linux]
- [技巧]
---

最近写的程序会在终端给出大量输出, 如果都是黑底白字那这一大堆字刷刷刷往上冒一会就
能把人看眼晕, 但我发现了一个很实用而简单的技巧: **让特定类型的输出显示为特定的颜色**!

<!-- More -->

比如这样:

<p  style="color:purple">
[MESSAGE] Turning left
</p>
<p style="color:yellow">
[DEBUG] target: 4
</p>
<p style="color:red">
[Error] target not found
</p>
<p  style="color:purple">
[MESSAGE] Turning left
</p>
<p  style="color:purple">
[MESSAGE] Diving
</p>
<p style="color:green">
[INFO] depth: 9m
</p>
<p  style="color:purple">
[MESSAGE] Diving
</p>
<p style="color:green">
[INFO] depth: 10m
</p>
<p  style="color:purple">
[MESSAGE] Forward
</p>
<p  style="color:purple">
[MESSAGE] Turing right
</p>


能极大的增强终端信息的可读性!😆

这应该是Linux终端的特性, (我并不清楚是否兼容Windows命令行), shell, python, C++的
彩色文字语法几乎是一样的.

## 颜色表

|前景色 (字体颜色) 代码|背景色代码|颜色|
|-|-|-|
|30|40|黑色|
|31|41|紅色|
|32|42|綠色|
|33|43|黃色|
|34|44|藍色|
|35|45|紫紅色|
|36|46|青藍色|
|37|47|白色|

## 字体效果表

|代码|效果|
|-|-|
|0|默认|
|1|高亮(加粗)|
|4|下划线|
|5|闪烁|
|7|反色|
|8|不可见|

## 语法

### shell语法

举例:

```shell
echo "\e[31;43;1mError\!\e[0m"
```

💡 如果上面这条命令不是彩色的, 执行`echo -e "\e[31;43;1mError\!\e[0m"`

运行上面这条命令会输出一个黄底红色粗体字的"Error!". 前景色, 背景色和字体效果的代
码没有先后顺序之分. 建议每个`\e[a;b;c`都接一个`\e[0m`将字体效果恢复默认, 不然后
续输出还是带特殊效果的.

### python语法

在`print()`中使用的示例:

```python
print("\033[31;43;1mError!\033[0m")
```

或者可以通过python执行shell命令:

```python
import os
os.system('echo "\e[31;43;1mError!\e[0m"')
```

### C++语法

在C++中使用的语法和在python中是一样的:

```cpp
std:cout << "\033[31;43;1m" << "Error!" << "\033[0m" << std:endl;
```

一个小技巧是可以单独写一个`color_print.h`, 内容示例:

```Cpp
#ifndef COLOR_PRINT_H
#define COLOR_PRINT_H

#define RESET   "\033[0m"
#define BLACK   "\033[30m"      /* Black */
#define RED     "\033[31m"      /* Red */
#define GREEN   "\033[32m"      /* Green */
#define YELLOW  "\033[33m"      /* Yellow */
#define BLUE    "\033[34m"      /* Blue */
#define MAGENTA "\033[35m"      /* Magenta */
#define CYAN    "\033[36m"      /* Cyan */
#define WHITE   "\033[37m"      /* White */
#define BOLDBLACK   "\033[1m\033[30m"      /* Bold Black */
#define BOLDRED     "\033[1m\033[31m"      /* Bold Red */
#define BOLDGREEN   "\033[1m\033[32m"      /* Bold Green */
#define BOLDYELLOW  "\033[1m\033[33m"      /* Bold Yellow */
#define BOLDBLUE    "\033[1m\033[34m"      /* Bold Blue */
#define BOLDMAGENTA "\033[1m\033[35m"      /* Bold Magenta */
#define BOLDCYAN    "\033[1m\033[36m"      /* Bold Cyan */
#define BOLDWHITE   "\033[1m\033[37m"      /* Bold White */

#define print(color, context) std::cout << color << context << RESET << std::endl

#endif
```

然后在要显示彩色输出的cpp文件中引用这个头文件, 打印语句示例:

```cpp
print(BOLDRED, "Error!");
```

因为是宏替换因此`context`字段其实可以随意填, 比如有一个变量`depth`, 用下面语句来
打印深度是可以的:

```cpp
print(BOLDGREEN, "depth: " << depth << "m")
```

超好用!😆