{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    terminus_font
    font-awesome
    fira-code
    corefonts
    nerd-fonts.fira-code
  ];
}
