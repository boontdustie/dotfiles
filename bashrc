# Loaded for login scripts
# Run scripts

. ~/bin/dotfiles/bash/env
. ~/bin/dotfiles/bash/config
. ~/bin/dotfiles/bash/aliases

## RVM RELATED HOOPLA

# work machine
#[[ -s "/Users/garrettk/.rvm/scripts/rvm" ]] && source "/Users/garrettk/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# home machine
#echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && \
#  . "$HOME/.rvm/scripts/rvm"' >> ~/.bash_profile[[ -s "$HOME/.rvm/scripts/rvm" ]] && \
#  . "$HOME/.rvm/scripts/rvm"

# Possible happy medium?
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
