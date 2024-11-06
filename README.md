# LILAY Dotfiles

My **I3wm / Hyprland** & **neovim** dotfiles!

## Information

- **OS:** [Arch](https://archlinux.org/)
- **WM:** [I3wm](https://i3wm.org/)/[Hyprland](https://hyprland.org/)
- **Terminal:** [Kitty](https://github.com/kovidgoyal/kitty)
- **Shell:** [fish](https://fishshell.com/)

## Automatic installation

To use this dotfiles you need to install GNU [stow](https://www.gnu.org/software/stow/stow.html) for managing your symlinks.

```sh
sudo pacman -S stow
git clone git@github.com:li-lay/dotfiles.git
cd dotfiles
stow .
```

> Note: Ensure you've removed all the local configs first to prevent override.
