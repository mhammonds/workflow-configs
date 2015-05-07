# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Shortcuts
alias ee="exit"
alias ll='ls -lah'

# Load private configs
if [ -f ~/.bashrc_private ]; then
    source ~/.bashrc_private
fi
