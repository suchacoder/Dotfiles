# Exporting some settings and default applications

# Setting TERM glob var to a 256 color to fix some issues like airline colors
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
   export TERM='xterm-256color'
else
   export TERM='xterm-color'
fi

# Uniform look between gtk and qt apps using qt5ct configuration utility
export QT_QPA_PLATFORMTHEME="qt5ct"

# Export xdg in order to be able to execute bspwm
XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_HOME

# Export xdg cache #
XDG_CACHE_HOME="$HOME/.cache"
export XDG_CACHE_HOME

# Export xdg data #
XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_HOME

# Add ~/bin/ to PATH variable

# If user ID is greater than or equal to 1000 & if ~/bin exists and is a directory & if ~/bin is not already in your $PATH
# then export ~/bin to your $PATH.
if [[ $UID -ge 1000 && -d $HOME/bin && -z $(echo $PATH | grep -o $HOME/bin) ]]
then
    export PATH=$HOME/bin:${PATH}
fi

# Default text editor
export EDITOR=/usr/bin/nano

# Default browser
export BROWSER=firefox

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth:ignoredups:erasedups

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=1000

# improved bash history
export HISTTIMEFORMAT="%h/%d - %H:%M:%S "

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Coloured less - Highlight section titles in manual pages.
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md="${yellow}";
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'

# Java application using tor
export JAVA_OPTIONS="$JAVA_OPTIONS -DsocksProxyHost=localhost -DsocksProxyPort=9050"

# Old way to get an uniform qt gtk look
#export QT_STYLE_OVERRIDE='gtk2'

# path to powerline config binary used by tmux
#export POWERLINE_CONFIG_COMMAND="/usr/bin/powerline-config"
