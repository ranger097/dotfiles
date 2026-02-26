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

}


