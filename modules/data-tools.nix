{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs;
    let
      common = [
        # linters
        unstable.sqlfluff

        # wrangling
        visidata
      ];

      mac_only = [
      ];

      linux_only = [
      ];
    in
    common ++ (if stdenv.isLinux then linux_only else mac_only);

}
