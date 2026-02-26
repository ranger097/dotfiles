#ranger097
{ config, pkgs, ... }: {
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

environment.systemPackages = with pkgs; [
kitty
firefox
hyprlock
hyprpolkitagent
hyprcursor
hyprpicker
hyprshot
hypridle
hyprkeys
hyprsunset
hyprnotify

];





}
