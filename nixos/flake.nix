{
description = "ranger097 System Clone Flake";
inputs = {
nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

home-manager = {
url = "github:nix-community/home-manager";
inputs.nixpkgs.follows = "nixpkgs";
};

};

outputs = {self, nixpkgs, home-manager, ... }: {
nixosConfigurations.pokemon = nixpkgs.lib.nixosSystem {
system = "x86_64-linux";
modules = [
./configuration.nix
home-manager.nixosModules.home-manager
{
home-manager.useGlobalPkgs = true;
home-manager.useUserPackages = true;
home-manager.users.ranger = import ./home.nix;
}
];
};
};
}

