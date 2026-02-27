{ config, pkgs, lib, ... }: 

let 
repoPath = "/home/ranger/Github/ranger097s_dotfiles";
in
{
home.username = "ranger";
home.homeDirectory = "/home/ranger";
home.stateVersion = "25.11";

xdg.configFile = {
"ghostty".source = config.lib.file.mkOutOfStoreSymlink "${repoPath}/ghostty";
"hypr".source = config.lib.file.mkOutOfStoreSymlink "${repoPath}/hypr";
"waybar".source = config.lib.file.mkOutOfStoreSymlink "${repoPath}/waybar";
"wlogout".source = config.lib.file.mkOutOfStoreSymlink "${repoPath}/wlogout";
"dolphin".source = config.lib.file.mkOutOfStoreSymlink "${repoPath}/dolphin";
"starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${repoPath}/starship/starship.toml";
"Code/User/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${repoPath}/vscode/settings.json";
};

home.file = {
".distroboxrc".source = config.lib.file.mkOutOfStoreSymlink "${repoPath}/distrobox/.distroboxrc";
};

programs.bash = {
enable = true;
enableCompletion = true;
bashrcExtra = ''
source ${repoPath}/shell/bash.sh
'';
};


home.packages = with pkgs; [
rofi
];
xdg.configFile."rofi/config.rasi".source = ../rofi/config.rasi;



home.shellAliases = {
nixpush = "cd ${repoPath} && git add . && git commit -m 'update configs' && git push origin main";
nixswitch = "sudo nixos-rebuild switch --flake ${repoPath}/nixos#pokemon"; 
nii = "cd ${repoPath}/nixos/modules && lsd";
ls = "lsd";
ani-cli = "ani-cli --dub";
bii = "sudo nano ${repoPath}/nixos/home.nix";
hii = "sudo nano ${repoPath}/hypr/hyprland.conf";
gii = "sudo nano ${repoPath}/ghostty/config";

};
}


