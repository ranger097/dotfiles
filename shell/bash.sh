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
alias cii="cd ~/.config && lsd"
alias ls="lsd"
alias cgit="git add . && git commit -m 'updated configs' && git push origin main"
alias update="sudo nixos-rebuild switch --upgrade"
alias bye="sudo shutdown -h now"
alias hmii="sudo nano ~/.config/home-manager/home.nix"
alias gii="sudo nano ~/.config/ghostty/config"
alias wii="cd ~/.config/waybar && lsd"
alias edit="sudo nano"

alias sendconfigs="cd ~/Github/dotfiles &&\
rm -rf ghostty && cp -r ~/.config/ghostty/ ghostty &&\
rm -rf home-manager && cp -r ~/.config/home-manager/ home-manager &&\
rm -rf hypr && cp -r ~/.config/hypr/ hypr &&\ 
rm -rf rofi && cp -r ~/.config/rofi/ rofi &&\
rm -rf starship && mkdir starship && cp -r ~/.config/starship.toml starship/starship.toml &&\
rm -rf vscode && mkdir vscode &&\
cp ~/.config/Code/User/settings.json vscode/settings.json &&\
rm -rf waybar && cp -r ~/.config/waybar/ waybar &&\
cp ~/.bashrc shell/bash.sh &&\
rm -rf nixos && cp -r /etc/nixos/ nixos &&\
git add . && git commit -m 'updated configs' &&\
git push origin main &&\
cd ~/Github/Scripts/ && git add . &&\
git commit -m 'updated configs' &&\
git push origin main"






eval -- "$(/run/current-system/sw/bin/starship init bash --print-full-init)"
