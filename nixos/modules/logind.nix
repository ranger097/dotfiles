#ranger097
{ config, pkgs, ... }: {
services.logind.settings.Login = {
lidSwitch = "ignore";
lidSwitchDocked = "ignore";
lidSwitchExternalPower = "ignore";
};
}
