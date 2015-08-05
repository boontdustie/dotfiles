# Loaded for login scripts
# Run scripts

. ~/bin/dotfiles/bash/env
. ~/bin/dotfiles/bash/config
. ~/bin/dotfiles/bash/aliases


if [ -f ~/.git-completion.bash ]; then
	  . ~/.git-completion.bash
fi

export PATH="/usr/local/heroku/bin:$PATH"

export MARKPATH=$HOME/.marks
jump() { cd -P $MARKPATH/$1 2> /dev/null || echo "No such mark: $1"; }
mark() { mkdir -p $MARKPATH; ln -s "$(pwd)" $MARKPATH/$1; }
unmark() { rm -i $MARKPATH/$1; }
marks() { ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo; }
_jump() {
    local keys word

    word=${COMP_WORDS[COMP_CWORD]}
    keys=$(ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9 | grep "^$word")

    if [ "${#keys[*]}" -gt 0 ]; then COMPREPLY=($(compgen -W "${keys[@]}" $word)); fi

    return 0
}
complete -F _jump jump

alias mkfolder='mkdir'

function diff {
    colordiff -u "$@" | less -RF
}

eval "$(rbenv init -)"
