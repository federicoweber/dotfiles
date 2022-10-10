# auto start tmux
ZSH_TMUX_AUTOSTART="false"
# if [ "$TMUX" = "" ]; then tmux; fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

DEFAULT_USER="fwd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gitfast git-prompt tmux kubectl ssh-agent command-time)

source $ZSH/oh-my-zsh.sh

# command-time config
# # Message to display (set to "" for disable).
ZSH_COMMAND_TIME_MSG="took %s"

# Message color.
ZSH_COMMAND_TIME_COLOR="yellow"

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
alias f='fzf-tmux --multi --reverse -h 80% '
alias gip="~/bin/ip.sh"
alias lip="~/bin/locateip.sh"
alias r=ranger
alias sudo="sudo "
alias t=tmux
alias tm=tmux
alias tmk='tmux kill-server'
alias tmks='tmux kill-session -t '
alias v=~/apps/nvim.appimage
alias vs='~/apps/nvim.appimage -S'
alias vf='~/apps/nvim.appimage `fzf --preview="head -100 {}" --preview-window=right:70%:wrap`' #open files in vim using fzf for search
alias vcs='rm -rf ~/.local/share/nvim/swap' #clenaup swap files

# Docker
alias d=docker
alias dps="docker ps"
alias dc=docker-compose
alias dpunit="docker_phpunit_test.sh";

# Kubectl
alias k=kubectl

# GIT
# amend and push last commit
alias !gc="git commit --amend --no-edit && gp -f"
alias gmc="git branch | grep -E 'main|master' -m 1 | awk '{print $1}' | xargs git checkout | git fetch && git pull"
alias gclean="gb | grep -v main | xargs git branch -d"
alias gfclean="gb | grep -v main | xargs git branch -D"

# Yarn
alias y="yarn"
alias yt="yarn test"
alias ytu="yarn test-update"

#Jest
alias j="jest"
alias jw="jest --watch"

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
export PATH="$PATH:/home/$USER/.local/bin"
export PATH=/usr/local/bin:$PATH
export PATH="/home/fwd/.deno/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# needed to start tmux on remote servers
[[ $TERM == xterm-termite ]] && export TERM=xterm

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# set browser for WSL
if grep -qi microsoft /proc/version; then
  export BROWSER=/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe
fi

# mcfly
eval "$(mcfly init zsh)"
