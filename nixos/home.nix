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
go
gopls
delve
python3
python3Packages.pip
python3Packages.python-lsp-server
black
gcc
gnumake
cmake
gdb
jdk21
maven
gradle
nodejs_22
elixir
elixir-ls
rustc
cargo
rust-analyzer
rustfmt
docker
docker-compose
podman
ripgrep
fd
fzf
jq
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

home.pointerCursor = {
gtk.enable = true;
x11.enable = true;
name = "Pokemon";
size = 48;
package = pkgs.runCommand "local-cursor" {} ''
    mkdir -p $out/share/icons
    ln -s ${repoPath}/Icons/Pokemon $out/share/icons/Pokemon
  '';
};

programs.direnv = {
enable = true;
nix-direnv.enable = true;
};



}


