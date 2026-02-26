#ranger097
{ config, pkgs, ... }: {
nixpkgs.config.allowUnfree = true;
environment.systemPackages = with pkgs; [
vacuum-tube
ani-cli
steam
blueman
kdePackages.dolphin
kdePackages.kdenlive
kdePackages.qtstyleplugin-kvantum
waybar
swww
rofi
networkmanager
home-manager
libsForQt5.qt5ct
libsForQt5.qtstyleplugin-kvantum
kdePackages.kio-extras
kdePackages.qt6ct
protonvpn-gui
brightnessctl
discord
libreoffice-fresh
wlogout
playerctl
pavucontrol
bluez
gimp
kdePackages.qtsvg
kdePackages.ffmpegthumbs
kdePackages.konsole
usbutils
yt-dlp
foliate
qmmp
mpvpaper
mpv
gnome-boxes

];
}
