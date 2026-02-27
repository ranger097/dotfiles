#ranger097
{ config, pkgs, ... }: {
environment.systemPackages = with pkgs; [
wget
ranger
ghostty
git
starship
lsd
dtrx
blender
vscode

(python3.withPackages (ps: with ps; [

npyscreen
pandas
requests

]))
];


virtualisation.podman = {
enable = true;
dockerCompat = true;
defaultNetwork.settings.dns_enabled = true;
};

}
