{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    terminus_font
    font-awesome
    fira-code
    corefonts
    vista-fonts
    nerd-fonts.fira-code
  ];
}
