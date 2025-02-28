{ pkgs, ... }:

{
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132b.psf.gz";
    packages = with pkgs; [ terminus_font ];
  };
}
