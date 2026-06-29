# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lucas/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH=$PATH:$HOME/executables
export PATH=$PATH:$HOME/go/bin

. $HOME/.config/bash/init.sh

alias nvim=$HOME/executables/nvim-linux-x86_64.appimage

# Auto-start tmux
if [ -z "$TMUX" ] && [ -n "$PS1" ]; then
  tmux attach -t main || tmux new -s main
fi

# Starship prompt
eval "$(starship init zsh)"
