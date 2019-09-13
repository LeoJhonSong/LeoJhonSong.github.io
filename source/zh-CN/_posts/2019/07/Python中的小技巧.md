---
title: Python中的小技巧
date: 2019-07-03 22:23:43
categories:
- [Python]
- [技巧]
---

俺也记不住语法, 在这里记录一下常见语句.

<!-- More -->

# 基本操作

## 查看自带的帮助文档

用`help()`函数, 以`q`退出.

❗️ 使用help(module_name)时首先需要import该模块

## 查看当前python解释器路径

有时候写程序会发现莫名其妙的bug比如找不到某库, 路径不对等, 可能是因为用错了解释器. 用下面语句可以查看当前解释器的路径:

```python
import sys
sys.executable
```

## 在python解释器里清屏

搜了一下python里似乎没有很简短的清屏命令, 要用命令只能用类似以下这种:

```python
import os
a = os.system('clear')
```

💡 这是在Linux下清屏的命令, 在Windows要用`os.system('cls')`

💡 将这条命令赋值给一个变量是为了窗口顶部不出现一个0. 你可以单独输入
`os.system('clear')`试试

但如果你是在**Bash**中打开的python可以用 `Ctrl + L`, 这是Bash的清屏快捷键.

# 列表

## 生成等差数列

```python
list(range(begin, end, step))
```

## 生成任意指定列表

### 利用列表推导式

**推导式comprehensions**（又称解析式）, 是Python的一种独有特性. **推导式是可以从
一个数据序列构建另一个新的数据序列的结构体**. 换句话说能从一组数据中求出满足条件
的新数据, 比如a, b两个等长列表中都为偶数的项的乘积. 共有三种推导式, 在Python2和3
中都有支持
:

- 列表(list)推导式
- 字典(dict)推导式
- 集合(set)推导式

```python
list = [output_expression for out_exp in input_list if expression]
```

e.g.

```python
#1
a = [i for i in range(30) if i % 3 is 0]
#2
names = ['Bob','Tom','alice','Jerry','Wendy','Smith']
LONG_NAMES = [name.upper() for name in names if len(name)>3]
#3
a = [x*y for x in range(1,5) if x > 2 for y in range(1,4) if y < 3]
```

### 利用lambda函数

lambda函数在python, C++, Java等语言中都有, 我理解的作用主要有三:

- 少写几个字
- 能将一个"函数"以参数的形式传入另一个函数, ❗️注意此处普通函数能被传递并不是什么
  稀罕事, 更重要的是类似[这
  里](https://www.zhihu.com/question/20125256/answer/29733906)提到的"伪函数"
- 避免污染命名空间, 需要一个函数但不知道命什么名时用lambda函数

lambda函数主要用在filter(), map(), reduce()中

💡 在python3中`reduce()`从内建函数中移除了, 被移到了functools模块中

```python
>>> foo = [2, 18, 9, 22, 17, 24, 8, 12, 27]
>>>
>>> print filter(lambda x: x % 3 == 0, foo)
[18, 9, 24, 12, 27]
>>>
>>> print map(lambda x: x * 2 + 10, foo)
[14, 46, 28, 54, 44, 58, 26, 34, 64]
>>>
>>> print reduce(lambda x, y: x + y, foo)
139
```

# 字典

## 由列表生成字典

```python
a = [1, 2, 3]
b = ['a', 'b', 'c']
c = dict(zip(a, b))
```

## 对字典按值排序

```python
d = {'a':1, 'b':2, 'c': 5, 'd':4, 'e':3}

sorted(d.items(), key=lambda i: i[1])
```

>sorted(iterable, /, *, key=None, reverse=False)
>
>Return a new list containing all items from the iterable in ascending order.
>
>A custom key function can be supplied to customize the sort order, and the
>reverse flag can be set to request the result in descending order.

即`iterable`处放一个可迭代的对象, `key`处放自定义函数来选取比较的参数, `reverse`
处设定是否反向

`d.items()`返回可遍历的(键, 值) 元组数组, `key=lambda i: i[1]`即此处参与比较的参数是d的值
