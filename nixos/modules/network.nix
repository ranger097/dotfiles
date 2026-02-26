#ranger097
{ config, pkgs, ... }: {
# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
networking.hostName = "pokemon"; # Define your hostname.
networking.networkmanager.enable = true;
hardware.enableRedistributableFirmware = true;
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };
# services.openssh.enable = true;
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];  # Or disable the firewall altogether.
# networking.firewall.enable = false;
}
