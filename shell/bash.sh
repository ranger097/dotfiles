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



alias hii="sudo nano ~/.config/hypr/hyprland.conf"
alias nii="sudo nano /etc/nixos/configuration.nix"
alias bii="sudo nano ~/.bashrc"
alias sbii="source ~/.bashrc"
alias cii="cd ~/.config"
alias ls="lsd"
alias cgit="git add . && git commit -m 'updated configs' && git push origin main"
alias update="sudo nixos-rebuild switch --upgrade"
alias bye="sudo shutdown -h now"
alias hmii="sudo nano ~/.config/home-manager/home.nix"
alias gii="sudo nano ~/.config/ghostty/config"











eval -- "$(/run/current-system/sw/bin/starship init bash --print-full-init)"
