# Remove welcome message
set fish_greeting ""

afetch

# Enable Vim
# fish_vi_key_bindings

# Add path
fish_add_path ~/.local/bin
fish_add_path /home/linuxbrew/.linuxbrew/bin
fish_add_path /home/lilay/Documents/Projects/cpp_build_tool

#Alias
alias tmnew="tmux new -s lilay"
alias tmssh="tmux new -s ssh"
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

function brightness
    if not set -q argv[1]
        echo "Usage: brightness <value>"
        return 1
    end
    
    set value (math "max(0.5, min(1, $argv[1]))") # Clamp the value between 0.5 and 1
    xrandr --output DVI-D-0 --brightness $value
end
