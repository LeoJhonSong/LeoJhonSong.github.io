---
title: 关于我的NexT主题博客的个性化配置以及遇到的一些问题
date: 2019-01-07 01:05:18
categories: "Web"
---

<div align='right'>Language:
<a href='{{ location.host }}/About-My-Custom-Settings-of-My-Next-Theme-Blog-and-Problem-Killing'><code>English</code></a>
<a href='{{ location.host }}/zh-CN/关于我的NexT主题博客的个性化配置以及遇到的一些问题'><code>中文</code></a>
</div>

<!-- More -->

<!-- TODO -->

## 遇到的问题

### 更改配置后页面未出现变化

[priority](https://developer.mozilla.org/zh-CN/docs/Web/CSS/Specificity)

### markdown中文换行导致的空格问题

请看[这里](https://codehut.me/posts/Y3Vyc29yOjg=)，它完美解决了问题。
我在**themes/next/scripts/**下放了一个`fuck_chinese_space.js`,里面正是上面这位老兄
博文里写的：

```js
hexo.extend.filter.register('after_render:html', fix);

function fix(str) { return str.replace(/([¡«·»¿;·՚-՟։׀׃׆׳-״؉-؊،-؍؛؞-؟٪-٭۔܀-܍߷-߹।-॥॰෴๏๚-๛༄-༒྅࿐-࿔၊-၏჻፡-፨᙭-᙮᛫-᛭᜵-᜶។-៖៘-៚᠀-᠅᠇-᠊᥄-᥅᧞-᧟᨞-᨟᭚-᭠᰻-᰿᱾-᱿\u2000-\u206e⳹-⳼⳾-⳿⸀-\u2e7e⺀-\u2efe\u3000-〾・㇀-\u31ee㈀-㋾㌀-㏾㐀-\u4dbe一-\u9ffe꘍-꘏꙳꙾꡴-꡷꣎-꣏꤮-꤯꥟꩜-꩟豈-\ufafe︐-︖︙︰-﹎﹐-﹒﹔-﹗﹟-﹡﹨﹪-﹫！-＃％-＇＊，．-／：-；？-＠＼｡､-･]|[\ud840-\ud868\ud86a-\ud86c][\udc00-\udfff]|\ud800[\udd00-\udd01\udf9f\udfd0]|\ud802[\udd1f\udd3f\ude50-\ude58]|\ud809[\udc00-\udc7e]|\ud869[\udc00-\udede\udf00-\udfff]|\ud86d[\udc00-\udf3e\udf40-\udfff]|\ud86e[\udc00-\udc1e]|\ud87e[\udc00-\ude1e])\n\s*/g, '$1'); }
```

### Google站点地图报错

[这里](https://alanlee.fun/2017/12/30/google-sitemap/)

### 如何建立多级分类

参见[这里](http://aiellochan.com/2018/02/13/hexo/Hexo-%E4%B8%80%E7%AF%87%E6%96%87%E7%AB%A0%E5%A4%9A%E4%B8%AA-categories/)

## 个性化配置

### 多语言

[参考1](https://www.ieclipse.cn/2016/06/02/other/tech-hexo-i18n/index.html)
[参考2](https://bambooom.github.io/2018/03/08/hexo-multi-lang/)