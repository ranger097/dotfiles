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
alias bye="sudo shutdown -h now"

function cgit {
git add . > /dev/null 2>&1
git commit -m "updated configs" --quiet > /dev/null 2>&1
git push origin main --quiet > /dev/null  2>&1
}

function update {
sudo nixos-rebuild switch --upgrade 
home-manager switch 
}


function sendconfigs {
   local start_time=$SECONDS
   echo "Backing Up System To Github..."
   (
   cd ~/Github/ranger097s_dotfiles &> /dev/null || exit
   echo " Entering Github Directory 'ranger097s_dotfiles' on  Main" >&2
   rm -rf ghostty home-manager hypr rofi starship vscode waybar nixos dolphin wlogout &> /dev/null
   echo " Replacing Sub Directories" >&2
   cp -r ~/.config/ghostty/ ghostty &> /dev/null && echo " Pulling Ghostty Configuration" >&2
   cp -r ~/.config/home-manager/ home-manager &> /dev/null && echo " Pulling Nixos Home-manager Configuration" >&2
   cp -r ~/.config/hypr/ hypr &> /dev/null && echo " Pulling Hyprland WM Configuration" >&2
   cp -r ~/.config/rofi/ rofi &> /dev/null && echo " Pulling Rofi Application Manager Configuration" >&2
   mkdir -p  dolphin && cp -r ~/.config/dolphin dolphin/ &> /dev/null && echo " Pulling Dolphin File Manager Configuration" >&2
   mkdir -p starship && cp -r ~/.config/starship.toml starship/starship.toml &> /dev/null && echo " Pulling Starship Configuration" >&2
   mkdir -p vscode && cp -r ~/.config/Code/User/settings.json vscode/settings.json &> /dev/null && echo " Pulling Vscode Configuration" >&2
   mkdir -p wlogout && cp -r ~/.config/wlogout/layout wlogout/layout &> /dev/null && cp ~/.config/wlogout/style.css wlogout/style.css &> /dev/null && echo " Pulling Wlogout Configuration" >&2
   mkdir -p distrobox && cp ~/.distroboxrc distrobox/.distroboxrc &> /dev/null && echo " Pulling DistroBox Configuration" >&2
   cp -r ~/.config/waybar/ waybar &> /dev/null && echo " Pulling Waybar Configuration" >&2
   cp -r ~/.bashrc shell/bash.sh &> /dev/null && echo " Pulling Bash Configuration" >&2
   cp -r /etc/nixos/ nixos &> /dev/null && echo " Pulling Nixos Configuration" >&2

   for dir in ~/Github/ranger097s_dotfiles  ~/Github/Scripts/ ~/Github/Games/ ~/Github/link-lamb/ ~/ranger097_gets_cracked/; do
   	cd "$dir" &> /dev/null 2>&1
	git add . > /dev/null 2>&1
	git commit -m "updated configs" --quiet > /dev/null 2>&1
	git push origin main --quiet > /dev/null  2>&1
   done

   echo " Pushing Nixos Configs" >&2
   echo " Pushing Dotfiles Directory" >&2
   echo " Pushing Scripts Directory" >&2
   echo "󰸵 Pushing Games Directory" >&2
   echo "󰄡 Pushing Link-Lamb Directory" >&2
   echo "󰑴 Pushing ranger097_gets_cracked Directory" >&2
   )

   if [ $? -eq 0 ]; then
      local duration=$(( SECONDS - start_time ))
      echo " Github Backup Completed in ${duration} seconds." 
   else
      echo " Error Backing Up System Configs."
   fi
}

function CREATEDEVBOX {
export DBX_CONTAINER_MANAGER=podman
local start_time=$SECONDS
echo "BUILDING · [  GODEVBOX ] · ENVIRONMENT"
distrobox-create -n GODEVBOX -i golang --yes &> /dev/null
echo "BUILDING · [  RUSTDEVBOX ] · ENVIRONMENT"
distrobox-create -n RUSTDEVBOX -i rust --yes &> /dev/null
echo "BUILDING · [  ELIXIRDEVBOX ] · ENVIRONMENT"
distrobox-create -n ELIXIRDEVBOX -i elixir --yes &> /dev/null
echo "BUILDING · [  JAVADEVBOX ] · ENVIRONMENT"
distrobox-create -n JAVADEVBOX --image fedora:latest \
 --additional-packages "java-latest-openjdk-devel maven gradle git" \
 --yes &> /dev/null
echo "BUILDING · [  PYTHONDEVBOX ] · ENVIRONMENT"
distrobox-create -n PYTHONDEVBOX -i python --yes &> /dev/null
echo "BUILDING · [  GCCDEVBOX ] · ENVIRONMENT"
distrobox-create -n GCCDEVBOX -i gcc --yes &> /dev/null
wait
local duration=$((SECONDS - start_time))
echo "FINSIHED · [  DISTROBOX ] · DEVELOPMENT ENVIRONMENT IN ${duration} SECONDS"
distrobox-list
}

function REMOVEDEVBOX {
local start_time=$SECONDS
distrobox-rm -f GODEVBOX RUSTDEVBOX ELIXIRDEVBOX JAVADEVBOX PYTHONDEVBOX GCCDEVBOX &> /dev/null
wait
local duration=$((SECONDS - start_time))
echo "ALL DISTROBOXES HAVE BEEN DELETED"
echo "Finished in ${duration} seconds."
distrobox-list
}

#DISTROBOX_CONTAINERS
alias GODEVBOX="distrobox enter GODEVBOX"
alias RUSTDEVBOX="distrobox enter RUSTDEVBOX"
alias ELIXIRDEVBOX="distrobox enter ELIXIRDEVBOX"
alias JAVADEVBOX="distrobox enter JAVADEVBOX"
alias PYTHONDEVBOX="distrobox enter PYTHONDEVBOX"
alias GCCDEVBOX="distrobox enter GCCDEVBOX"

export LS_COLORS="di=38;5;250"
eval -- "$(/run/current-system/sw/bin/starship init bash --print-full-init)"
