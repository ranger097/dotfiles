#ranger097
{ config, pkgs, ... }: {
hardware.graphics.enable = true;
services.xserver.videoDrivers = [ "nvidia" ];
boot.kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];
hardware.nvidia = {
powerManagement.enable = true;
open = false;
modesetting.enable = true;
nvidiaSettings = true;
package = config.boot.kernelPackages.nvidiaPackages.stable;
};

}
