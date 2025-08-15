# menu-like completions
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) #show dotfiles

# ENVIRONMENT
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$CARGO_HOME/.local/bin"
export VISUAL=nvim
export EDITOR=nvim
export BROWSER=firefox

# History 
HISTSIZE="10000"
SAVEHIST="10000"

HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"



# ==== OPTIONS ====


setopt HIST_FCNTL_LOCK
unsetopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
unsetopt HIST_SAVE_NO_DUPS
unsetopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
# don't share history between sessions
unsetopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY
# show hidden files
setopt globdots

if [[ $options[zle] = on ]]; then
  eval "$(fzf --zsh)"
fi



# ==== CTRL + arrow ==== 

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word



# ==== vi mode ====

source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
ZVM_VI_HIGHLIGHT_FOREGROUND=black             
ZVM_VI_HIGHLIGHT_BACKGROUND=white
ZVM_VI_HIGHLIGHT_EXTRASTYLE=bold    

autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line



# visual selection mode
bindkey -v
export KEYTIMEOUT=0

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# edit line in nvim with ctrl-e
bindkey '^e' edit-command-line

# forward and backwords with ctrl
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word


# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey -v '^?' backward-delete-char


eval "$(zoxide init zsh)"
source <(fzf --zsh)


function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

if [[ $TERM != "dumb" ]]; then
  eval "$(starship init zsh)"
fi

eval "$(direnv hook zsh)"

alias -- cd=z
alias -- grep=rg
alias -- ls='eza -al'
alias -- t='tmux a || tmux new'
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
