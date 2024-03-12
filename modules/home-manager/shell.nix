{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    thefuck
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;    

    oh-my-zsh = {
      enable = true;
      #custom = ohMyZshCustom.outPath; # Use .outPath to ensure a string path is used
      theme = "robbyrussell";
      plugins = [ "git" "thefuck" ];
    };

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
  };
}
