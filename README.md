# LILAY Dotfiles

My **I3wm** & **neovim** dotfiles!

## Information

- **OS:** [Arch](https://archlinux.org/)
- **WM:** [I3wm](https://i3wm.org/)
- **Terminal:** [Kitty](https://github.com/kovidgoyal/kitty)
- **Shell:** [zsh](https://www.zsh.org/)

## Preview

![Preview Image](https://github.com/li-lay/dotfiles/blob/main/Pictures/preview/preview.png)

## Installation

> [!TIP]
> I recommends you to backup your configs first to avoid any conflicts.

To use this dotfiles you need to install GNU [stow](https://www.gnu.org/software/stow/stow.html) for managing your symlinks.

```sh
sudo pacman -S stow
git clone git@github.com:li-lay/dotfiles.git
cd dotfiles
stow .
```
