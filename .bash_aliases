# Aliases

# ls alias
alias ls='lsd -X'  # Default ls behaviour
#alias ls='ls -BX --color=auto'  # Default ls behaviour
#alias ls='ls -sh --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lz='ll -rS'  # sort by size
alias lt='ll -rt'  # sort by date
alias lx='ll -BX'  # sort by extension
# Typos
alias ks='ls -sh --color=auto'
alias ñs='ls -sh --color=auto'
alias sl='ls -sh --color=auto'
alias rn='rm -I'
alias r,='rm -I'

# Safety
alias mv='mv -i'
alias rm='rm -I'  # 'rm -i' prompts for every file
#alias cp='cp -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# grep alias
alias grep='rg'
#alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Dir alias
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

# Various alias
alias tmux='tmux -2' #Make tmux assume 256 colors
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias pacman="pacman --color=always"
alias shot="scrot ~/screenshots/`date +%y-%m-%d-%H:%M:%S`.png"
alias mocp='mocp -T /usr/share/moc/themes/green_theme'
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias diff='diff --color=auto'
alias mount='mount | column -t'
# Look for high priority errors in the systemd journal
alias errors="sudo journalctl -p 0..3 -xn"

# Cups
alias startprint="systemctl start org.cups.cupsd.service"
alias stopprint="systemctl stop org.cups.cupsd.service"

# urban terror alias
alias urban='/home/curiousx/urban_terror/urban_64 +set fs_homepath /home/curiousx/urban_terror/'
# urban terror gamma fix launcher
# alias urban='xgamma -gamma 1.1 ; /home/curiousx/urban_terror/urban_64 +set fs_homepath /home/curiousx/urban_terror/ ; xgamma -gamma 1'


# webpro #

# List declared aliases, functions

alias listaliases="alias | sed 's/=.*//'"
alias listfunctions="declare -f | grep '^[a-z].* ()' | sed 's/{$//'" # show non _prefixed functions

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# nano -> vim alias

alias nano="nvim"

# One of @janmoesen's ProTips
#for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
#	alias "$method"="lwp-request -m '$method'"
#done

# View HTTP traffic
#alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
#alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
