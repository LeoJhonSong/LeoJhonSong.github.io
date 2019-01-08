---
title: About My Custom Settings of My Next Theme Blog and Problem Killing
date: 2018-12-24 13:30:40
tags:
categories: Web
---

<div align='right'>Language:
<a href='{{ location.host }}/About-My-Custom-Settings-of-My-Next-Theme-Blog-and-Problem-Killing'><code>English</code></a>
<a href='{{ location.host }}/zh-CN/关于我的NexT主题博客的个性化配置以及遇到的一些问题'><code>中文</code></a>
</div>

This blog site is powered by [Hexo](https://hexo.io), the theme is [NexT](https://github.com/theme-next/hexo-theme-next),
the scheme is `Pisces`. After I started building my blog with Hexo, I found that
actually there are some more Static Site Generators which are considered better
than Hexo. You can find a ranking list of the Static Site Generators [here](https://www.staticgen.com/).
(But if you have already get started with Hexo, it is O.K. At least I think it
is good enough)

<!-- More -->

:warning: the generator named Next in the list is a different thing from the
theme of Hexo I use.

> Here I want to share about the problems I meet and my custom settings.

<!-- More -->

## problems I met

### GitHub Pages says I am using a unsupported theme

**This problem is very likely to occur if you simply commit your whole Hexo
instance to your master branch.**

In fact, only [a few themes](https://help.github.com/articles/adding-a-jekyll-theme-to-your-github-pages-site-with-the-jekyll-theme-chooser/)
are supported by GitHub Pages and NexT or any Hexo theme is not included
:man_facepalming:But here is a little trick: the files are rendered at your
desktop, simple HTML pages are uploaded to the master branch as the source code
of your site. In this way, anytheme can be applied to your blog:smile:

Therefore, you can not simply commit your Hexo instance to the master branch,
what I did is to publish a new branch `Root` to store my Hexo instance and use
the [hexo-deployer-git](https://github.com/hexojs/hexo-deployer-git)
plugin to deploy my site to the master branch.

:warning:your GitHub Pages can only published from the master branch if your
repository is named `username.github.io`

If you haven't installed this
plugin, use the following command at the root of your hexo instance.

```bash
npm install hexo-deployer-git --save
```

check [here](https://hexo.io/docs/deployment.html#Git) for the configuration.

<!-- TODO -->

### custom settings show up locally but things did not change on web

try these:

- `hexo clean` in cmd at the root of your blog
- `Ctrl + F5` or `Ctrl + Fn + F5` to force the browser to refresh the page
- delete the **.deploy_git** folder
- specific the class of the item to rise its priority
- `hexo s` to run it locally to see if something goes wrong

reasons could be:

- your setting is not first priority in CSS, the value is overwritten
- your browser uses the cache data of the page instead of reload it
- there is grammar mistake in your modification

### cannot show emoji

https://emojipedia.org/
https://www.npmjs.com/package/hexo-filter-github-emojis

### will line feed whenever there is a line feed in the md file

https://github.com/iissnan/hexo-theme-next/issues/1672

### sitemap error

### error word-count
https://github.com/theme-next/hexo-symbols-count-time/issues/17
I enabled word count provided by Hexo but the count is definitely larger than it
should be. But that is not a problem, it can be seen as a decoration :see_no_evil:

https://alanlee.fun/2017/12/30/google-sitemap/

## My custom settings

I am proud of **some** settings because I tried and achieved it by myself, despite
from simply copying others' code. :stuck_out_tongue_closed_eyes:

### multi-language

can do as the document do

### Categories, About

### search

### custom favicon

### better response for mobile devices

### custom colors

http://nipponcolors.com/

### sidebar fot mobile devices

https://leaferx.online/2017/02/05/EnableTOConMobile/

### alternative social links.

### colorful icons

in `sidebar.swig`

### better organized post-block

### visitor number

### post word count

https://github.com/theme-next/hexo-symbols-count-time

### hide hexo copyright

### improved the arrangement of images in asset folder

in file **node_modules\hexo\lib\models\post_asset.js**

`line30`

```javascript
    return pathFn.join(post.path.replace(/\.html?$/, ''), post.path.replace(/\.html?$/, ''), this.slug);
```
Unfortunately, according to my test, the tag method to insert images provided by [Hexo](https://hexo.io/docs/asset-folders.html#Tag-Plugins-For-Relative-Path-Referencing)
does not work as it supposed to be anymore after modifying the **post_asset.js**:man_facepalming:.
Since I would use anything but the tags so this doesn't bothers me:grin:. But if you want to improve this situation, I suppose you should modify the file **node_modules\hexo\lib\plugins\tag\asset_img.js**

### Valine comment system