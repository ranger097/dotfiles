#ranger097
{ config, pkgs, ... }: {
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;
boot.kernelPackages = pkgs.lib.mkForce pkgs.linuxPackages;
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

}
