#ranger097
{ config, pkgs, lib, ... }: {
environment.variables.QT_QPA_PLATFORMTHEME = "qt6ct";

environment.sessionVariables = {
QT_QPA_PLATFORM = "wayland";
QT_QPA_PLATFORMTHEME="qt6ct";
NIXOS_OZONE_WL = "1";
GSK_RENDERER = "ngl"; 
GDK_BACKEND = "wayland";

 XDG_DATA_DIRS = lib.mkForce [
      "$HOME/.icons"
      "/run/current-system/sw/share"
      "/usr/share"
    ];


};
}
