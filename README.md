# LILAY Dotfiles

My **Fedora I3** & **neovim** dotfiles!

## Information

- **OS:** [Fedora Linux](https://fedoraproject.org/)
- **WM:** [I3](https://i3wm.org/)
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
