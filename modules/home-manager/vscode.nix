{ pkgs, ... }:

{
  programs.vscode = {
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    dark-green-jungle-theme
  ];
 };
}
