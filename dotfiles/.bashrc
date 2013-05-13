# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return
export TERM=xterm-color

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

if [ -n "${SSH_CLIENT}" ]; then
	ipaddr=`echo ${SSH_CONNECTION} | awk '{print $3}'`
	PS1='[${ipaddr}] '$PS1
fi

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac
#
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red 
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White

bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red 
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White

undblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red 
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White

bakblk='\e[40m' # Black - Background
bakred='\e[41m' # Red 
bakgrn='\e[42m' # Green
bakylw='\e[44m' # Yellow
bakblu='\e[44m' # Blue
bakpur='\e[45m' # Purple
bakcyn='\e[46m' # Cyan
bakwht='\e[47m' # White

txtrst='\e[0m'  # Text Reset


#export PATH=$PATH:~/bin:~/bin/linux-infra/tools:~/bin/linux-infra/hooks:~/bin/arm-fsl-linux-gnueabi/bin:~/emacs/site-start.d/cflow/src/
export PATH=$PATH:~/bin:~/tools/linux-infra/tools:~/tools/linux-infra/hooks:~/swtools/android-sdk-linux/platform-tools:~/swtools/ImageMagick-6.8.0-8/utilities
#export PS1="\[\e[0m\][\[\e[0;32m\]\t \[\e[1;34m\]\u@\h \[\e[1;37m\]\w\[\e[0;33m\]$(__git_ps1 " (%s)")\[\e[0m\]]$ "
#export PS1="\[\e[0m\][\[\e[0;32m\]\t \[\e[1;34m\]\u@\h \[\e[1;37m\]\w\[\e[0;33m\]\[\e[0m\]]$ "
#export PS1="\[\e[0m\][\[\e[1;34m\]\u@\h \[\e[1;37m\]\w\[\e[0;33m\]$(__git_ps1 " (%s)")\[\e[0m\]]$ "
#export PS1="\[$txtrst\][\[$bldpur\]\u@\h \[$txtwht\]\w\[$ylw\]\[$txtrst\]]$ "

#export CROSS_COMPILE=arm-fsl-linux-gnueabi-
export TERM="xterm"
export CSCOPE_DB="cscope.out"
export HISTIGNORE="&:ls:[bf]g:exit:reset"

alias makearm='make ARCH=arm'
alias remake='make clean && make'
alias getmeuboot='cd ~/workshop/uboot-imx'
alias getmekernel='cd ~/workshop/linux'
alias getmeandroid='cd ~/workshop/android'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export ALTERNATE_EDITOR=""

#RED="\[\033[0;31m\]"
#YELLOW="\[\033[0;33m\]"
#GREEN="\[\033[0;32m\]"
#BLUE="\[\033[0;34m\]"
#LIGHT_RED="\[\033[1;31m\]"
#LIGHT_GREEN="\[\033[1;32m\]"
#WHITE="\[\033[1;37m\]"
#LIGHT_GRAY="\[\033[0;37m\]"
#COLOR_NONE="\[\e[0m\]"
#
#function parse_git_branch {
#	git rev-parse --git-dir &> /dev/null
#	git_status="$(git status 2> /dev/null)"
#	branch_pattern="^# On branch ([^${IFS}]*)"
#	detached_branch_pattern="# Not currently on any branch"
#	remote_pattern="# Your branch is (.*) of"
#	diverge_pattern="# Your branch and (.*) have diverged"
#	if [[ ${git_status}} =~ "Changed but not updated" ]]; then
#		#state="${RED}⚡"
#		state="⚡"
#	fi
#	# add an else if or two here if you want to get more specific
#	if [[ ${git_status} =~ ${remote_pattern} ]]; then
#		if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
#			#remote="${YELLOW}↑"
#			remote="↑"
#		else
#			#remote="${YELLOW}↓"
#			remote="↓"
#		fi
#	fi
#	if [[ ${git_status} =~ ${diverge_pattern} ]]; then
#		#remote="${YELLOW}↕"
#		remote="↕"
#	fi
#	if [[ ${git_status} =~ ${branch_pattern} ]]; then
#		branch=${BASH_REMATCH[1]}
#	elif [[ ${git_status} =~ ${detached_branch_pattern} ]]; then
#		branch="${YELLOW}NO BRANCH"
#	fi
#
#	if [[ ${#state} -gt "0" || ${#remote} -gt "0" ]]; then
#		s=" "
#	fi
#
#	echo "${branch}${s}${remote}${state}"
#}
#
#function prompt_func() {
#	git rev-parse --git-dir > /dev/null 2>&1
#	if [ $? -eq 0 ]; then
#		prompt='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] [$(parse_git_branch)]'
#		if [ -n $ipaddr ]; then
#			PS1="[$ipaddr] ${prompt}$ "
#		else
#			PS1="${prompt}$ "
#		fi
#	else
#		PS1=$PSAVE
#	fi
#}
#
#export PSAVE=$PS1
#
#PROMPT_COMMAND=prompt_func

# Auto-screen invocation. see: http://taint.org/wk/RemoteLoginAutoScreen
# if we're coming from a remote SSH connection, in an interactive session
# then automatically put us into a screen(1) session. Only try once --
# if $STARTED_SCREEN is set, don't try it again, to avoid looping 
# if screen fails for some reason.
if [ "$PS1" != "" -a "${STARTED_SCREEN:-x}" = x -a "${SSH_TTY:-x}" != x ]; then
	STARTED_SCREEN=1
	export STARTED_SCREEN
	[ -d $HOME/logs/screen-logs ] || mkdir -p $HOME/logs/screen-logs
	sleep 1
	screen -RR && exit 0
	# normally, execution of this rc script ends here...
	echo "Screen failed! continuing with normal bash startup"
fi
# end of auto-screen snippet

if [ -e "%HOME/cronlogs/offlineimap.log" ]; then
	alias newmail='grep Copy $HOME/cronlogs/offlineimap.log'
fi

export HISTIGNORE="&:ls:[bf]g:exit:reset"

export PATH=$PATH:/sbin:/usr/bin:/usr/sbin


