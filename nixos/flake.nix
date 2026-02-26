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
];
};
};
}

