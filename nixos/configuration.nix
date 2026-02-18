#ranger097


{ config, pkgs, ... }:


{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];



#GPU_SETTINGS_START
hardware.graphics.enable = true;
services.xserver.videoDrivers = [ "nvidia" ];
hardware.nvidia = {
open = true;
modesetting.enable = true;
nvidiaSettings = true;
package = config.boot.kernelPackages.nvidiaPackages.stable;
};
#GPU_SETTINGS_END



#BLUETOOTH/AUDIO_SETTINGS_START
hardware.bluetooth.enable = true;
services.blueman.enable = true;
hardware.bluetooth.settings = {
General = {
Enable = "Source,Sink,Media,Socket";
Experimental = true;
  };
};
services.pipewire.wireplumber.extraConfig."10-bluez" = {
"monitor.bluez.properties" = {
"bluez5.enable-sbc-xq" = true;
"bluez5.enable-msbc" = true;
"bluez5.enable-hw-volume" = true;
"bluez5.roles" = [
"hsp_hs"
"hsp_ag"
"hfp_hf"
"hfp_ag"];};};
services.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
enable = true;
alsa.enable = true;
alsa.support32Bit = true;
pulse.enable = true;
#jack.enable = true;
#media-session.enable = true;
};
#BLUETOOTH/AUDIO_SETTINGS_END




#BOOT/SECURITY_SETTINGS_START
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;
boot.kernelPackages = pkgs.linuxPackages;
boot.initrd.luks.devices."luks-1997167d-6340-4911-b856-b88bdd43c13d".device = "/dev/disk/by-uuid/1997167d-6340-4911-b856-b88bdd43c13d";
security.polkit.enable = true;
boot.loader.timeout = 0;

#CAMERA
services.udev.extraRules = ''
# Disable Microdia Integrated_Webcam_HD (0c45:6732)
ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0c45", ATTR{idProduct}=="6732", ATTR{authorized}="0"
'';

boot.blacklistedKernelModules = [ 
"uvcvideo" 
];

services.pipewire.wireplumber.extraConfig."10-disable-mic" = {
  "monitor.alsa.rules" = [
    {
      matches = [
        {
          # This matches all internal ALSA input sources (microphones)
          "node.name" = "~alsa_input.*"; 
        }
      ];
      actions = {
        update-props = {
          "node.disabled" = true;
        };
      };
    }
  ];
};

services.gvfs.enable = true;

#BOOT/SECURITY_SETTINGS_END




#NETWORK_SETTINGS_START
# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
networking.hostName = "pokemon"; # Define your hostname.
networking.networkmanager.enable = true;
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };
# services.openssh.enable = true;
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];  # Or disable the firewall altogether.
# networking.firewall.enable = false;  
#NETWORK_SETTINGS_END




#GENERAL_SETTINGS_START
time.timeZone = "America/New_York";
i18n.defaultLocale = "en_US.UTF-8";
i18n.extraLocaleSettings = {
LC_ADDRESS = "en_US.UTF-8";
LC_IDENTIFICATION = "en_US.UTF-8";
LC_MEASUREMENT = "en_US.UTF-8";
LC_MONETARY = "en_US.UTF-8";
LC_NAME = "en_US.UTF-8";
LC_NUMERIC = "en_US.UTF-8";
LC_PAPER = "en_US.UTF-8";
LC_TELEPHONE = "en_US.UTF-8";
LC_TIME = "en_US.UTF-8";
};
services.xserver.xkb = {
layout = "us";
variant = "";
};
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
services.logind.settings.Login = {
lidSwitch = "ignore";
lidSwitchDocked = "ignore";
lidSwitchExternalPower = "ignore";
};
#GENERAL_SETTINGS_END



#DM/WM_SETTINGS_START
services.xserver.enable = false;
services.displayManager = {
sddm.enable = true;
sddm.wayland.enable = true;
autoLogin = {
enable = true;
user = "ranger";
  };
};
programs.hyprland.enable = true;
#DM/WM_SETTINGS_END




#PRINTING/TOUCHPAD_SETTINGS_START
services.printing.enable = true;
# services.xserver.libinput.enable = true;
#PRINTING/TOUCHPAD_SETTINGS_END




#USER_SETTINGS_START
users.users.ranger = {
isNormalUser = true;
description = "ranger";
extraGroups = [ "networkmanager" "wheel" ];
packages = with pkgs; [
kdePackages.kate
];
};
#USER_SETTINGS_END




#SYSTEM_PACKAGE_SETTINGS_START
nixpkgs.config.allowUnfree = true;
environment.systemPackages = with pkgs; [
wget
kitty
vacuum-tube
vscode
firefox
ani-cli
steam
kdePackages.dolphin
kdePackages.kdenlive
javaPackages.compiler.openjdk25
gcc
gdb
kdePackages.qtstyleplugin-kvantum
waybar
blueman
networkmanager
ranger
nodejs
ghostty
swww
rofi
git
starship
home-manager
lsd
libsForQt5.qt5ct
libsForQt5.qtstyleplugin-kvantum
kdePackages.kio-extras
adwaita-qt
adwaita-qt6
kdePackages.qt6ct
hyprcursor
hyprlock
protonvpn-gui
brightnessctl
discord
libreoffice-fresh
wlogout
hyprpolkitagent
playerctl
pavucontrol
bluez
hyprcursor
hyprpicker
hyprshot
gimp
nautilus
dtrx
kdePackages.qtsvg
kdePackages.ffmpegthumbs
kdePackages.konsole
usbutils
yt-dlp
mtpfs
jmtpfs
gphoto2
foliate
nmap
qmmp
scons
pkg-config
gnumake
cmake
godot_4
raylib
(python3.withPackages (ps: with ps; [

npyscreen
pandas
requests

]))


];


# QUICK_NOTE_FOR_NIX-LD
# at the time of writing this my understanding
# is that any library needed for any program
# can be installed here globally if its present
# as a nixos package.

programs.nix-ld.enable = true;
programs.nix-ld.libraries = with pkgs; [
stdenv.cc.cc
libGL
zlib
raylib
xorg.libX11
xorg.libXcursor
xorg.libXinerama
xorg.libXrandr
xorg.libXi
xorg.libXext
xorg.libXrender
libxkbcommon
alsa-lib
];
#SYSTEM_PACKAGE_SETTINGS_END




#FONT_SETTINGS_START
fonts.packages = with pkgs;[
maple-mono.Normal-NF-CN-unhinted
];
fonts.fontconfig = {
antialias = true;
hinting.enable = true;
subpixel.rgba = "rgb";
};
fonts.fontconfig.defaultFonts.monospace = [ "Maple Mono NF CN" ];
#FONT_SETTINGS_END




#STEAM_SETTINGS_START
programs.steam.enable = true;
#STEAM_SETTINGS_END





#PROBABLY_SHOULDNT_EDIT_SETTINGS_START
system.stateVersion = "25.11"; # Did you read the comment?
#PROBABLY_SHOULDNT_EDIT_SETTINGS_END
}
