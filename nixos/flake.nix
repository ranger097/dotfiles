{
description = "ranger097 System Clone Flake";
inputs = {
nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
};

outputs = {self, nixpkgs, ... }: {
nixosConfigurations.pokemon = nixpkgs.lib.nixosSystem {
system = "x86_64-linux";
modules = [
./configuration.nix
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


};
};
}

