{
  lib,
  pkgs,
  fetchurl,
  jdk,
  makeDesktopItem,
  unzip,
  makeWrapper,
}:

let
  version = "2025.7.4";

  productName = "pro";
  productDesktop = "BurpSuite Professional";
  burpHash = "sha256-17COQ9deYkzmaXBbg1arD3BQY7l3WZ9FakLXzTxgmr8=";

  burpSrc = fetchurl {
    name = "burpsuite.jar";
    urls = [
      "https://portswigger.net/burp/releases/download?product=${productName}&version=${version}&type=Jar"
      "https://web.archive.org/web/https://portswigger.net/burp/releases/download?product=${productName}&version=${version}&type=Jar"
    ];
    hash = burpHash;
  };

  loaderSrc = fetchurl {
    url = "https://github.com/xiv3r/Burpsuite-Professional/raw/refs/heads/main/loader.jar";
    hash = "sha256-3N8orPNgVUpamNePQDyWzOpQC+JLJ9ArAg4UKCBjfAo=";
  };

  pname = "burpsuite-pro"; # internal name

  description = "An integrated platform for performing security testing of web applications";

  desktopItem = makeDesktopItem {
    name = "burpsuite";
    exec = "burpsuite";
    icon = "burpsuite";
    desktopName = productDesktop;
    comment = description;
    categories = [
      "Development"
      "Security"
      "System"
    ];
  };
in
pkgs.stdenv.mkDerivation {
  inherit pname version;

  nativeBuildInputs = [
    makeWrapper
    unzip
  ];

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/pixmaps
    mkdir -p $out/share
    mkdir -p $out/bin

    # Extract icon
    ${lib.getBin unzip}/bin/unzip -p ${burpSrc} resources/Media/icon64${productName}.png > $out/share/pixmaps/burpsuite.png

    # Copy jars
    cp ${burpSrc} $out/share/burpsuite_pro_v${version}.jar
    cp ${loaderSrc} $out/share/loader.jar

    # Create wrapper that includes all flags from runScript
    makeWrapper ${jdk}/bin/java $out/bin/burpsuite \
      --add-flags "--add-opens=java.desktop/javax.swing=ALL-UNNAMED" \
      --add-flags "--add-opens=java.base/java.lang=ALL-UNNAMED" \
      --add-flags "--add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED" \
      --add-flags "--add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED" \
      --add-flags "--add-opens=java.base/jdk.internal.org.objectweb.asm.Opcodes=ALL-UNNAMED" \
      --add-flags "-javaagent:$out/share/loader.jar" \
      --add-flags "-noverify" \
      --add-flags "-jar $out/share/burpsuite_pro_v${version}.jar"

    # Desktop entry
    mkdir -p $out/share/applications
    cp ${desktopItem}/share/applications/* $out/share/applications/
  '';

  meta = with lib; {
    inherit description;
    longDescription = ''
      Burp Suite is an integrated platform for performing security testing of web applications.
      Its various tools work seamlessly together to support the entire testing process, from
      initial mapping and analysis of an application's attack surface, through to finding and
      exploiting security vulnerabilities.
    '';
    homepage = "https://portswigger.net/burp/releases";
    license = licenses.unfree;
    platforms = jdk.meta.platforms;
    maintainers = [ ];
    mainProgram = "burpsuite";
  };
}
