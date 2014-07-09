# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Shortcuts
alias ee="exit"
alias vim='vim -u ~/vimboilerplate/vimrc'
alias vi='vim -u ~/vimboilerplate/vimrc'
alias ll='ls -lah'

# Load private configs
if [ -f ~/.bashrc_private ]; then
    source ~/.bashrc_private
fi
