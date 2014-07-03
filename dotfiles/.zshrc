
# Skip all this for non-interative shells
[[ -z "$PS1" ]] && return

# Set prompt (white and purple, nothing too fancy)
#PS1=$'%{\e[0;37m%}%B%*%b %{\e[0;35m%}%m:%{\e[0;37m%}%~ %(!.#.>) %{\e[00m%}'
# Fancier prompt
PS1=$'%F{def}%(?..%B%K{red}[%?]%K{def}%b )%(1j.%b%K{yel}%F{bla}%jJ%F{def}%K{def} .)%F{white}%B%*%b %F{m}%m:%F{white}%~ %(!.#.>) %F{def}' 

if [[ -x $(which vim) ]]
then
    export EDITOR="vim"
    export USE_EDITOR=$EDITOR
    export VISUAL=$EDITOR
fi

export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd ..:cd..:cd -"
export HISTSIZE=25000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Say how long a command took, if it took more than 30 seconds
export REPORTTIME=30

# Zsh spelling correction options
#setopt CORRECT
#setopt DVORACK

# Prompts for confirmation after 'rm *' etc
# Helps avoid mistakes like 'rm * o' when 'rm *.o' was intended
setopt RM_STAR_WAIT

# Background processes aren't killed on exit of shell
#setopt AUTO_CONTINUE

# Don't write over existing files with >, use >! instead
setopt NOCLOBBER

# Don't nice background processes
#setopt NO_BG_NICE

# Watch other user login/out
#watch=notme
#export LOGCHECK=60

# Enable color support of ls
if [[ "$TERM" != "dumb" ]]; then
    if [[ -x `which dircolors` ]]; then
        eval `dircolors -b`
        alias 'ls=ls --color=auto'
    fi
fi

export TIME_STYLE="long-iso"

# Short command aliases
alias 'ls=ls --color'
alias 'la=ls -A'
alias 'll=ls -l'
alias 'grep=grep --color'

export PATH=/bin:/usr/bin:/usr/local/bin
export PATH=$PATH:$HOME/bin

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.zsh

if [ -e "$HOME/.mintty/sol.dark" ]; then
    source "$HOME/.mintty/sol.dark"
fi
