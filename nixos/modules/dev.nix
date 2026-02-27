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
];


virtualisation.podman = {
enable = true;
dockerCompat = true;
defaultNetwork.settings.dns_enabled = true;
};

}
