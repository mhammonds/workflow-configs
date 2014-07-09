if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

/usr/local/bin/dynmotd
