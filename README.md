A collection of configuration files essential to my daily work on UNIXy systems.

Bash Configuration
-------------------

`.bash_profile` is executed for login shells (e.g. connecting to a 
server over SSH), while `.bashrc` is executed for interactive, non-login 
shells (e.g. running the 'bash' command directly, opening a new terminal tab).

For the most part, my `.bash_profile` just wraps `.bashrc`. The only
interesting functionality I've added is a call to a custom login script,
`dynmotd.sh` which displays information about the OS and is useful when 
logging in over SSH. 

As for my `.bashrc` file, it's really just a few simple alias 
shortcuts for commonly used tasks. However, I also keep a 
non-versioned `.bashrc_private` file that is called from 
`.bashrc` and can bootstrap sensitive environment variables or perform 
other tasks that shouldn't be committed to source control but should 
be part of the local environment.

### Config Files:
- `dotfiles/bashrc`
- `dotfiles/bash_profile`
- `bin/dynmotd.sh`

### Bash Shell Tutorials:
- [Enhancements to Shell and Vim Productivity](https://danielmiessler.com/blog/enhancements-to-shell-and-vim-productivity/)
- [The Coolest Thing You Didn't KNow Bash Could Do](https://danielmiessler.com/blog/the-coolest-thing-you-didnt-know-bash-could-do/)

### Bash Shell Books:
- [From Bash to Z Shell](http://amzn.com/1590593766)
- [Classic Shell Scripting](http://amzn.com/B0043GXMPW)
- [The Linux Command Line](http://amzn.com/1593273894)

Tmux Configuration
-------------------

Tmux is a "terminal multiplexer" that dramatically improves efficiency when 
working on a UNIXy system. A few of the primary benefits I enjoy include
the ability to quickly switch between multiple terminal sessions (similar 
to tabbing in a GUI environment), the ability to arrange my terminal 
window into multiple panes for different workflows, and the ability to 
easily leave entire tmux/shell workflows running in the background while 
disconnecting, travelling, etc.

In addition to my tmux config file, I'm also including a clone of a
simple tmux save/restore bash script taken from the dotfiles repo 
of [mislav](https://github.com/mislav/dotfiles). This allows one to
run the following command to save an active tmux session:

```bash
tmux-session save
```

Or to restore a tmux session:

```bash
tmux-session restore
```

### Config Files:
- `dotfiles/tmux.conf` 
- `bin/tmux-session`

### Tmux Tutorials:
- [A tmux Primer](https://danielmiessler.com/study/tmux/)
- [Restore tmux session after reboot](http://superuser.com/questions/440015/restore-tmux-session-after-reboot)

### Tmux Books:
- [Productive Mouse-Free Development](http://amzn.com/1934356964)

Vim Configuration
-----------------

Over the years, I've grown to think of Vim as more of an extension of myself
than a text editor. This is the result of both [Vim's philosophy](http://stevelosh.com/blog/2010/09/coming-home-to-vim/#vims-feeling)
as well its extensive capacity for configuration.  

In addition to my baseline Vim configuration file, I also use a 
collection of plugins that can rival more feature-rich editors 
like SublimeText or Brackets. These plugins are managed by pathogen and live
at __/workflow/pathogen/bundle__. 

### Config Files:
- `dotfiles/vimrc`
- `pathogen`

### Vim Tutorials:
- [A Vim Tutorial and Primer](https://danielmiessler.com/study/vim/)
- [Coming Home to Vim](http://stevelosh.com/blog/2010/09/coming-home-to-vim/)
- [Vimtutor](http://linuxcommand.org/man_pages/vimtutor1.html)

### Vim Books:
- [Practical Vim](http://amzn.com/1934356980)
- [Learning the vi and Vim Editors](http://amzn.com/059652983X)
- [Pro Vim](http://amzn.com/1484202511)
