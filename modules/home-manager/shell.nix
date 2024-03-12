{ config, lib, pkgs, ... }:

let
  cfg = config.programs.zsh;
in
{
  options.programs.zsh = {
    enable = lib.mkEnableOption "Z shell";

    enableCompletion = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable command completion.";
    };

    enableAutosuggestions = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable autosuggestions.";
    };

    syntaxHighlighting = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable syntax highlighting.";
      };
    };

    oh-my-zsh = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable Oh My Zsh.";
      };

      plugins = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ "git" "thefuck" "zsh-autosuggestions" "zsh-syntax-highlighting" ];
        description = "Oh My Zsh plugins.";
      };

      theme = lib.mkOption {
        type = lib.types.str;
        default = "agnoster";
        description = "Oh My Zsh theme.";
      };
    };

    shellAliases = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
      };
      description = "Shell aliases.";
    };

    history = {
      size = lib.mkOption {
        type = lib.types.int;
        default = 10000;
        description = "Size of the command history.";
      };

      path = lib.mkOption {
        type = lib.types.str;
        default = "${config.xdg.dataHome}/zsh/history";
        description = "Path to the command history file.";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.zsh.enableCompletion = cfg.enableCompletion;
    programs.zsh.enableAutosuggestions = cfg.enableAutosuggestions;
    programs.zsh.syntaxHighlighting.enable = cfg.syntaxHighlighting.enable;

    programs.zsh.oh-my-zsh = {
      enable = cfg.oh-my-zsh.enable;
      plugins = cfg.oh-my-zsh.plugins;
      theme = cfg.oh-my-zsh.theme;
    };

    environment.etc."zshrc".text = lib.concatStringsSep "\n" [
      ''export HISTSIZE=${toString cfg.history.size}''
      ''export HISTFILE=${cfg.history.path}''
      (lib.concatMapStrings (alias: ''alias ${alias}="${cfg.shellAliases.${alias}}"'' ) (lib.attrNames cfg.shellAliases))
    ];
  };
}
