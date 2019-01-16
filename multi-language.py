# -*- coding: UTF-8 -*-
# <div align='right'>Language:
# <a href='{{ location.host }}/'><code>English</code></a>
# <a href='{{ location.host }}/zh-CN/'><code>中文</code></a>
# </div>

import sys
import re


def filter(filename):
        filename = filename.replace(' ', '-')
        filename = filename = re.sub(r'[+/?#$%]', "", filename)
        return filename


englishName = filter(sys.argv[1])
chineseName = filter(sys.argv[2])

englishFile = 'source/en/_posts/' + englishName + '.md'
chineseFile = 'source/zh-CN/_posts/' + chineseName + '.md'
Files = [englishFile, chineseFile]

for filepath in Files:
        with open(filepath, 'a') as post:
                post.write("\n")
                post.write("<div align='right'>Language:\n")
                post.write("\t<a href='{{ location.host }}/"+englishName+"'><code>English</code></a>\n")
                post.write("\t<a href='{{ location.host }}/zh-CN/"+chineseName.decode('gbk').encode('utf-8')+"'><code>中文</code></a>\n")
                post.write("</div>")
                post.write("\n")
