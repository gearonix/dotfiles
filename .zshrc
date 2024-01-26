if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=gozilla

plugins=(
    git 
    z
    fzf-zsh-plugin
    zsh-autosuggestions 
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# cd
alias d="cd /home/grnx/dsk"
alias dsk="cd /home/grnx/dsk"
alias hub="cd /home/grnx/dsk/hub"
alias h="cd /home/grnx/dsk/hub"
alias cln="cd /home/grnx/dsk/cln"
alias prj='cd /home/grnx/dsk/prj/general'
alias dwl="cd /home/grnx/dwl"
alias tsh="cd /home/grnx/dsk/tsh"

# mv
alias clnmv='(){ mv "$1" /home/grnx/dsk/cln; }'
alias trashmv='(){ mv "$1" /home/grnx/dsk/trash; }'
alias svd='(){ cp -r "$1" /home/grnx/svd; }'

# helpers
alias unpack='(){ mv "$1"/* . && rm -rf "$1"; }'
alias mkd='(){mkdir "$1";cd "$1";}'
alias df='df -h | grep "/dev/sdc2"'
alias sysup="sudo apt update; sudo apt upgrade -y;"
alias duh='(){ du -h --max-depth=1 .;}'
alias c.='cd ..'
alias cl='clear'
alias rem='(){ sudo apt purge "$1"; sudo apt remove "$1"}'
alias reinstall='(){ rem "$1"; add "$1"}'
alias extr='tar -zxvf'
alias mk='mkdir'
alias add='sudo apt install'
alias ffind='find . -name'
alias s='sudo'
alias th='touch'
alias ca='cat'
alias l='(){cd "$1" && ls -a}'
alias lr='ls -tra'
alias q='exit'
alias systl="sudo systemctl"
alias off="shutdown now"
alias c='(){cd "$1"}'
alias r='(){ rm -rf "$1" && ls -a }'
alias reb='reboot'

# scripts
alias sc.clean-nodes="(){bash ~/scripts/clean-nodes.sh "$(pwd)";}" 
alias sc.inject-eslint="bash ~/scripts/inject-eslint.sh"

# extras
alias editrc='subl ~/.zshrc'
alias nf='neofetch'
alias xdg='xdg-open .'
alias scr="flameshot gui"
alias overkill='(){ kill-port ${1:-3000};}'
alias nid='ni -D'
alias nig='ni -g'
alias nung='nun -g'
alias nlist='na -g list'
alias loc='(){ google-chrome http://localhost:"${1:-3000}"; }'
alias locs='google-chrome http://localhost:6868'
alias github='google-chrome https://github.com/gearonix'
alias bgh='(){ google-chrome http://github.com/"${1}"/"${2}"; }'
alias bpm='(){ google-chrome http://npmjs.com/"${1}"/"${2}"; }'
alias b='(){ google-chrome https://"$1" }'
# alias n=nnn

# docker
alias d.ps='docker ps'
alias d.c='docker compose up'

clean-docker() {
  docker kill $(docker ps -a -q)
  docker rm -vf $(docker ps -aq)

  docker container prune
  docker system prune
  docker image prune
  docker volume prune
}

clear-docker() {
     docker rm -vf $(docker ps -aq)
}

# pms
clean-cache() {
    pnpm store prune
    yarn cache clean
    npm cache clean --force
    
}

# apps
tg() {
    telegram-desktop >/dev/null 2>&1 &
}

ws() {
    /home/grnx/dwl/webstorm/bin/webstorm.sh "$1" >/dev/null 2>&1 &
}

ch() {
    google-chrome "$1" >/dev/null 2>&1 &
}

# aliases
aliases() {
    if [ -f "$PWD/.aliasrc" ]; then
       source .aliasrc
    fi
}

aliases

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/home/grnx/.bun/_bun" ] && source "/home/grnx/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/grnx/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export NI_CONFIG_FILE="$HOME/.nirc"

### PATH configuration ###

# see https://github.com/nektos/act
export PATH="$PATH:$HOME/.act/bin"
export PATH=~/.npm-global/bin:$PATH
export PASTH="$HOME/.local/bin:$PATH"

export NNN_OPENER=subl


export NNN_PLUG='p:preview-tui'
export NNN_FIFO=/tmp/nnn.fifo

source $HOME/scripts/quitcd.zsh


# commented, due to bugs and slow load time in zsh

## NVM LAZY LOAD
## DUE TO SLOW STARTUP ON ZSH

# zstyle ':omz:plugins:nvm' lazy yes

# NVM_DIR="$HOME/.nvm"

# # Skip adding binaries if there is no node version installed yet
# if [ -d $NVM_DIR/versions/node ]; then
#   NODE_GLOBALS=(`find $NVM_DIR/versions/node -maxdepth 3 \( -type l -o -type f \) -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
# fi
# NODE_GLOBALS+=("nvm")

# load_nvm () {
#   # Unset placeholder functions
#   for cmd in "${NODE_GLOBALS[@]}"; do unset -f ${cmd} &>/dev/null; done

#   # Load NVM
#   [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

#   # (Optional) Set the version of node to use from ~/.nvmrc if available
#   nvm use 2> /dev/null 1>&2 || true

#   # Do not reload nvm again
#   export NVM_LOADED=1
# }

# for cmd in "${NODE_GLOBALS[@]}"; do
#   # Skip defining the function if the binary is already in the PATH
#   if ! which ${cmd} &>/dev/null; then
#     eval "${cmd}() { unset -f ${cmd} &>/dev/null; [ -z \${NVM_LOADED+x} ] && load_nvm; ${cmd} \$@; }"
#   fi
# done
