# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/anaconda3/bin:$PATH
export PYTHONPATH=$PYTHONPATH:/home/elliot/Code/repos/jpl_internship_final_presentation/code/TutorialNotebooks/python
export JUPYTER_PATH=:$JUPYTER_PATH:/home/elliot/Code/repos/jpl_internship_final_presentation/code/TutorialNotebooks/python

export TERM="xterm-256color"

 #Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Vi mode
bindkey -v

ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(virtualenv virtualenvwrapper git)
plugins=(git github)
source $ZSH/oh-my-zsh.sh

alias py3="python3"
alias py2="python"
alias py3_env="conda activate py3"
alias py2_env="conda activate py2"
alias nb="conda activate py3; jupyter notebook"
alias vpn="sudo openvpn nl-07.protonvpn.com.udp.ovpn"
alias szsh="source ~/.zshrc"
alias vzsh="vi ~/.zshrc"
alias vvrc="vi ~/.vimrc"
alias cpy="xclip -selection clipboard"
alias pst="xclip -selection clipboard -o"


# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!

__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/trapp/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/trapp/anaconda3/etc/profile.d/conda.sh" ]; then
# . "/home/trapp/anaconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/trapp/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

set clipboard=unnamedplus

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/elliot/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/elliot/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/elliot/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/elliot/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

py3_env
