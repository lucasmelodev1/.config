# Aliases
alias ls='exa --icons'
alias cd='z'
alias nvimg='nvim --listen /tmp/godot.pipe'
alias godot='/home/lucas/Executables/Godot_v4.4.1-stable_linux.x86_64'

# Initialize zoxide
zoxide init fish | source

# Automatically start tmux if not already inside it
if type -q tmux
    if status is-interactive
        if test -z "$TMUX"
            if not string match -r 'screen|tmux' $TERM
                exec tmux
            end
        end
    end
end

# Add Go bin to PATH
set -Ux PATH $HOME/go/bin $PATH

set fish_greeting

fish_config theme choose Catppuccin\ Mocha
