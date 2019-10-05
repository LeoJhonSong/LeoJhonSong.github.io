---
title: My configurations under Ubuntu
date: 2019-03-20 16:46:21
categories:
- [Linux]
- [Configuration]
---

I note down here my configurations in order to quick set up my environment on a new machine.

<!-- More -->

# shell

## powerline

💡root is another user, need extra configurations.

1.install it.

```shell
pip install --user git+git://github.com/powerline/powerline
```

2.run `pip show powerline-status` to show where the package is.

3.add its launch script to **~/.bashrc**.

💡 e.g. the location of the script on my computer is
**~/.local/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh**

## vim

goto my [vimrc](https://github.com/LeoJhonSong/vimrc).

# OneDrive

there are a few onedrive tools on Linux platform, but most of them, for example
`onedrive-d` just support personal onedrive account, onedrive 365 as well as
onedrive business are not supported. Someone recommended `GoodSync`,
unfortunately I didn't figure out how on earth do I use it 😢. Good news is I
find a thing called [onedrive](https://github.com/abraunegg/onedrive) (what a
confusing name), which **support personal account and onedrive 365 and even
onedrive business**!

goto [abraunegg/onedrive](https://github.com/abraunegg/onedrive) for instructions.

the guide is clear enough! 👍

# workspace

## isolated workspaces

🔗[related question on Stack Exchange](https://askubuntu.com/questions/305962/setting-to-only-show-applications-of-current-workspace-in-launcher)

1.install **dconf-editor**

```shell
sudo apt install dconf-editor
```

2.open the app and Navigate to **org > gnome > shell > extensions > dash-to-dock**
and check isolate-workspaces