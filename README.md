##  About

Here lies my sway config file along with waybar, rofi and sworkstyle. You can also find here all my favourite wallpapers which I use in my system.

## &nbsp;&nbsp;Preview

![](./img/screen.png)

![](./img/powermenu.png)

![](./img/launcher.png)

![](./img/out.png)

## &nbsp;&nbsp;Features

- Easy customization via `make.conf`
- Help menus for shortcuts in shutdown and screenshot modes
- Screenshots + screen recording
- Dynamic workspaces in bar via sworkstyle
- Custom themes support


## &nbsp;&nbsp;Quick start

Before starting an installation check whether you do have all necessary dependencies via `make check` and install those if you don't.

**Attention: Make sure that you have backup of the following directories, cause they will be replaced with current config:**
- ${HOME}/.config/sway
- ${HOME}/.config/waybar
- ${HOME}/.config/rofi
- ${HOME}/.config/sworkstyle
- ${HOME}/.config/wallpapers

Before running `make` you must remove abovementioned directories by yourself or with help of `make clean`.

```sh
	git clone https://github.com/VasKho/sway-setup
	git submodule update --init --recursive
	make
```


## &nbsp;&nbsp;Configuration

This repo contains `make.conf` file which is used to configure some variables during installation. All of them are listed in it. I've tried as hard as I could to make their names such as to make it easy to guess their meaning, so feel free to make little adjustments in this config via them.

## 󰌌&nbsp;&nbsp;Default mappings

| Shortcut                | Function                                 |
|:-----------------------:|:----------------------------------------:|
| `Super+<arrows>`        | Move focus among windows                 |
| `Super+Shift+c`         | Reload config                            |
| `Super+Enter`           | Run terminal                             |
| `Super+Shift+q`         | Kill active window                       |
| `Super+Shift+Space`     | Toggle floating mode for active window   |
| `Super+x`               | Run launcher                             |
| `Super+p`               | Open clipboard                           |
| `Super+Shift+p`         | Open clipboard for deleting              |
| `Super+f`               | Toggle fullscreen mode for active window |
| `Super+<number>`        | Change workspace (from 1 to 10)          |
| `Super+Shift+<number>`  | Move window to workspace                 |
| `Super+Shift+r`         | Start screen recording                   |
| `Super+Escape`          | Stop screen recording                    |
| `Super+m`               | Toggle messenger                         |
| `Super+Shift+e`         | Open powermenu                           |
| `Print`                 | Open screenshot menu                     |
| `XF86AudioMute`         | Mute audio                               |
| `XF86AudioMicMute`      | Mute micro                               |
| `XF86AudioRaiseVolume`  | Raise volume                             |
| `XF86AudioLowerVolume`  | Lower volume                             |
| `XF86MonBrightnessUp`   | Raise brightness                         |
| `XF86MonBrightnessDown` | Lower brightness                         |
| `XF86AudioPlay`         | Toggle audio playing                     |
| `XF86AudioNext`         | Next song                                |
| `XF86AudioPrev`         | Previous song                            |

This table isn't contain powermenu and screenshot shortcuts because you can find them in their menus.
