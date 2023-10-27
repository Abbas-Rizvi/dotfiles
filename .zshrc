#------------------------------
# History stuff
#------------------------------
HISTFILE=~/.histfile
HISTSIZE=200000
SAVEHIST=50000

#------------------------------
# Variables
#------------------------------

export EDITOR=nvim

# Set DE to gnome for chromium
export LANG=en_US.UTF-8

# Browser
export BROWSER=librewolf

# I'm a cool kid now
alias vim=nvim

# my completions
fpath=("$HOME/.zcompletions" "$fpath[@]")

#------------------------------
# Keybindings
#------------------------------
bindkey -v
typeset -g -A key

bindkey '^[[3~' delete-char

# Up/Down line history arrow up/down
bindkey '^[[B' down-line-or-history
bindkey '^[[A' up-line-or-search

# Beginning of line also ctrl+e/a ctrl+up/down
bindkey "^E" end-of-line
bindkey "^A" beginning-of-line

# Ctrl+r history search
bindkey "^R" history-incremental-search-backward

# History search (usually up/down key)
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

#------------------------------
# History
#------------------------------
# setopt extended_history
# setopt inc_append_history
# setopt share_history
# setopt hist_ignore_dups
# setopt hist_ignore_all_dups
# setopt hist_expire_dups_first
# setopt hist_save_no_dups
# setopt hist_ignore_space
# setopt hist_verify


#------------------------------
# Alias stuff
#------------------------------
alias cat="bat"
alias ls="ls --color -F"
alias grep="grep --color=always"

# cockpit
alias cpf='PYTHONPATH=src python3 -m cockpit.print'
alias cpy='PYTHONPATH=src python3 -m cockpit.bridge'

# pacman
alias pacup='sudo pacman -Syu '
alias pacs='pacman -Ss'
alias pacins='sudo pacman -S'
alias pacr='sudo pacman -Rs'
alias pacq='pacman -Q'
alias pacu='sudo pacman -U'

# vim wiki
alias notes='cd ~/Notes && nvim -c VimwikiIndex'
alias diary='cd ~/Notes/diary/ && nvim -c VimwikiIndex -c VimwikiDiaryIndex'
alias vimwikis='vim -c VimwikiUISelect'

# moving in dirs
alias ..="cd .."

#------------------------------
# Comp stuff
#------------------------------
zmodload zsh/complist 
autoload -Uz compinit
compinit
zstyle :compinstall filename '${HOME}/.zshrc'

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

autoload -U incremental-complete-word predict-on
zle -N incremental-complete-word
zle -N predict-on
zle -N predict-off
bindkey '^X1' predict-on
bindkey '^X2' predict-off

#------------------------------
# Functions
#------------------------------
sprunge() {
        if [ -z "$1" ]
then
    curl -s -F 'sprunge=<-' http://sprunge.us
else
    if [ -z "$2" ]
    then
        echo -n "$1:"
        cat "$1" | "$0"
    else
        for i in "$@"
        do
            "$0" "$i"
        done
    fi
fi

}




#------------------------------
# Prompt
#------------------------------
setprompt () {
        # load some modules
        autoload -U zsh/terminfo # Used in the colour alias below
        # Use colorized output, necessary for prompts and completions.
        autoload -U colors && colors
        setopt prompt_subst

        # make some aliases for the colours: (coud use normal escap.seq's too)
        for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
                eval PR_$color='%{$fg[${(L)color}]%}'
        done
        PR_NO_COLOR="%{$terminfo[sgr0]%}"

        # Check the UID
        if [[ $UID -ge 1000 ]]; then # normal user
                eval PR_USER='${PR_GREEN}%n${PR_NO_COLOR}'
                eval PR_USER_OP='${PR_GREEN}%#${PR_NO_COLOR}'
        elif [[ $UID -eq 0 ]]; then # root
                eval PR_USER='${PR_RED}%n${PR_NO_COLOR}'
                eval PR_USER_OP='${PR_RED}%#${PR_NO_COLOR}'
        fi      

        # Check if we are on SSH or not  --{FIXME}--  always goes to |no SSH|
	if [[ -f /run/.toolboxenv && -f /run/.containerenv ]]; then
		local TOOLBOX_HOSTNAME=$(grep name /run/.containerenv | cut -d'"' -f 2)
                eval PR_HOST='${PR_ORANGE}⬢\ ${TOOLBOX_HOSTNAME}${PR_NO_COLOR}'
        elif [[ -z "$SSH_CLIENT"  ||  -z "$SSH2_CLIENT" ]]; then 
                eval PR_HOST='${PR_GREEN}%M${PR_NO_COLOR}' # no SSH
        else 
                eval PR_HOST='${PR_YELLOW}%M${PR_NO_COLOR}' #SSH
        fi
        # set the prompt
        PS1=$'${PR_CYAN}[${PR_USER}${PR_CYAN}@${PR_HOST}${PR_CYAN}][${PR_BLUE}%~${PR_CYAN}]${PR_USER_OP}'
        PS2=$'%_>'
}
setprompt

#------------------------------
# gpg-agent
#------------------------------
# # Start the gpg-agent if not already running
# if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
#   gpg-connect-agent /bye >/dev/null 2>&1
# fi
# 
# # Set SSH to use gpg-agent
# unset SSH_AGENT_PID
# if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#   export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
# fi
# 
# # Set GPG TTY
# GPG_TTY=$(tty)
# export GPG_TTY
# 
# # Refresh gpg-agent tty in case user switches into an X session
# gpg-connect-agent updatestartuptty /bye >/dev/null
#
#

# ---------- Aliases --------------------------------
export PATH="/home/abbas/scripts/statusbar:$PATH"




export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


bindkey -v

alias e="nvim "
alias sudo="sudo "
alias ufw="sudo ufw "
alias pacman="sudo pacman "
alias ytmp3="~/scripts/dl_music.sh "
alias hyprconf="nvim ~/.config/hypr/hyprland.conf"
alias neo="neofetch "
alias pdf="zathura "



alias mouse_tab="xbindkeys --poll-rc -f ~/.xbindkeysrc_mouse_btns"
#alias mouse_default="xbindkeys --poll-rc -f ~/.xbindkeysrc"
alias mouse_default="killall xbindkeys && sleep 2 && xbindkeys -f .xbindkeysrc"
