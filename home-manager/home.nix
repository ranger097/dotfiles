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
    
	


  ];

  home.file = {




  };


qt = {
enable = true;
platformTheme.name = "qtct";
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
     package = pkgs.sweet-folders;
     name = "sweet-folders";
     
     };
  };
}

