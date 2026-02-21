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



alias cii="cd ~/.config && lsd"
alias gii="sudo nano ~/.config/ghostty/config"
alias wii="cd ~/.config/waybar && lsd"
alias hii="sudo nano ~/.config/hypr/hyprland.conf"
alias nii="sudo nano /etc/nixos/configuration.nix"
alias bii="sudo nano ~/.bashrc"
alias hmii="sudo nano ~/.config/home-manager/home.nix"
alias sbii="source ~/.bashrc"
alias ls="lsd  -a --color=auto"
alias cgit="git add . && git commit -m 'updated configs' && git push origin main"
alias update="sudo nixos-rebuild switch --upgrade"
alias bye="sudo shutdown -h now"



#DISTROBOX_CONTAINERS
alias JavaGameDevBox="distrobox enter JavaGameDevBox"
alias JavaAndroidDevBox="distrobox enter JavaAndroidDevBox"
alias JavaWebDevBox="distrobox enter JavaWebDevBox"
alias CPPGameDevBox="distrobox enter CPPGameDevBox"
alias CPPLinuxDevBox="distrobox enter CPPLinuxDevBox"
alias PythonGameDevBox="distrobox enter PythonGameDevBox"
alias PythonLinuxDevBox="distrobox enter PythonLinuxDevBox"
alias RustGameDevBox="distrobox enter RustGameDevBox"
alias RustLinuxDevBox="distrobox enter RustLinuxDevBox"
alias RustWebDevBox="distrobox enter RustWebDevBox"



function sendconfigs {
   echo "Backing Up System To Github..."
   (
   cd ~/Github/dotfiles || exit &&  echo " Entering Github Directory 'dotfiles' on  Main" >&2
   rm -rf ghostty home-manager hypr rofi starship vscode waybar nixos && echo " Replacing Sub Directories" >&2 
   cp -r ~/.config/ghostty/ ghostty && echo " Pulling Ghostty Configuration" >&2
   cp -r ~/.config/home-manager/ home-manager && echo " Pulling Nixos Home-manager Configuration" >&2
   cp -r ~/.config/hypr/ hypr && echo " Pulling Hyprland WM Configuration" >&2
   cp -r ~/.config/rofi/ rofi && echo " Pulling Rofi Application Manager Configuration" >&2
   mkdir -p starship && cp -r ~/.config/starship.toml starship/starship.toml && echo " Making Sub Directory for Starship Configuration" >&2 && echo " Pulling Starship Configuration" >&2
   mkdir -p vscode && cp ~/.config/Code/User/settings.json vscode/settings.json && echo "Making Sub Directory for Vscode Configuration" >&2 && echo " Pulling Vscode Configuration" >&2
   cp -r  ~/.config/waybar/ waybar && echo " Pulling Waybar Configuration" >&2
   cp ~/.bashrc shell/bash.sh && echo " Pulling Bash Configuration" >&2
   cp -r /etc/nixos/ nixos && echo " Pulling Nixos Configuration" >&2
   git add . && git commit -m 'updated configs' && git push origin main
   cd  ~/Github/Scripts/ && git add . && git commit -m 'updated configs' && git push origin main
   echo "󱄅 Pushing Nixos Configs" >&2
   sleep 0.5
   echo " Pushing Dotfiles Directory" >&2
   sleep 0.5
   echo " Pushing Scripts Directory" >&2
   sleep 0.5
   echo "󰸵 Pushing Games Directory" >&2
   sleep 0.5
   )
# &> /dev/null

   if [ $? -eq 0 ]; then
      echo " Github Backup Completed"
   else
      echo " Error Backing Up System Configs"
   fi
}





export LS_COLORS="di=38;5;250"


eval -- "$(/run/current-system/sw/bin/starship init bash --print-full-init)"
