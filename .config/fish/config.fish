# Start in home path
if status is-interactive
    cd $HOME
end

# Fish greeting
set fish_greeting ""

# Editor
set -gx EDITOR nvim

# Format man pages
set -x MANROFFOPT -c
set -x MANPAGER "sh -c 'col -bx | bat --theme='gruvbox-dark' -l man -p'"

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Vim
fish_vi_key_bindings

## Useful aliases
# Replace ls with eza
alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons' # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons' # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.="eza -a | grep -e '^\.'" # show only dotfiles

# Common use
alias please="sudo"
alias vim="nvim"
alias cat="bat --theme='gruvbox-dark'"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias grep='grep --color=auto'
alias linutil="curl -fsSL https://christitus.com/linux | sh" # Cool utility
alias ports='nmap localhost'
alias hg='history | grep $1' # Search history

# Git
alias gs='git status'
alias gl='git log --graph --pretty=oneline -n 10'
alias gco='git checkout'

# Fzf
eval "$(fzf --fish)"

# Zoxide
zoxide init --cmd cd fish | source

# Yazi File Manager
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Brew
fish_add_path /home/linuxbrew/.linuxbrew/bin

# dotnet tools
fish_add_path /home/lilay/.dotnet/tools
