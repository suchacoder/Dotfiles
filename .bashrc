#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Make sure .profile gets sourced.
. $HOME/.profile


# Alias definitions. You may want to put all your additions into a separate file like ~/.bash_aliases, instead of adding them here directly. See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# Auto-complete for sudo, man and pacman when typing <tab>:
complete -cf sudo
complete -cf man
complete -cf pacman


# Append to the history file, don't overwrite it, preserv history commands across terminals #
shopt -s histappend


# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar


# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob


# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable extended globs
shopt -s extglob

# Enable programmable completion features (you don't need to enable this, if it's already enabled in
# /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# Ls color
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi


# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Fortune, cowsay + lolcat
#if [ -x /usr/bin/cowsay -a -x /usr/bin/fortune ]; then
#   fortune | cowsay -f $(ls /usr/share/cows/ | shuf -n1) | lolcat
#fi
