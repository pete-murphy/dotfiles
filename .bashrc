export PS1="\[\e[3;33m\]\\W \[\e[0m\]\\[\e[1;31m\]\\$\[\e[0m\] "

# Different prompt for tmux
if [ -n "$TMUX" ]; then
    export PS1="\[\e[1;31m\]\\$\[\e[m\] "
fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Aliases
alias '..'='cd ..'
alias 'vimconfig'='vim ~/.vimrc'
alias 'bashconfig'='vim ~/.bashrc'
alias 'l'='ls'
alias 'screenrec'='echo ffmpeg -f avfoundation -i 1:0 -pix_fmt yuv420p ~/Desktop/screen-rec-$(date +%Y-%m-%d-%H%M%s).mp4'
