# Path to your oh-my-zsh installation.
export ZSH=/Users/boontdustie/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="solarized-powerline"

ZSH_POWERLINE_SHOW_USER=false
ZSH_POWERLINE_SHOW_IP=false
ZSH_POWERLINE_SINGLE_LINE=true

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

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
plugins=(git jump ruby zsh-syntax-highlighting)
# User configuration

export PATH="/Users/boontdustie/sw/bin:/Users/boontdustie/bin:/usr/local/bin:/usr/local/heroku/bin:/Users/boontdustie/.rbenv/shims:/usr/local/heroku/bin:~/bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/local/pgsql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/sbin:/usr/texbin:/usr/local/bin/elixir:/usr/local/go/bin"
# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Universal
alias ..='cd ..'            # Go up one directory
alias ...='cd ../..'        # Go up two directories
alias ....='cd ../../..'    # And for good measure
alias l='ls -lah'   # Long view, show hidden
alias ls='ls -aGh'  # force ls to show everything (a), use colors (G) and humanize file sizes
alias la='ls -AF'   # Compact view, show hidden
alias ll='ls -lFh'  # Long view, no hidden

# Git
alias g="git status"
alias ga="git add"
alias gc="git clone"

# Garrett Scripts
alias lynxer="~/scripts/lynxer"
alias cmd="~/scripts/cmd"
alias gistit='~/scripts/gistit'
alias log='~/scripts/log'
alias rebase='~/scripts/rebase'
alias mcd='~/scripts/mc_delete'
alias mcc='~/scripts/mc_count'
alias ggd='~/scripts/gistgitdiff'
alias r2='~/scripts/ruby-how2'
alias her='~/scripts/her'
alias openqnl='~/scripts/openqnl'
alias serve='~/scripts/serve'

# Custom work ~/bin scripts
alias db_sync='~/bin/db_sync'
alias ey_sync='~/bin/ey_sync'
alias recreate_db="~/bin/recreate_db"
alias sidekiq="~/bin/sidekiq"

#alias emacs="emacs -nw" # open emacs without window

# Secure file transfers
transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
        tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }; alias transfer=transfer

# Generate passwords using pwgen
# https://medium.com/@jdorfman/osx-password-generator-in-bash-48687892c4f3
genpasswd() {
  pwgen -Bs $1 1 | pbcopy |pbpaste; echo "Has been copied to clipboard"
}

export FIREBIRD_HOME=/Library/Frameworks/Firebird.framework/Resources
export PATH=$PATH:$FIREBIRD_HOME/bin

PATH="/Users/boontdustie/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/boontdustie/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/boontdustie/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/boontdustie/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/boontdustie/perl5"; export PERL_MM_OPT;

# Ruby / Unix Workshop

alias scenic="cd ~/git/src/scenic"

cls() {
  cd "$1"
  ls
}

mcdc() {
  mkdir "$1"
  cd "$1"
}

catman() {
  man "$1" | cat
}

export HOMEBREW_BUILD_FROM_SOURCE=1
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/libxslt/bin:$PATH"

if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  . ~/.config/exercism/exercism_completion.zsh
fi