# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="steeef"

CASE_SENSITIVE="false"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Install zsh-autosuggestions and zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Plugins
plugins=(aliases vi-mode zoxide themes zsh-autosuggestions zsh-syntax-highlighting)

# VI mode
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
VI_MODE_SET_CURSOR=true

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export EDITOR="nvim"
export MANPAGER="nvim +Man!"

# History
HISTFILE=~/.history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Aliases
alias docker="podman"
alias db="distrobox"
alias please="sudo"
alias vim="nvim"
alias tmnew="tmux new -s lilay"
alias tmssh="tmux new -s ssh"
alias fetch="fastfetch"
alias tm="tmux"
alias tma="tmux a -t"
alias cat="bat"
alias c="clear"
alias ls="lsd"
alias lsa="lsd -a"

# Homebrew
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Shell Integration
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# pnpm
export PNPM_HOME="/home/lilay/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/home/lilay/.bun/_bun" ] && source "/home/lilay/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
