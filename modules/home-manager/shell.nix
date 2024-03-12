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
      theme = "agnoster";
      plugins = [ "git" "thefuck" ];
    };

    shellAliases = {
      ll = "ls -l";
      sysconf = "sudo nixos-rebuild switch --flake /etc/nixos#nixos-desktop";
      homeconf = "home-manager switch --flake /etc/nixos#eternal@nixos-desktop";
      jvim = "nix run --refresh github:quantumcoded/neovim";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
  };
}
