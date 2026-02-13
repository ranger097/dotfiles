#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '



# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc



alias gii="sudo nano /home/ranger/.config/ghostty/config"
alias bii="sudo nano ~/.bashrc"
alias hii="sudo nano /home/ranger/.config/hypr/hyprland.conf"
alias ls="lsd"
alias barcss="sudo nano /etc/xdg/waybar/style.css"
alias barconfig="sudo nano /etc/xdg/waybar/config.jsonc"
alias bye="sudo shutdown -h now"
alias rebar="pkill waybar && waybar &"
alias update="yay -Syyu"
alias anime="ani-cli --dub"
alias cii="cd ~/.config"
alias bbcss="sudo nano /etc/xdg/waybar/bottom_bar.css"
alias bbconfig="sudo nano /etc/xdg/waybar/bottom_bar.jsonc"
alias cgit="git add . && git commit -m 'updated config' && git push origin main"
alias sbash="source ~/.bashrc"
alias back="cd .."


eval "$(starship init bash)"


if uwsm check may-start; then
    exec uwsm start hyprland-uwsm.desktop
fi
