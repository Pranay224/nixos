{ pkgs, ... }: 
let
  patchFile = builtins.toFile "allow_direnv.patch" ''
    --- clean.rs	2025-04-23 15:29:06.677879026 +0530
    +++ clean_allow_direnv.rs	2025-04-23 15:29:24.667053968 +0530
    @@ -97,7 +97,7 @@
             }
     
             // Query gcroots
    -        let filename_tests = [r".*/.direnv/.*", r".*result.*"];
    +        let filename_tests = [r".*result.*"];
             let regexes = filename_tests
                 .into_iter()
                 .map(Regex::new)

    '';
in
{
  programs.nh = {
    enable = true;
    flake = "/home/pranay/nixos";
    package = pkgs.nh.overrideAttrs (oldAttrs: {
      patchPhase = ''
        runHook prePatch
        patch -p0 src/clean.rs < ${patchFile}
        runHook postPatch
      '';
    });
  };
}
