# Remove welcome message
set fish_greeting ""

# Enable Vim
# fish_vi_key_bindings

# Add path
fish_add_path ~/.local/bin
fish_add_path /home/linuxbrew/.linuxbrew/bin

#Alias
alias tmnew="tmux new -s lilay"
alias tmssh="tmux new -s ssh"
alias tmarch="tmux new -s arch"
alias vim="nvim"
alias fetch="fastfetch"
alias tm="tmux"
alias tma="tmux a -t"
alias cat="bat"
alias c="clear"
alias ls="lsd"
alias lsa="lsd -a"

zoxide init --cmd cd fish | source
