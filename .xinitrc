# Merge .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xset -b &

# Changes the keyboard  repeat rate
xset r rate 300 30

# Font paths
xset +fp /usr/share/fonts/
xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/TTF/
xset +fp ~/.fonts/
xset fp rehash

# Use gtk dialog in qt apps, if you use a display manager, you might wanna export it in /etc/environment
export DESKTOP_SESSION=gnome

#exec i3 -V >> ~/.config/i3/log/i3log-$(date +'%F-%k-%M-%S') 2>&1
exec i3
