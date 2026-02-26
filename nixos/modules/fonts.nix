#ranger097
{ config, pkgs, ... }: {
fonts.packages = with pkgs;[
maple-mono.Normal-NF-CN-unhinted
];
fonts.fontconfig = {
antialias = true;
hinting.enable = true;
subpixel.rgba = "rgb";
};
fonts.fontconfig.defaultFonts.monospace = [ "Maple Mono NF CN" ];
}
