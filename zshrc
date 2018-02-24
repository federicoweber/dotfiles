# auto start tmux
ZSH_TMUX_AUTOSTART="false"
# if [ "$TMUX" = "" ]; then tmux; fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/fwd/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="lambda"

DEFAULT_USER="fwd"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gitfast git-prompt taskwarrior tmux kubectl)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8
export EDITOR='nvim'
export NOTES_PATH=~/Dropbox/Documents/notes

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
eval $(keychain --eval --quiet id_rsa)

# Here comes some aliases
alias diskspace=jdiskreport

# VPN
alias nordup="sudo openvpn --config ~/vpn-configs/us1215.nordvpn.com.udp1194.ovpn \
  --auth-user-pass ~/vpn-configs/credentials.conf \
  --daemon --writepid ~/vpn-configs/nordvpn.pid"
alias norddown="sudo kill $(cat ~/vpn-configs/nordvpn.pid)"

# enable aliases in sudo mode http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias backup="~/bin/backup.sh"
alias classname="xprop|grep WM_CLASS"
alias dcl="docker-compose logs -f"
alias dl="docker logs -f"
alias f='fzf-tmux --multi --reverse -h 80% '
alias gip="~/bin/ip.sh"
alias lip="~/bin/locateip.sh"
alias n="cd $NOTES_PATH"
alias na="~/bin/notes"
alias r=ranger
alias sudo="sudo "
alias tm=tmux
alias tmk='tmux kill-server'
alias tmks='tmux kill-session -t '
alias v=nvim
alias vi=nvim
alias vim=nvim
alias vs='nvim -S'
alias vf='vim `fzf --preview="head -100 {}" --preview-window=right:70%:wrap`' #open files in vim using fzf for search
alias wfl='nmcli dev wifi list'
alias wfc='nmcli dev wifi connect'
alias wfu='nmcli con up'

# Taskwarrior
alias t='clear && task'
alias ts='t +ACTIVE stop && task'
alias tc='t context'
alias ta='t add'
alias tct='clear && task context today && t'
alias tctw='clear && task context today_work && t'
alias tctl='clear && task context today_life && t'
alias tcw='clear && task context week && t'
alias tcww='clear && task context week_work && t'
alias tcwl='clear && task context week_life && t'
alias tcx='clear && task context none && t'

# Timewarrior
alias tw='timew'

# Docker
alias d=docker
alias dps="docker ps"
alias dc=docker-compose

# Kubectl
alias k=kubectl

# GIT
# Lint all changed js and jsx in a branch
alias glj="git diff --name-only master... | grep -v bundle | grep .jsx*$ | xargs eslint -c .eslintrc.json --stdin --quiet -f table"
# amend and push last commit
alias !gc="git commit --amend --no-edit && gp -f"

# Buffer
alias b="cd ~/Projects/Buffer/buffer-dev"
alias bw="cd ~/Projects/Buffer/buffer-dev/buffer-web"
alias bup="cd ~/Projects/Buffer/buffer-dev && ./dev up && cd -"
alias aup="cd ~/Projects/Buffer/buffer-dev && ./dev up session-service login analyze && cd -"
alias bstop="cd ~/Projects/Buffer/buffer-dev && ./dev stop && cd -"
alias bps="cd ~/Projects/Buffer/buffer-dev && ./dev ps && cd -"
alias bbc="npm run compile && cp lib/chronos.js ~/Projects/Buffer/buffer-dev/buffer-web/node_modules/@bufferapp/chronos/lib/chronos.js" #Develop Chronos
alias bba="npm test && gulp webpack --app" #run front-end tests and build app
alias bbo="npm test && gulp webpack --app overviewTab" # run front-end tests and build Overview Tab
alias bboc="npm test && gulp webpack --app overviewTab && gaa && gcmsg 'bundle overviewTab'" # run front-end tests,build Overview Tab, and commit it
alias adev="git rev-parse --abbrev-ref HEAD | tr / - | awk '{print \"https://\"\$1\"-analyze.dev.buffer.com/\"}' | xargs chromium"

# Yarn testing
alias yt="yarn test"
alias ytu="yarn test-update"

# Buffer quality build, this build the front-end app only if linter and tests are sucesful
alias bqb="glj && bba"
#
# Buffer Build Oveview Secure
alias bbos="glj && bba overviewTab"
alias bbosc="glj && bba overviewTab && gaa && gcmsg 'bundle overviewTab'"

# Seneca
alias s="cd ~/Projects/Seneca/seneca-env"
alias sup="cd ~/Projects/Seneca/seneca-env && docker-compose up -d && docker ps && cd - "
alias sstop="cd ~/Projects/Seneca/seneca-env && docker-compose stop && cd -"

# fantasy consoles
alias p8="~/fantasy_cosole/pico-8/pico8"

# My Theme
ZSH_THEME_GIT_PROMPT_PREFIX="%F{blue} "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_BRANCH=""
ZSH_THEME_GIT_PROMPT_STAGED="%F{green}%{$bg[black]%} %{ %G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%F{red}%{$bg[black]%} %{ %G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%F{yellow}%{$bg[black]%} %{✚ %G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%F{white}%{$bg[black]%} %{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%F{white}%{$bg[black]%} %{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{white}%{$bg[black]%} %{ %G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{blue}%{$bg[black]%} "

PROMPT='%{$bg[green]%}%F{black} %~ %F{green}%{$bg[black]%}▓▒░ $(git_super_status)%{$bg[default]%}%F{black}▓▒░
%{$bg[default]%}%F{green} %{$reset_color%} '
RPROMPT=''

# Local Path
export GOPATH="$HOME/Golang"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/home/fwd/.gem/ruby/2.4.0/bin"
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:~/.config/composer/vendor/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/nvm/init-nvm.sh
