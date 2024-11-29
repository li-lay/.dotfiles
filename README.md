# LILAY Dotfiles

My **I3wm / Hyprland** & **neovim** dotfiles!

## Information

- **OS:** [Arch](https://archlinux.org/)
- **WM:** [I3wm](https://i3wm.org/)/[Hyprland](https://hyprland.org/)
- **Terminal:** [Kitty](https://github.com/kovidgoyal/kitty)
- **Shell:** [zsh](https://www.zsh.org/)

## Preview

![Preview Image](https://github.com/li-lay/dotfiles/blob/main/Pictures/preview/preview.png)

## Installation

First back up your configs.
> [!TIP]
> I recommends you to backup your configs first to avoid any conflicts. :)

```sh
mv .zshrc .zshrc.bak
mv .tmux.conf .tmux.conf.bak
mv .config/i3 .config/i3.bak
mv .config/hypr .config/hypr.bak
mv .config/nvim .config/nvim.bak
mv .config/kitty .config/kitty.bak
mv .config/polybar .config/polybar.bak
mv .config/waybar .config/waybar.bak
mv .config/rofi .config/rofi.bak
mv .config/dunst .config/dunst.bak
mv .config/yazi .config/yazi.bak
mv .config/ranger .config/ranger.bak
mv .config/fastfetch .config/fastfetch.bak
```

To use this dotfiles you need to install GNU [stow](https://www.gnu.org/software/stow/stow.html) for managing your symlinks.

```sh
sudo pacman -S stow
git clone git@github.com:li-lay/dotfiles.git
cd dotfiles
stow .
```

