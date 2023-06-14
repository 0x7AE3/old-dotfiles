export ZSH="$HOME/.oh-my-zsh"

# history
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt INC_APPEND_HISTORY
setopt inc_append_history
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS


ZSH_THEME="gentoo"
DISABLE_UPDATE_PROMPT="true"

export NVM_LAZY_LOAD=true
# plugins=(git command-not-found fzf zsh-syntax-highlighting zsh-autosuggestions copypath copyfile zsh-nvm)

# zsh-syntax-highlighting
source $ZSH/oh-my-zsh.sh

# fzf
if [[ $OSTYPE == 'darwin'* ]]; then
  export FZF_BASE=$(brew --prefix)/opt/fzf/install
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# covered by zsh-nvm
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias nv="nvim"
alias win="cd /mnt/c/Users/anees"
# alias hidegit="git config --add oh-my-zsh.hide-status 1 && git config --add oh-my-zsh.hide-dirty 1"
export PATH=/usr/local/smlnj/bin:"$PATH"

env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env
