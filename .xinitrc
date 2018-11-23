
[[ -f ~/.Xresources.dark ]] && xrdb -merge -I$HOME ~/.Xresources.dark
unclutter &
setxkbmap -option "caps:swapescape" &

exec i3
