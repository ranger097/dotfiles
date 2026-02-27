#ranger097
{ config, pkgs, ... }: {
imports = [ 
./hardware-configuration.nix
./modules/audio.nix
./modules/boots.nix
./modules/dev.nix
./modules/environment.nix
./modules/fonts.nix
./modules/hyprland.nix
./modules/keyboard.nix
./modules/logind.nix
./modules/network.nix
./modules/nvidia.nix
./modules/packages.nix
./modules/printing.nix
./modules/steam.nix
./modules/system.nix
./modules/time.nix
./modules/touchpad.nix
./modules/users.nix
];


programs.nix-ld.enable = true;
programs.nix-ld.libraries = with pkgs; [
stdenv.cc.cc
openssl
zlib
libxml2
icu
nss
expat
curl
libuuid
libsecret
];

nixpkgs.config.allowUnfree = true;
nix.settings.experimental-features = [ "nix-command" "flakes" ];

}


