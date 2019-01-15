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

This blog site is powered by [Hexo](https://hexo.io), the theme is [NexT](https://theme-next.org/),
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

## Problems I met

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
extension to deploy my site to the master branch.

:warning:your GitHub Pages
[can only published from the master branch](https://help.github.com/articles/configuring-a-publishing-source-for-github-pages/)
if your repository is named `username.github.io`

If you haven't installed this
plugin, use the following command at the root of your hexo instance.

```bash
npm install hexo-deployer-git --save
```

check [here](https://hexo.io/docs/deployment.html#Git) for the configuration.

### Cannot commit theme/next to github

Here is the issue: [#932](https://github.com/iissnan/hexo-theme-next/issues/932)
[#328](https://github.com/iissnan/hexo-theme-next/issues/328)

Therefore you cannot backup your theme simply committing it to github since it
is a subproject. Although a cool solution is provided in `#328`, it cannot solve
my problem since I did further customization. But I did not try the solution
**fork+submodule** mentioned in `#932`. I simply deleted files declaring its
identity of a subproject so the theme folder becomes totally a part of my hexo
instance.:man_facepalming: You just need to left these files:

```bash
.
├──languages
├──layout
├──scripts
├──source
├──_config.yml
└──package.json
```

You can also change the theme's name from `next` to
whatever else, for example `LeoJhonSong`:smile:. According to [Hexo](https://hexo.io/docs/themes),
you have to then modify the theme setting in your site’s `_config.yml`, assigning
the name of your theme folder to it.

### Pages do not change after modification

the issue could be separated in to two situations.

#### The modification works on local server

the reason may be:

- sometimes your modification will be ignored if you do not run `hexo clean` to
  delete the cache file (**db.json**)
- your setting is not first [priority](https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity) in CSS in all probability, the value is
  overwritten somewhere else

check if the attributes you changed is valid by
[Chrome DevTools](https://developers.google.com/web/tools/chrome-devtools/css/).
The invalid attributes will look like this: ~~color: #fff~~

- you can specific the class name of the item to rise the priority of yuor custom
  attribute.
- another way is to use
  [!important](https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity#The_!important_exception)
  to force priority to rise. for example, `color: #fff !important`. It is often
  not recommanded since it ruins existing CSS and may cause difficulty when
  debugging. In addition, there is still a low risk it is not raised to first
  priority :sweat_smile: as examples are given [here](https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity#The_!important_exception)

#### The modification even does not work on local server:man_facepalming:

The reason could be:

- your browser uses the cache data of the GitHub Page instead of reloading it
- there is grammar mistakes in your modification

The solution could be:

- `Ctrl + F5` or `Ctrl + Fn + F5` to force the browser to refresh the page
- check the generation information to see if there is an error or run `hexo s`
  to run the site locally to see if something goes wrong

### Cannot show emoji

add [hexo-filter-github-emojis](https://www.npmjs.com/package/hexo-filter-github-emojis)
and then you can use Emojis as you want just like me.:v:

if you want to type a emoji but you have no idea what its shortcut is,
you could go to [emojipedia](https://emojipedia.org/) for help.

### Will line feed whenever there is a return in the markdown file

Actually this issue is mentioned in [github](https://github.com/iissnan/hexo-theme-next/issues/1672).

this happened to me because I uninstalled `hexo-renderer-marked` and installed
`hexo-renderer-markdown-it` since the **markdown-it** markdown parser has [plenty of plugins](https://www.npmjs.com/search?q=markdown-it):man_facepalming:.

### Sitemap error

Google Search Console may tells you that there is errors in your site if you did
not changed your site's url from `http://yoursite.com` to `your own root url` in
your site's `_config.yml`...

### Error word-count

It had been mentioned [here](https://github.com/theme-next/hexo-symbols-count-time/issues/17).

I enabled word count provided by Hexo but the count is definitely larger than it
should be. But that is not a problem, it can be seen as a decoration
:see_no_evil:

## My custom settings

I am proud of **some** settings because I tried and achieved it by myself, despite
from simply copying others' code. :stuck_out_tongue_closed_eyes:

### Commit site to Google

Unfortunately, Baidu crawler is blocked by GitHub because
[Baidu has been used to attack GitHub](https://www.netresec.com/?month=2015-03&page=Blog&post=China%27s-Man-on-the-Side-Attack-on-GitHub).
Actually poor Baidu did not mean to do this... But to be honest, Baidu is
not a lovely search engine since it puts **plenty** of ads in its search
results:roll_eyes:. So I won't bother solving the issue that Baidu con not find
my blog. Besides, this blog is mainly wrote for myself:v:.

1. install [hexo-generator-sitemap](https://github.com/hexojs/hexo-generator-sitemap)

2. go to [Google Search Console](https://search.google.com/search-console/about)
   and add your site.verify it by `HTML tag`. There you get a \<meta\> tag like this:

   ```html
   <meta name="google-site-verification" content="blablablablablabla" />
   ```

   the `content` is your verification code.

3. add following code to your site's `_config.yml`:

   ```yml
   sitemap:
     path: sitemap.xml

   google_site_verification: your code
   ```
4. run the following code:

   ```bash
   hexo d -g
   ```

   now your site should have be added the verification tag.

5. go back to google search console and commit your sitemap. Your sitemap should
   be named `sitemap.xml`.

6. DONE!

### Multi-Language

> This part! Guys, this is my proud since I worked out my own solution.
My work is based on [this](http://kvh.io/en/hexo-nginx-multi-lingual.html)
and [this](https://bambooom.github.io/2018/03/08/hexo-multi-lang/)

It is described very clearly in **Keep Velocity High**'s post that a
multilingual blog implemented with current tools is not good enough. He's idea
of running two isolated blog is a good try and thanks to his great work I don't
have to do those works again. But just as the second post pointed out, it
becomes **too hassle** that we have to run two independent site if we just want
our site could be shown in more than one language. As a individual blogger I do
not have that much time to maintain my blog. **I have to run three sites, if I
want it can be shown in Chinese, English and Japanese!** In addition, if we want
to change the style of the blog, we have to repeat the work for each
language:fearful:.

The solution mentioned in the second post is also very smart, but there is still
some problems.

1. His idea of deploy two site to one repository is impossible since a
   repository can only have one home page.  
   In addition, you need a repository named `zh-CN` if you want your chinese
   site's root url is `https://yourname.github.io/zh-CN`

2. it definitely waste a lot of time if we have to copy the markdown files to
   the source folder every time we generate the public folder.

As we can see, most multilingual site will give each site a different root url.
Therefore, I decided to use https://leojhonsong.github.io to be the home of my
english site and https://leojhonsong.github.io/zh-CN for Chinese site. That is
to say, I need a repository called [leojhonsong.github.io](https://github.com/LeoJhonSong/LeoJhonSong.github.io)
and a repository called [zh-CN](https://github.com/LeoJhonSong/zh-CN) for my
blog.

Things are simple until now, but **here is the trick**: since hexo allows us to
add
[alternate config](https://hexo.io/docs/configuration#Using-an-Alternate-Config),
we use the site's `_config.yml` for settings of the english site as well as the
basic settings of the blog and create `_config.zh-CN.yml` for settings of
Chinese site that differs from english site to override settings in
`_config.yml`. There, we are able to set different source folder path, public
folder path for each language and even different repository to deploy the site:smile:

The following code are my settings.

in `_config.yml`:

```yml
# Site
language: en

# URL
url: https://leojhonsong.github.io/
root: /

# Directory
source_dir: source/en
public_dir: public/en

# Extensions
theme: LeoJhonSong

# Deployment
deploy:
  type: git
  repo: git@github.com:LeoJhonSong/LeoJhonSong.github.io.git
  branch: master
```

in `_config.zh-CN.yml`:

```yml
# Site
language: zh-CN

# URL
url: https://leojhonsong.github.io/zh-CN
root: /zh-CN

# Directory
source_dir: source/zh-CN
public_dir: public/zh-CN

# Deployment
deploy:
  type: git
  repo: git@github.com:LeoJhonSong/zh-CN.git
  branch: master
```

Then after generation your directory should look like this:

```bash
.
├──.deploy_git
├──node_modules
├──public
│       ├─en
│       └─zh-CN
├──scaffolds
├──source
│       ├─en
│       └─zh-CN
├──themes
├──_config.yml
├──_config.zh-CN.yml
├──_multiconfig.yml
├──db.json
├──debug.log
├──LICENSE
├──package-lock.json
└──package.json
```

By this method, you can easily set up a multilingual blog!

:warning: notice that `db.json` is the cache file for generation, that is to
say, if you generate the files for Chinese site right after generating files for
English site, the English files will be mixed into **public/zh-CN**, which is
annoying. So you should run `hexo clean` to delete `db.json` every time before
generating files for **different language**.

We can also write a batch script and python script to shorten the commands.

put `a.bat` in the root directory:

```bash
@echo off

:: g for generate, d for deploy, e for English, c for Chinese, nc for new
:: Chinese post, ne for new English post, n for new post of all language

if "%1"=="" goto generateDeployAll
if "%1"=="g" goto generateAll
if "%1"=="d" goto deployAll
if "%1"=="e" goto english
if "%1"=="c" goto chinese
if "%1"=="ne" hexo new %2
if "%1"=="nc" hexo new %2 --config _config.yml,_config.zh-CN.yml
if "%1"=="na" hexo new %2 && hexo new %3 --config _config.yml,_config.zh-CN.yml && multi-language.py %2 %3
goto end

:generateDeployAll
hexo clean && hexo d -g && hexo clean --config _config.yml,_config.zh-CN.yml && hexo d -g --config _config.yml,_config.zh-CN.yml
goto end

:generateAll
hexo clean && hexo g && hexo clean --config _config.yml,_config.zh-CN.yml && hexo g --config _config.yml,_config.zh-CN.yml
goto end

:deployAll
hexo d && hexo d --config _config.yml,_config.zh-CN.ymlhexo
goto end

:english
if "%2"=="" goto generateDeployEnglish
if "%2"=="g" goto generateEnglish
if "%2"=="d" goto deployEnglish
if "%2"=="s" goto serverEnglish
goto end

:generateDeployEnglish
hexo clean && hexo d -g
goto end

:generateEnglish
hexo clean && hexo g
goto end

:deployEnglish
hexo d
goto end

:serverEnglish
start hexo server
start http://localhost:4000
goto end

:chinese
if "%2"=="" goto generateDeployChinese
if "%2"=="g" goto generateChinese
if "%2"=="d" goto deployChinese
if "%2"=="s" goto serverChinese
goto end

:generateDeployChinese
hexo clean --config _config.yml,_config.zh-CN.yml && hexo d -g --config _config.yml,_config.zh-CN.yml
goto end

:generateChinese
hexo clean --config _config.yml,_config.zh-CN.yml && hexo g --config _config.yml,_config.zh-CN.yml
goto end

:deployChinese
hexo d --config _config.yml,_config.zh-CN.yml
goto end

:serverChinese
start http://localhost:4000
start hexo server --config _config.yml,_config.zh-CN.yml

goto end

:end
```

put `multi-language.py` in the root directory:

```python
# -*- coding: UTF-8 -*-

import sys
import re


def filter(filename):
        filename = filename.replace(' ', '-')
        filename = filename = re.sub(r'[+/?#$%]', "", filename)
        return filename


englishName = filter(sys.argv[1])
chineseName = filter(sys.argv[2])
chineseName = chineseName.decode('gbk').encode('utf-8')

englishFile = 'source/en/_posts/' + englishName + '.md'
chineseFile = 'source/zh-CN/_posts/' + chineseName + '.md'
Files = [englishFile, chineseFile]

for filepath in Files:
        with open(filepath, 'a') as post:
                post.write("\n")
                post.write("<div align='right'>Language:\n")
                post.write("\t<a href='{{ location.host }}/"+englishName+"'><code>English</code></a>\n")
                post.write("\t<a href='{{ location.host }}/zh-CN/"+chineseName+"'><code>中文</code></a>\n")
                post.write("</div>")
                post.write("\n")
```

These will make things much easier. You just need to put these two file in the
root of your hexo instance and you are good to go. **%1, %2** in the code are
the parameters passed to the batch. For example, you can type `a c g` in cmd in
the root of your hexo instance to generate the Chinese files. **a** is te name
of my batch file as I named it **a.bat** but of course you can change it to want
ever you want. By the way, the file name is also a parameter passed to the batch
file, **%0**. **c** is the second parameter (**%1**) passed to the batch and
**g** is **%2**. It is interesting that the parameter's value could be null,
that is to say, if you simply type `a`, the English files will be generated and
deployed then Chinese files will be generated and deployed. The commands `a ne`,
`a nc`, `a na` are used to generate new post.But the best part is that the
command `a na` will call the **multi-language.py** to write HTML code to link
the Chinese post and the corresponding English post. For example, if you want to
new a English post named **Hello World** and its Chinese version **你好世界**, the
command should be `a na 'Hello World' '你好世界'`

### Categories, About page

Reference [here](https://theme-next.org/docs/getting-started/#Configuring-Menu-Items)

### Search

1. install the dependencies [hexo-generator-searchdb](https://github.com/theme-next/hexo-generator-searchdb)
   and [hexo-generator-search](https://github.com/wzpan/hexo-generator-search)
   by:

   ```bash
   npm install hexo-generator-search  --save
   npm install hexo-generator-searchdb --save
   ```

2. configure settings for **hexo-generator-search** in **site**'s `_config.yml`:

   ```bash
   search:
     path: search.xml
     field: post
     format: html
     limit: 10000
   ```

3. configure settings for **hexo-generator-searchdb** in **theme**'s `_config.yml`:

   ```bash
   local_search:
     enable: true
     trigger: auto
     top_n_per_article: 1
   ```

### Better response for mobile devices

### Custom colors

http://nipponcolors.com/

### Sidebar fot mobile devices

https://leaferx.online/2017/02/05/EnableTOConMobile/

### Alternative social links.

### Colorful icons

in `sidebar.swig`

### Better organized post-block

### Visitor number

### Post word count

https://github.com/theme-next/hexo-symbols-count-time

### Hide hexo copyright

### Improved the arrangement of images in asset folder

in file **node_modules\hexo\lib\models\post_asset.js**

`line30`

```javascript
    return pathFn.join(post.path.replace(/\.html?$/, ''), post.path.replace(/\.html?$/, ''), this.slug);
```
Unfortunately, according to my test, the tag method to insert images provided by [Hexo](https://hexo.io/docs/asset-folders.html#Tag-Plugins-For-Relative-Path-Referencing)
does not work as it supposed to be anymore after modifying the **post_asset.js**:man_facepalming:.
Since I would use anything but the tags so this doesn't bothers me:grin:. But if you want to improve this situation, I suppose you should modify the file **node_modules\hexo\lib\plugins\tag\asset_img.js**

### Valine comment system