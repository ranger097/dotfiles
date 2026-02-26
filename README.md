_Complete(ish)_ Copy of My Nixos System.<br/>
Made for developers who like automated systems (_and Containerized development through Distrobox_).<br/>
As I learn more about Linux, Nixos, Hyprland, Automation,<br/>
Containerized Development and Programming,<br/>
I will update this repo periodically.<br/>

###Screenshots:<br/>
<img width="3840" height="2400" alt="2026-02-23-212314_hyprshot" src="https://github.com/user-attachments/assets/a8323d4b-0724-4414-966e-28d18b7e3fcc" />
<img width="3840" height="2400" alt="2026-02-24-223057_hyprshot" src="https://github.com/user-attachments/assets/0be5880f-a3d6-4814-be74-e5f6007b090d" />
<img width="3840" height="2400" alt="2026-02-24-093614_hyprshot" src="https://github.com/user-attachments/assets/91fc7715-50cf-4474-8248-62d0d7205e9a" />
<img width="3840" height="2400" alt="2026-02-24-103146_hyprshot" src="https://github.com/user-attachments/assets/f4d7e239-e4ec-4aa2-922a-7098e7938920" />

###Nixos Flake
```
git clone https://github.com/ranger097/ranger097s_dotfiles.git

cd ranger097s_dotfiles/nixos

nixos-generate-config --show-config --no-networks > hardware-configuration.nix

sudo nixos-rebuild switch --flake .#pokemon
```

Features/Applications and Completion/Configuration level within the flake:<br/>

 completed == "usable/automated"<br/>
[Nixos](https://github.com/NixOS/nixpkgs) · completed<br/>
[Rofi](https://github.com/davatorium/rofi) · completed<br/>
[Hyprlock](https://github.com/hyprwm/hyprlock) · completed<br/>
[Distrobox](https://github.com/89luca89/distrobox/blob/main/docs/compatibility.md) Automation Script · completed<br/>
[Waybar](https://github.com/Alexays/Waybar) · Toggle Script completed<br/>
[Hyprland](https://github.com/hyprwm/Hyprland) · completed<br/>
[kvantum](https://github.com/tsujan/Kvantum) · completed<br/>
[Github](https://github.com/git/git) Automation Script · completed<br/>
[Vscode](https://github.com/microsoft/vscode) Minimal · completed<br/>

 incomplete == "unusable/stock"<br/>
[wlogout](https://github.com/ArtsyMacaw/wlogout) · incomplete<br/>
[Starship](https://github.com/starship/starship) · incomplete<br/>
[Nixos Home-Manager](https://github.com/nix-community/home-manager) · incomplete<br/>

ENJOY HOWEVER YOU WANT:<br/>
FORK  <br/>
SHARE  <br/>
LEAVE A STAR  <br/>
