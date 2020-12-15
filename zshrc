# Performance profiling

# zmodload zsh/zprof
# setopt promptsubst

export ZSH="/home/kyle/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"


plugins=(
  git
  colorize
  colored-man-pages
  ng
  tmux
  zsh_reload
)

# TODO: investigate the vi-mode plugin

ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export NODE_OPTIONS=--max_old_space_size=4096
export GOOGLE_APPLICATION_CREDENTIALS="/Users/kylemeenehan/credentials/gcp-1.json"
export SHELL="/usr/bin/zsh"
export GOBIN=/usr/local/go/bin

path=(
  $path
  $HOME/bin
  /usr/local/bin
  $HOME/Android/Sdk/platform-tools
  $HOME/Android/Sdk/tools
  $HOME/Android/Sdk/build-tools/27.0.3
  $HOME/Library/flutter/bin
  $HOME/anaconda3/bin
  $HOME/.sonar-scanner/bin
  $HOME/.local/bin
  $HOME/bin/handy-scripts
  $HOME/lib/flutter/bin
  $HOME/lib/flutter/bin
  /sbin
  "/miniconda3/bin:$HOME/.pub-cache/bin"
  "/usr/local/lib/node_modules"
  /usr/local/go/bin
  /snap/bin
  /usr/local/texlive/2019/bin/x86_64-linux
  $ANDROID_HOME/emulator:$ANDROID_HOME/tools
#  /Applications/kitty.app/Contents/MacOS
)

export ANDROID_HOME=/home/kyle/Android/Sdk
# export DOCKER_HOST=unix:///run/user/1000/docker.sock

alias python=python3
# alias open=nautilus # TODO: make this mac safe
alias clean-branches='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias ds='du -sh */ | sort -h'
# alias git=hub
alias coffee='caffeinate -t 7200'
alias spelltex='aspell check --mode=tex'
alias refresh-input='sudo udevadm trigger'
# alias chrome-arlo='google-chrome --disable-web-security --user-data-dir="/home/kyle/.arlo/chrome-data"'
alias chrome-arlo='open -a "Google Chrome" --args --disable-web-security --user-data-dir=$HOME/.arlo/chrome'
export tlmgr=/usr/local/texlive/2019/bin/x86_64-linux/tlmgr

# eval "$(dircolors ~/.dircolors)"

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="/home/kyle/.sdkman"
# [[ -s "/home/kyle/.sdkman/bin/sdkman-init.sh" ]] && source "/home/kyle/.sdkman/bin/sdkman-init.sh"

export HOMEBREW_NO_AUTO_UPDATE=1

eval $(thefuck --alias)

# vi mode
bindkey -v

# Performance profiling
# zprof
