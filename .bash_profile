# Store common shortcuts in .bashrc so they
# are always available from new terminals 
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH
