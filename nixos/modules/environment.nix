#ranger097
{ config, pkgs, ... }: {
environment.variables.QT_QPA_PLATFORMTHEME = "qt6ct";
environment.sessionVariables = {
QT_QPA_PLATFORM = "wayland";
QT_QPA_PLATFORMTHEME="qt6ct";
NIXOS_OZONE_WL=1;
#CPP_LIBRARY_PATHS
LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:/run/current-system/sw/share/nix-ld/lib";
CPATH = "/run/current-system/sw/include";
LIBRARY_PATH = "/run/current-system/sw/lib";
XDG_DATA_DIRS = [
"/home/ranger/.icons"
"$XDG_DATA_DIRS"
];
};
}
