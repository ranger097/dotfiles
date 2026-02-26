#ranger097
{ config, pkgs, ... }: {
users.users.ranger = {
isNormalUser = true;
description = "ranger";
extraGroups = [ "networkmanager" "wheel" ];
packages = with pkgs; [
kdePackages.kate
];
};
}
