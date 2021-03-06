export HISTTIMEFORMAT='%F %T  '

export PAGER='less -XFr'
export GITPAGER='less -XFr'

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=10000000
export HISTCONTROL=ignoredups
# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Prefer US English and use UTF-8
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

dircolors_file="$HOME/.dircolors"

[ ! -z "$SHELL" ] && test -r $dircolors_files  && eval "$(dircolors $dircolors_file)" && eval $(dircolors)

export GO15VENDOREXPERIMENT=1

if [[ $TERM == "dumb" ]]; then
    export PS1='$ '
fi
