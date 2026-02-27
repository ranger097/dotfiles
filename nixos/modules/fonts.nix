#ranger097
{ config, pkgs, ... }: {
fonts.packages = with pkgs;[
maple-mono.CN
maple-mono.NF
noto-fonts-cjk-sans
];

fonts.fontconfig = {
enable = true;
antialias = true;
hinting.enable = true;
subpixel.rgba = "rgb";
defaultFonts.monospace = [ "Maple Mono CN" "Maple Mono NF" "Noto Sans Mono CJK SC" ];

};
}
