# Elliot's zsh config file

# Load alias, funcs, and envvariables
[ -h "$HOME/.evars" ] && source "$HOME/.evars"
[ -h "$HOME/.alias" ] && source "$HOME/.alias"
[ -h "$HOME/.funcs" ] && source "$HOME/.funcs"
plugins=(git vi-mode)
[ -h "$ohzsh" ] && source "$ohzsh"

# Set zsh theme
ZSH_THEME="robbyrussell"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
#HISTFILE=~/.cache/history
HISTFILE=~/history

## History command configuration
#setopt extended_history       # record timestamp of command in HISTFILE
#setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
#setopt hist_ignore_dups       # ignore duplicated commands history list
#setopt hist_ignore_space      # ignore commands that start with space
#setopt hist_verify            # show command with history expansion to user before running it
#setopt inc_append_history     # add commands to HISTFILE in order of execution
#setopt share_history          # share command history data


# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vi'
 fi

export EDITOR='vim'

py3_base

# Build custom prompt
# Prompt docs: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Visual-effects
# Color legend: https://jonasjacek.github.io/colors/
export DARK_OLIVE_GREEN=191
export WHEAT=229
export RETURN_CODE="%(?.%F{green}√.%F{red}?%?)%f"
export CURR_DIR="%B%F{$WHEAT}%3~%f%b"
export UNAME_HOSTNAME="%F{DARK_OLIVE_GREEN}%n@%m%f"
export PRIVS="%(!.#.>)"
#export PROMPT="$RETURN_CODE $CURR_DIR $UNAME_HOSTNAME $PRIVS"
export PROMPT='%(?.%F{green}√.%F{red}?%?)%f|%F{191}%n@%m%f|%B%F{229}%3~%f%b|%(!.#.>) '

autoload bashcompinit
bashcompinit
#eval "$(register-python-argcomplete airflow)"
