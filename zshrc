# auto start tmux
ZSH_TMUX_AUTOSTART="false"
# if [ "$TMUX" = "" ]; then tmux; fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# My Theme
ZSH_THEME="spaceship"
SPACESHIP_HOST_SHOW="true"

DEFAULT_USER="fwd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gitfast tmux kubectl ssh-agent gcloud)

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
alias f='fzf-tmux --multi --reverse -h 80% '
alias gip="~/bin/ip.sh"
alias lip="~/bin/locateip.sh"
alias r=ranger
alias sudo="sudo "
alias t=tmux
alias tm=tmux
alias tmk='tmux kill-server'
alias tmks='tmux kill-session -t '

# vim
if [[ $OSTYPE == 'darwin'* ]]; then
  alias v=/opt/homebrew/bin/nvim
  alias vs='/opt/homebrew/bin/nvim -S'
  alias vf='/opt/homebrew/bin/nvim `fzf --preview="head -100 {}" --preview-window=right:70%:wrap`' #open files in vim using fzf for search
  alias vcs='rm -rf /opt/homebrew/bin/nvim/nvim/swap' #clenaup swap files
else
  alias v=~/apps/nvim.appimage
  alias vs='~/apps/nvim.appimage -S'
  alias vf='~/apps/nvim.appimage `fzf --preview="head -100 {}" --preview-window=right:70%:wrap`' #open files in vim using fzf for search
  alias vcs='rm -rf ~/.local/share/nvim/swap' #clenaup swap files
fi

# Docker
alias d=docker
alias dps="docker ps"
alias dc=docker-compose
alias dpunit="docker_phpunit_test.sh";
alias dka="docker stop $(docker ps -a -q)" # stop all containers

# Kubectl
alias k=kubectl

# GIT
# amend and push last commit
alias !gc="git commit --amend --no-edit && gp -f"
alias gcm="git branch | grep -E 'main|master' -m 1 | awk '{print $1}' | xargs git checkout | git fetch && git pull"
alias gclean="git branch | grep -v main | xargs git branch -d"
alias gfclean="git branch | grep -v main | xargs git branch -D"
alias gb="git --no-pager branch"

#Jest
alias j="jest"
alias jw="jest --watch"

# Pyenv configuration - needs to be early in the file
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

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

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# use nvm version for the given folder
load-nvmrc() {
  if ! command -v nvm > /dev/null 2>&1; then
    echo "nvm is not installed. Skipping nvm use."
    return 0
  fi
  
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Direnv configuration
if command -v direnv >/dev/null; then
  eval "$(direnv hook zsh)"
fi

# OS Specific
if [[ $OSTYPE == 'darwin'* ]]; then
  # OSX
  echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/fwd/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/fwd/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif grep -qi microsoft /proc/version; then
  # WSL
  # set browser for WSL
  export BROWSER=/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe
  # needed to start tmux on remote servers
  [[ $TERM == xterm-termite ]] && export TERM=xterm
fi

#python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# mcfly
eval "$(mcfly init zsh)"

# pnpm
export PNPM_HOME="/Users/fwd/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
test -f /Users/fwd/.cache/trunk/shell-hooks/zsh.rc && source /Users/fwd/.cache/trunk/shell-hooks/zsh.rc;
