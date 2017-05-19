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
plugins=(git gitfast git-prompt taskwarrior tmux)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


# Here comes some aliases
# enable aliases in sudo mode http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias backup="~/bin/backup.sh"
alias dcl="docker-compose logs -f"
alias dl="docker logs -f"
alias f="fzf-tmux --multi --reverse -h 80%"
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
alias vf='nvim $(f)' #open files in vim using fzf for search
alias wfl='nmcli dev wifi list'
alias wfc='nmcli dev wifi connect'

# Taskwarrior
alias ts=tasksh
alias tct='task context today && task'
alias tcw='task context work && task'
alias tcp='task context projects && task'
alias tcn='task context next && task'
alias tcd='task context delegate && task'
alias tcx='task context none && task'

# Docker
alias d=docker
alias dps="docker ps"
alias dc=docker-compose

# GIT
# alias g=git
# alias ga="git add"
# alias gaa="git add -all"
# alias gb="git branch"
# alias gc="git commit"
# alias gca="git commit --amend"
# alias gcm="git commit -m"
# alias gco="git checkout"
# alias gcm="git checkout master"
# alias gf="git fetch --all --prune"
# alias gp="git push"
# alias gl="git pull"
# alias glol="git log --graph --pretty = format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# alias glola="git log --graph --pretty = format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
# alias grhh="git reset HEAD --hard"
# alias gst="git status"

# Buffer
alias b="cd ~/Projects/Buffer/buffer-dev"
alias bw="cd ~/Projects/Buffer/buffer-dev/buffer-web"
alias bup="cd ~/Projects/Buffer/buffer-dev && ./dev up && cd -"
alias bstop="cd ~/Projects/Buffer/buffer-dev && ./dev stop && cd -"
alias bps="cd ~/Projects/Buffer/buffer-dev && ./dev ps && cd -"
alias bbc="npm run compile && cp lib/chronos.js ~/Projects/Buffer/buffer-dev/buffer-web/node_modules/@bufferapp/chronos/lib/chronos.js" #Develop Chronos

# Seneca
alias s="cd ~/Projects/Seneca/seneca-env"
alias sup="cd ~/Projects/Seneca/seneca-env && docker-compose up -d && docker ps && cd - "
alias sstop="cd ~/Projects/Seneca/seneca-env && docker-compose stop && cd -"

# My Theme
ZSH_THEME_GIT_PROMPT_PREFIX="%F{cyan} "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_BRANCH=""
ZSH_THEME_GIT_PROMPT_STAGED="%F{cyan}%{$bg[black]%} %{ %G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%F{cyan}%{$bg[black]%} %{ %G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%F{cyan}%{$bg[black]%} %{✚ %G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%F{cyan}%{$bg[black]%} %{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%F{cyan}%{$bg[black]%} %{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{cyan}%{$bg[black]%} %{ %G%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{$bg[cyan]%}%F{black} %~ %F{cyan}%{$bg[black]%}▓▒░ %F{cyan} $(git_super_status)%{$bg[default]%}%F{black}▓▒░
%{$bg[default]%}%F{cyan} %{$reset_color%} '
RPROMPT=''

# Local Path
export GOPATH="$HOME/Golang"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:./node_modules/.bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/nvm/init-nvm.sh
