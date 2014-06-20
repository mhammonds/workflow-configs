# Shortcuts
alias ee="exit"
alias vim='vim -u ~/vimboilerplate/vimrc'
alias ll='ls -lah'

# Load private configs
if [ -f ~/.bashrc_private ]; then
    source ~/.bashrc_private
fi
