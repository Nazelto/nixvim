{
  config,
  pkgs,
  lib,
  ...
}:
let
  LoadColorScheme =
    dir:
    let
      entries = builtins.readDir dir;
      isNixFile = name: type: name != "default.nix" && type == "regular";
      filterFiles = builtins.filter (name: isNixFile name (builtins.getAttr name entries)) (
        builtins.attrNames entries
      );
    in
    map (name: dir + "/${name}") filterFiles;
in
{
  imports = LoadColorScheme ./.;
  colorscheme = lib.mkForce "catppuccin";
}
