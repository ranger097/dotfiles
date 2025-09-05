# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;

};

# Steam
programs.steam.enable = true;


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ranger = {
    isNormalUser = true;
    description = "ranger";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   vim
   wget
   vscode
   steam
   kitty
   unityhub
   blender
   hyprland
   hyprlock
   wezterm
   ani-cli
   kdePackages.sddm
   kdePackages.kdenlive
   hyprpanel
   git
   firefox
   pavucontrol
   mpv
   wlroots
   youtube-music
   nodejs
   python3
   vite
   dotnet-sdk_8
   ninja
   cmake
   mpvpaper
   cava
   wine
   walker
   ranger
   discord
   starship
   gimp
   pipx
   perl
   bashly
   vulkan-tools
   betterdiscordctl
   lsd
   waybar
   rofi-wayland
   neovim
   fish
   ags
   astal.io
   astal.gjs
   astal.tray
   astal.cava
   astal.auth
   astal.apps
   astal.river
   astal.mpris
   astal.greet
   astal.source
   astal.notifd
   astal.astal4
   astal.wireplumber
   astal.powerprofiles
   astal.network
   astal.hyprland
   astal.bluetooth
   astal.battery
   nautilus
   kdePackages.ark
   nwg-look
   palenight-theme
   oceanic-theme
   gruvterial-theme
   amarena-theme
   whitesur-gtk-theme
   vimix-gtk-themes
   tokyonight-gtk-theme
   solarc-gtk-theme
   sierra-gtk-theme
   rose-pine-gtk-theme
   pop-gtk-theme
   paper-gtk-theme
   pantheon.elementary-gtk-theme
   omni-gtk-theme
   numix-sx-gtk-theme
   numix-solarized-gtk-theme
   numix-gtk-theme
   nightfox-gtk-theme
   mojave-gtk-theme
   matrix-gtk-theme
   matcha-gtk-theme
   lounge-gtk-theme
   layan-gtk-theme
   lavanda-gtk-theme
   kanagawa-gtk-theme
   jasper-gtk-theme
   gruvbox-material-gtk-theme
   gruvbox-gtk-theme
   graphite-gtk-theme
   fluent-gtk-theme
   everforest-gtk-theme
   deepin.deepin-gtk-theme
   colloid-gtk-theme
   andromeda-gtk-theme
   adapta-gtk-theme
   home-manager
   swww   
  ]; 
  
   users.users.ranger = {
  shell = pkgs.fish;
  };

  #Shell
  programs.fish = {
  enable = true;
  };
     
  #Starship
   programs.starship.enable = true;

  #cursor
   environment.variables.WLR_NO_HARDWARE_CURSORS = "1";

  #Fonts
   fonts.packages = with pkgs; [
   nerd-fonts._3270
   nerd-fonts._0xproto
   nerd-fonts.adwaita-mono
   nerd-fonts.agave
   nerd-fonts.anonymice
   nerd-fonts.arimo
   nerd-fonts.aurulent-sans-mono
   nerd-fonts.bigblue-terminal
   nerd-fonts.bitstream-vera-sans-mono
   nerd-fonts.blex-mono
   nerd-fonts.caskaydia-cove
   nerd-fonts.caskaydia-mono
   nerd-fonts.code-new-roman
   nerd-fonts.comic-shanns-mono
   nerd-fonts.commit-mono
   nerd-fonts.cousine
   nerd-fonts.d2coding
   nerd-fonts.daddy-time-mono
   nerd-fonts.departure-mono
   nerd-fonts.dejavu-sans-mono
   nerd-fonts.droid-sans-mono
   nerd-fonts.envy-code-r
   nerd-fonts.fantasque-sans-mono
   nerd-fonts.fira-code
   nerd-fonts.fira-mono
   nerd-fonts.geist-mono
   nerd-fonts.go-mono
   nerd-fonts.gohufont
   nerd-fonts.hack
   nerd-fonts.hasklug
   nerd-fonts.heavy-data
   nerd-fonts.hurmit
   nerd-fonts.im-writing
   nerd-fonts.inconsolata
   nerd-fonts.inconsolata-go
   nerd-fonts.inconsolata-lgc
   nerd-fonts.intone-mono
   nerd-fonts.iosevka
   nerd-fonts.iosevka-term
   nerd-fonts.iosevka-term-slab
   nerd-fonts.jetbrains-mono
   nerd-fonts.lekton
   nerd-fonts.liberation
   nerd-fonts.lilex
   nerd-fonts.martian-mono
   nerd-fonts.meslo-lg
   nerd-fonts.monaspace
   nerd-fonts.monofur
   nerd-fonts.monoid
   nerd-fonts.mononoki
   nerd-fonts.noto
   nerd-fonts.open-dyslexic
   nerd-fonts.overpass
   nerd-fonts.profont
   nerd-fonts.proggy-clean-tt
   nerd-fonts.recursive-mono
   nerd-fonts.roboto-mono
   nerd-fonts.shure-tech-mono
   nerd-fonts.sauce-code-pro
   nerd-fonts.space-mono
   nerd-fonts.symbols-only
   nerd-fonts.terminess-ttf
   nerd-fonts.tinos
   nerd-fonts.ubuntu
   nerd-fonts.ubuntu-mono
   nerd-fonts.ubuntu-sans
   nerd-fonts.victor-mono
   nerd-fonts.zed-mono
   maple-mono.truetype
   maple-mono.NF-unhinted
   maple-mono.NF-CN-unhinted
  ];

   #Enable Hyprland
   programs.hyprland = {
   enable = true;
   xwayland.enable = true;
   };
  






   #Enable SDDM Login
   services.xserver.enable = true;
   services.displayManager.sddm.enable = true;
   services.displayManager.sddm.wayland.enable = true;


   #Display settings
   services.logind.lidSwitch = "ignore";
   services.logind.lidSwitchExternalPower = "ignore";
   services.logind.lidSwitchDocked = "ignore";

   hardware.bluetooth = {
   enable = true;
   powerOnBoot = true;
   settings = {
    General = {
      Experimental = true;
    };
  };
};

   services.blueman.enable = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
