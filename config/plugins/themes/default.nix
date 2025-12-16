{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./catppuccin.nix
    ./tokyonight.nix
  ];
  colorscheme = lib.mkForce "tokyonight";
}
