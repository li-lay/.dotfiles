# Remove welcome message
set fish_greeting ""

afetch

# Enable Vim
# fish_vi_key_bindings

# Add path
fish_add_path ~/.local/bin
fish_add_path /home/linuxbrew/.linuxbrew/bin

#Alias
alias tmnew="tmux new -s lilay"
alias tmssh="tmux new -s ssh"
alias vim="nvim"
alias fetch="fastfetch"
alias tm="tmux"
alias tma="tmux a -t"
alias cat="bat"
alias c="clear"
alias ls="lsd"
alias lsa="lsd -a"

zoxide init --cmd cd fish | source

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
