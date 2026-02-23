#ranger097

{ config, pkgs, ... }:

{

  home.username = "ranger";
  home.homeDirectory = "/home/ranger";
  home.stateVersion = "25.05"; #DO_NOT_CHANGE.
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
  nwg-look
  kdePackages.qt6ct
  kdePackages.qtsvg     
  kdePackages.kio-extras
	


  ];

home.file.".config/kdeglobals" = {
text = ''
  [Icons]
  Theme=Ars-Light-Icons
'';
force = true;
};

wayland.windowManager.hyprland.systemd.variables = ["--all"];
home.sessionVariables = {
XDG_DATA_DIRS = "$HOME/.icons:$XDG_DATA_DIRS";
QT_QPA_PLATFORMTHEME = "qt6ct";
QT_QPA_PLATFORM = "wayland;xcb";
XDG_MENU_PREFIX = "plasma-";
};





qt = {
enable = true;
platformTheme.name = "qt6ct";
style.name = "kvantum";


};






  home.pointerCursor = {
  gtk.enable = true;
  

  package = pkgs.pokemon-cursor;
  name = "Pokemon";
  size = 30;
  hyprcursor.enable = true;
  };
  
  gtk = {
  enable = true;
     font = {
     package = pkgs.maple-mono.NF;
     name = "Maple Mono NF";
     size = 14;
     };
     
     cursorTheme = {
     package = pkgs.pokemon-cursor;
     name = "Pokemon";
     size = 30;
     };

     iconTheme = {
     name = "Ars-Light-Icons";
     
     };
  };


programs.vscode.profiles.default.extensions = with pkgs; [
	vscode-marketplace.be5invis.vscode-custom-css
];


}

