# Fish greeting
set fish_greeting ""

# Editor
set -gx EDITOR nvim

# Format man pages
set -x MANROFFOPT -c
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Vim
fish_vi_key_bindings

function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

## Useful aliases
# Replace ls with eza
alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons' # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons' # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.="eza -a | grep -e '^\.'" # show only dotfiles

# Common use
alias please="sudo" # LOL
alias vim="nvim" # Best editor
alias tmnew="tmux new -s lilay" # My default tmux session
alias tmssh="tmux new -s ssh" # Session for ssh
alias tmcode="tmux new -s code" # Session for coding
alias fetch="fastfetch"
alias tm="tmux"
alias tma="tmux a -t"
alias c="clear"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias linutil="curl -fsSL https://christitus.com/linux | sh" # Cool utility
alias ports='nmap localhost'
alias hg='history | grep $1' # Search history
alias gs='git status'
alias gl='git log'

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

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
