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
plugins=(archlinux docker docker-compose git gitfast git-prompt tmux tmuxinator ssh-agent)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


# Here comes some aliases
# enable aliases in sudo mode http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo="sudo "

alias vim=nvim
alias vi=nvim
alias vims=nvim -S Session.vim
alias mux=tmuxinator
alias getip="~/bin/ip.sh"
alias backup="~/bin/backup.sh"
alias dclogs="docker-compose logs -f"
alias dlogs="docker logs -f"
alias lip="~/bin/locateip.sh"

# Buffer
alias bf="cd ~/Projects/Buffer/buffer-dev"
alias bfup="cd ~/Projects/Buffer/buffer-dev && ./dev up && cd -"
alias bfstop="cd ~/Projects/Buffer/buffer-dev && ./dev stop && cd -"
alias bfps="cd ~/Projects/Buffer/buffer-dev && ./dev ps && cd -"
alias bbc="npm run compile && cp lib/chronos.js ~/Projects/Buffer/buffer-dev/buffer-web/node_modules/@bufferapp/chronos/lib/chronos.js" #Develop Chronos

# Seneca
alias sn="cd ~/Projects/Seneca/seneca-env"
alias snup="cd ~/Projects/Seneca/seneca-env && docker-compose up -d && docker ps && cd - "
alias snstop="cd ~/Projects/Seneca/seneca-env && docker-compose stop && cd -"

# fix VIM colors in tmus
alias fixcolors="export TERM='screen-256color'"

# My Theme
ZSH_THEME_GIT_PROMPT_PREFIX="%F{blue}  %{$bg[blue]%}%F{black}%{$bg[blue]%}%F{blue}%{$fg[black]%  "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$bg[blue]%} %{$bg[black]%}%F{blue}"
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_BRANCH=""
ZSH_THEME_GIT_PROMPT_STAGED="%{$bg[blue]%}%{$fg[black]%} %{ %G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$bg[blue]%}%{$fg[black]%} %{ %G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$bg[blue]%}%{$fg[black]%} %{✚ %G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$bg[blue]%}%{$fg[black]%} %{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$bg[blue]%}%{$fg[black]%} %{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$bg[blue]%}%{$fg[black]%} %{ %G%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{$bg[cyan]%}%F{black} %m %F{cyan}%{$bg[black]%}$(git_super_status)%{$bg[default]%}%F{black}
%{$bg[default]%}%F{cyan}%n %F{white}%~%F{cyan}/%{$reset_color%} '
RPROMPT=''

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Add local node_modules parth
export PATH="$PATH:./node_modules/.bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/nvm/init-nvm.sh
