# auto start tmux
ZSH_TMUX_AUTOSTART="false"
# if [ "$TMUX" = "" ]; then tmux; fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

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
plugins=(git gitfast git-prompt taskwarrior tmux kubectl ssh-agent)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8
export EDITOR='nvim'
export NOTES_PATH=~/Dropbox/Documents/notes


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Here comes some aliases
alias diskspace=jdiskreport

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
alias vs='nvim -S'
alias vf='nvim `fzf --preview="head -100 {}" --preview-window=right:70%:wrap`' #open files in vim using fzf for search
alias vcs='rm -rf ~/.local/share/nvim/swap' #clenaup swap files
alias wfl='nmcli dev wifi list'
alias wfc='nmcli dev wifi connect'
alias wfu='nmcli con up'

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
export BUFFER_VM=192.168.18.44
alias bssh="ssh fwd@$BUFFER_VM"
alias b="cd ~/Buffer/buffer-dev"
alias bw="cd ~/Buffer/buffer-dev/buffer-web"
alias bup="cd ~/Buffer/buffer-dev && ./dev up && cd -"
alias aup="cd ~/Buffer/buffer-dev && ./dev up session-service-dev authentication-service-dev login-dev account analyze && cd -"
alias bstop="cd ~/Buffer/buffer-dev && ./dev stop && cd -"
alias bps="cd ~/Buffer/buffer-dev && ./dev ps && cd -"
alias bbc="npm run compile && cp lib/chronos.js ~/Buffer/buffer-dev/buffer-web/node_modules/@bufferapp/chronos/lib/chronos.js" #Develop Chronos
alias bba="npm test && gulp webpack --app" #run front-end tests and build app
alias bbo="npm test && gulp webpack --app overviewTab" # run front-end tests and build Overview Tab
alias bboc="npm test && gulp webpack --app overviewTab && gaa && gcmsg 'bundle overviewTab'" # run front-end tests,build Overview Tab, and commit it
alias adev="git rev-parse --abbrev-ref HEAD | tr / - | awk '{print \"https://\"\$1\"-analyze.dev.buffer.com/\"}' | xargs chromium"

# Yarn
alias y="yarn"
alias yt="yarn test"
alias ytu="yarn test-update"

#Jest
alias j="jest"
alias jw="jest --watch"

# Buffer quality build, this build the front-end app only if linter and tests are sucesful
alias bqb="glj && bba"
#
# Buffer Build Oveview Secure
alias bbos="glj && bba overviewTab"
alias bbosc="glj && bba overviewTab && gaa && gcmsg 'bundle overviewTab'"

# fantasy consoles
alias p8="~/fantasy_cosole/pico-8/pico8"

# My Theme
ZSH_THEME_GIT_PROMPT_PREFIX="%F{cyan}ᚬ "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_BRANCH=""
ZSH_THEME_GIT_PROMPT_STAGED="%F{cyan}%{$bg[black]%} %{✦  %G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%F{red}%{$bg[black]%} %{⍉  %G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%F{yellow}%{$bg[black]%} %{✚ %G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%F{white}%{$bg[black]%} %{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%F{white}%{$bg[black]%} %{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{white}%{$bg[black]%} %{… %G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{cyan}%{$bg[black]%} "

if [[ -n $SSH_CONNECTION ]]; then
    PROMPT_LOGO=">>"
  else
    PROMPT_LOGO="λ"
fi

PROMPT='%{$bg[cyan]%}%F{black} %~ %F{cyan}%{$bg[black]%}▓▒░ $(git_super_status)%{$bg[default]%}%F{black}▓▒░
%{$bg[default]%}%F{cyan} $PROMPT_LOGO%{$reset_color%} '
RPROMPT=''

# Local Path
export GOPATH="$HOME/Golang"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:~/.gem/ruby/2.4.0/bin"
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:~/.config/composer/vendor/bin"
export PATH="$PATH:~/.composer/vendor/bin/"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# needed to start tmux on remote servers
[[ $TERM == xterm-termite ]] && export TERM=xterm

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
