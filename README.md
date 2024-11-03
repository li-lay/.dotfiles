# LILAY Dotfiles

My **I3wm / Hyprland** & **neovim** dotfiles!

## Information

- **OS:** Fedora/Arch
- **WM:** I3wm/Hyprland
- **Terminal:** [Kitty](https://github.com/kovidgoyal/kitty)
- **Shell:** [fish](https://fishshell.com/)

## Automatic installation

To use this dotfiles you need to install GNU [stow](https://www.gnu.org/software/stow/stow.html) for managing your symlinks.

```sh
sudo dnf install stow -y
git clone git@github.com:li-lay/dotfiles.git
cd dotfiles
stow .
```

> Note: Ensure you've removed all the local configs first to prevent override.
