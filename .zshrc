# History files
HISTSIZE=10000
SAVEHIST=20000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# auto cd into dir
setopt autocd extendedglob

# vim hotkey on cmd line
#bindkey -v


#Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


## Enable colors and change prompt:
autoload -U colors && colors	# Load colors
# Basic auto/tab complete:
autoload -U compinit
#zstyle ':completion:*' menu select

zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'


zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.


setopt interactive_comments

# Prompt with git branch detection
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '%b'

precmd() {
    vcs_info
    local git_branch="${vcs_info_msg_0_}"

    # Note: %F sets fg color, %f resets
    # %B sets bold, %b removes bold
    #
    if [[ -n ${git_branch} ]]; then

        # Construct PS1 with git_branch only when it's available
        PS1="%B%F{red}[%F{yellow}%n%F{green}@%F{blue}%M %F{magenta}%~%F{red}]%f %b%F{green}(${git_branch})%f %B$%b "

    else

        PS1="%B%F{red}[%F{yellow}%n%F{green}@%F{blue}%M %F{magenta}%~%F{red}]%f $ "

    fi
}

setopt prompt_subst




# Coloured file output
# alias ls='ls --color=auto'


# Aliases

	#yt="yt-dlp --embed-metadata -i" \
	#yta="yt -x -f bestaudio/best" \
	#ytt="yt --skip-download --write-thumbnail" \

alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	bc="bc -ql" \
	rsync="rsync -vrPlu" \
	mkd="mkdir -pv" \
	ffmpeg="ffmpeg -hide_banner" \
	e="nvim " \
	pacin="sudo pacman -S " \
	sudo="sudo " \
	pdf="zathura " \
	ytmp3="~/scripts/dl_music.sh "  \
	gcl="git clone "

# Colorize commands when possible.
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	la='ls -la --color=auto -lh' \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi" \
	ip="ip -color=auto" \
	search="~/scripts/search.sh "

alias conda-init="source /opt/miniconda3/etc/profile.d/conda.sh"
