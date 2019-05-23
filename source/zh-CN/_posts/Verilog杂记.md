---
title: Verilog杂记
date: 2019-05-21 23:15:54
categories:
  - [杂记]
  - [Verilog]
---

Verilog学习笔记。

<!-- More -->

# Quartus与Modelsim的安装

🔗 [quartus16.1和modelsim-altera for linux的安装](https://blog.csdn.net/weixin_38071135/article/details/82531594)  
🔗 [DE2-115 開發紀錄: 在 Linux 下使用 ModelSim](https://coldnew.github.io/ce6f7a0a/)

参考上面两个链接 (后者算是对前者的补充)我成功在Ubuntu1804下安装了Quartus和Modelsim. 因为我
懒得注册论坛帐号, 我并没有使用第一个链接中提供的破解文件, 而是使用了[这里](https://tsuhuai.wordpress.com/2015/02/17/altera-quartus-crack-for-linux-version/)提供的
15.0版的crack. 我装的也是15.0版的Quartus和Modelsim, 但问题和解决方法是一样的.

# verilog开发流程

🔗[Verilog代码和FPGA硬件的映射关系](https://copyfuture.com/blogs-details/83fc5f52af0e6c318e3c5cfa5baf2ac0) 这里通过一个例子清晰的展示了Verilog代码是怎样一步步
映射到FPGA的基本逻辑单元的👍

## 编译

### 语法分析

### 综合

综合是把RTL级别的, 抽象层次较高的硬件代码综合成抽象层次较低的电路网表, 是一个具体优化+映射的过程,
能够对应到门级逻辑.

### 适配

把综合后的具体数字逻辑映射到指定型号的FPGA器件中去, 包括选择哪一些基本逻辑单元 (主要包含LUT和
寄存器单元) 以及布局布线等.

## 下载

下载是将整个编译过程完成的可下载二进制信息通过下载线从计算机端传递到FPGA开发板端, 并完成FPGA
内部电路的具体配置(LUT中的存储信息以及连接线的连接开关设置等等), 形成具有相应功能的功能电路.

# 代码风格与语法纪要

## 有关模块

🔗 [关于Verilog的模块思想和模块的引用](http://jason0214.lofter.com/post/30cbe4_12a8f72)

> Verilog的开发应是**自顶向下**的，**模块化**的.

一个系统由总设计师先进行系统描述(Spec), 将系统划分为若干模块, 编写模块模型(一般为行为级), 仿真
验证后, 再把这些模块分配给下一层的设计师, 由他们完成模块的具体设计, 而总设计师负责各模块的接口
定义.

> 链接引用模块端口时, 注意括号内的是当前模块的端口, 括号外的是引用模块的端口.

❗️一开始我看到Verilog中模块就像面向对象中的类一样, 调用模块也神似类的实例化, 曾以为其中有面向
对象的思想, 后来发现我太想当然了: 面向对象的三大特征 (封装, 继承, 多态) 它只满足了封装, 显然
不能算面向对象. 硬要说的话verilog包含了**面向对象**的思想, 而面向过程的程序设计方法正是:
"自顶向下, 逐步求精". 当然, **要时刻牢记Verilog是一门硬件语言**.

一个模块可以采用以下方式描述设计:

- 数据流方式
- 行为方式
- 结构方式
- 混合

## 有关always

`always`实际上就是循环关键字, 而`always @()`则是条件循环关键字.

always块的讲究很多:

1. 写在括号内的称**敏感事件列表**, 当这些事件 (电平信号变化或者出现边沿信号) 发生时
   触发这个块. 一个敏感事件列表中不能同时包含电平敏感事件和边沿敏感事件. **电平敏感事件意味着这
   是一个描述组合逻辑的always块** (我们也可以在描述组合逻辑的always块的敏感事件列表中填`*`来让
   综合器根据always块内容来自动添加敏感事件), **边沿敏感事件意味着这是一个描述时序逻辑的always
   块**.
2. **尽量只使用主时钟 (clk, rst) 作为always块的边沿敏感事件**, 避免出错. 如果有其他信号边沿
   触发的事件可以通过[这里](https://blog.csdn.net/phenixyf/article/details/46364193)
   提到的clk周期延时法将边沿触发转换为电平触发.
3. **不要将同一信号的上升沿敏感事件和下降沿包含在同一敏感事件列表**, 因为它们可以合为一个电平
   敏感事件.
4. **尽量不要在多个always块中给同一变量赋值**, 这样容易产生竞争冒险 (所有always块同时运行),
   且无法综合. 如果一个变量的值与两个always块都有关且这两个always块无法合并, 可以参考[这种方法](https://blog.csdn.net/gududeyhc/article/details/8795202). 另外也可以考虑用两个
   always块的敏感事件生成一组新的敏感事件 (参考第二条).
5. **一个always块中不能混用阻塞赋值 (=) 和非阻塞赋值 (<=)**, 在描述组合逻辑的always块中使用
   `=`, 在描述时序逻辑的always块中使用`<=`.
6. **always块中的条件语句要与敏感事件相对应.** 比如以下两段代码前者是错误的, 后者是正确的.

   ```verilog
   always @(posedge clk or negedge rst)
   begin
       if(rst)
           ...
   end
   ```

   ```verilog
   always @(posedge clk or negedge rst)
   begin
       if(!rst)
           ...
   end
   ```

## 关于default

在写case块时发现所有示例里都写出了default这种情况, 无论情况是否完备. 这让我有了两个问题:

- 为什么一定要有default这种情况?
- default情况该给变量赋什么值?

### 为什么一定要有default这种情况

1. 避免产生Latch. 此处的Lathc特指FPGA中的latch, 
   > latch是一种对脉冲电平敏感的存储单元路径，可以在特定输入脉冲作用下改变电平

   由这个描述我们可以看出在if-else结构和case结构中很容易产生latch.

2. 方便调试

   如果default对应的情况是不应当出现的情况, 在仿真时可以将default情况下的变量赋值为不定态X,
   方便看出问题.

3. 这已经是一种代码规范, 最好养成严谨的习惯, 避免出错.

### default情况下该赋什么值

如果default对应的情况不应当出现, 在仿真时将变量都赋值为不定态X, 方便看出错误 (在Modelsim里
不定态的信号会显示为红色), 在实际应用时全部置零 (复位态).
