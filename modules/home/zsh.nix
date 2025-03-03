{ pkgs, ... }:
let
  typewritten-theme = pkgs.fetchFromGitHub {
    owner = "reobin";
    repo = "typewritten";
    rev = "v1.5.2";
    sha256 = "sha256-ZHPe7LN8AMr4iW0uq3ZYqFMyP0hSXuSxoaVSz3IKxCc=";
  };

  omz-custom = pkgs.stdenv.mkDerivation {
    name = "omz-custom";

    phases = [ "buildPhase" ];

    buildPhase = ''
      mkdir -p $out/themes
      cp -r ${typewritten-theme} $out/themes/typewritten
    '';
  };
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    history = {
      append = true;
      expireDuplicatesFirst = true;
    };

    shellAliases = {
      "@" = "history";
      "g" = "grep";
      "shutdown" = "shutdown now";
      "Hyprland" = "dbus-launch --exit-with-session Hyprland";
      "hyprland" = "Hyprland";
      "cat" = "bat";
    };
    

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];

      custom = "${omz-custom}";
      theme = "typewritten/typewritten";
    };
  };
}
