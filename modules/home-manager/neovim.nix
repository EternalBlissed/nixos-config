{ pkgs, lib, ... }:

{
  programs.neovim.enable = true;
 # environment.variables.EDITOR = "nvim";
  programs.neovim.extraConfig = lib.fileContents ../../nvim/init.lua;
}
