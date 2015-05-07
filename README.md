A collection of configuration files essential to my daily work on UNIXy systems.

Bash Configuration
-------------------

The __.bash\_profile__ file is executed for login shells (e.g. when you SSH into a 
server), while the __.bashrc__ file is executed for any interactive, non-login 
shell (e.g. Opening gnome-terminal, running the 'bash' command directly, 
opening a new terminal tab). You can view this behavior on your own 
environment by adding a `echo 'Hello bashrc'` or `echo 'Hello bash_profile'` 
command into each file. 

In my scenario, I virtually always work with interactive, non-login shells. In 
fact, the only time my __.bash\_profile__ runs is if I'm logging in 
somewhere via SSH. So, __.bash\_profile__ for me is just a simple wrapper around
__.bashrc__. The only addition I've made is a call to a custom motd script that 
provides some system level information at login that is useful to know when
first connecting to a machine.

As for my __.bashrc__, nothing much going on there. Just a few simple alias 
shortcuts for commonly used tasks. However, I also use the bashrc file to wrap
a non-versioned __.bashrc\_private__ file that can bootstrap sensitive 
environment variables or perform other sensitive tasks that shouldn't be 
contained in source control.

### Config Files:
- `dotfiles/bashrc`
- `dotfiles/bash_profile`
- `bin/dynmotd.sh`
- `dotfiles/bashrc_private` (not included, stores sensitive commands)

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

In addition to my baseline Vim configuration file, I'm also (slowly) working
on a project called [Vim Boilerplate](https://github.com/bitmotive/VimBoilerplate)
which is an attempt to achieve feature parity with editors like SublimeText and
Brackets. This achieved by simply combining Vim plugins managed by Pathogen into 
one repo. Consequently, a section of my Vim configuration enables VimBoilerplate,
but does so in a 'progressively enhanced' way meaning everything will still work
just fine even if Vim Boilerplate isn't available on the local system.

### Config Files:
- `dotfiles/vimrc`

### Vim Tutorials:
- [A Vim Tutorial and Primer](https://danielmiessler.com/study/vim/)
- [Coming Home to Vim](http://stevelosh.com/blog/2010/09/coming-home-to-vim/)
- [Vimtutor](http://linuxcommand.org/man_pages/vimtutor1.html)

### Vim Books:
- [Practical Vim](http://amzn.com/1934356980)
- [Learning the vi and Vim Editors](http://amzn.com/059652983X)
- [Pro Vim](http://amzn.com/1484202511)
