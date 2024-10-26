# LILAY Dotfiles

The **Fedora Linux** & **neovim** dotfiles!

## Information

- **OS:** [Fedora Linux](https://fedoraproject.org/)
- **DE:** [Gnome](https://www.gnome.org/)
- **Terminal:** [BlackBox](https://gitlab.gnome.org/raggesilver/blackbox)
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
