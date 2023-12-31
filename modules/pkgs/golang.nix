with import <nixpkgs> { } ;

{
  def = buildGoModule
    rec {
      pname = "def";
      version = "0.2.2";

      src = fetchFromGitHub {
        owner = "fawni";
        repo = "def";
        rev = "v${version}";
        sha256 = "sha256-1XXlImDNEbQit8cBZIRhdT5UKXBHW1JkWQh/zf5zqgU=";
      };

      vendorSha256 = "sha256-UiDnSXOgSvIfIUI+zQ5HC7iGzbtfbQ4Snaxs69RePug=";
    };

  fman = buildGoModule
    rec {
      pname = "fman";
      version = "1.20.1";

      src = fetchFromGitHub {
        owner = "nore-dev";
        repo = "fman";
        rev = "v${version}";
        sha256 = "sha256-i4+O5AMhEG4c3Dbn3FlVx2olNQXaCyWIFv6ltNPbWXg=";
      };

      vendorSha256 = "sha256-pvFOnkKu7u4KANapFR84B/a/7Z8lUg3higX+CI9QOxQ=";
    };

  totp-cli = buildGoModule rec {
    pname = "totp-cli";
    version = "1.3.0";

    src = fetchFromGitHub {
      owner = "yitsushi";
      repo = "totp-cli";
      rev = "v${version}";
      sha256 = "sha256-tyt+VTTmEA0sFgq4jrjpFPxGOMa8GuihOyZBhM7Epx8=";
    };

    vendorSha256 = "sha256-42h6WnhC02ca4giz23FEG8APNM2sLjFxZS4v+FJo4pA=";
  };

  # based on: https://github.com/NixOS/nixpkgs/blob/master/pkgs/tools/misc/cloud-sql-proxy/default.nix
  cloud-sql-proxy = buildGoModule rec {
    pname = "cloud-sql-proxy";
    version = "2.4.0";

    src = fetchFromGitHub {
      owner = "GoogleCloudPlatform";
      repo = "cloud-sql-proxy";
      rev = "v${version}";
      sha256 = "sha256-kk+TW6nCUkV1FHEi+p4298JF9Im/aEWNoXPn5fueDj0=";
    };

    vendorSha256 = "sha256-FzBHhQ90c3Kr7F43EGoDNEe2oKymy0Cw6uFr3awhN08=";

    preCheck = ''
      buildFlagsArray+="-short"
    '';

    doCheck = false;
    doInstallCheck = false;
    dontCheck = true;

    meta = with lib; {
      description = "An authenticating proxy for Second Generation Google Cloud SQL databases";
      homepage = "https://github.com/GoogleCloudPlatform/cloud-sql-proxy";
      mainProgram = "cloud-sql-proxy";
    };
  };

  timerrr = buildGoModule
    rec {
      pname = "timerrr";
      version = "0.1.4";

      src = fetchFromGitHub {
        owner = "techygrrrl";
        repo = "timerrr";
        rev = "${version}";
        sha256 = "sha256-9X/qMWcNQTRlMjubB3pf/4qENlyvuwnuE1CBIefHBPQ=";
      };

      vendorSha256 = "sha256-X7SOleUyoVHWAdXuN8zonCvvLfeW5hNw/AIp0NwTKG0=";

      doCheck = false;
      dontCheck = true;
    };

  nix-search-cli = buildGoModule
    rec {
      pname = "peterldowns";
      version = "release-1694534186-f3f1c53";

      src = fetchFromGitHub {
        owner = "peterldowns";
        repo = "nix-search-cli";
        rev = "${version}";
        sha256 = "sha256-YM1Lf7py79rU8aJE0PfQaMr5JWx5J1covUf1aCjRkc8=";
      };

      vendorSha256 = "sha256-JDOu7YdX9ztMZt0EFAMz++gD7n+Mn1VOe5g6XwrgS5M=";
    };

  email-to-epub = buildGoModule
    rec {
      pname = "gonejack";
      version = "1.1";

      src = fetchFromGitHub {
        owner = "gonejack";
        repo = "email-to-epub";
        rev = "v${version}";
        sha256 = "sha256-L937JXNk5X8gfHDR3cDMEq4Bw6uOqRwuq6mNABiNYlQ=";
      };

      vendorSha256 = "sha256-2byn8zRevHfFPYkKbDkDkVrFqwNKU7DhWFRr+E/Cb9Y=";
    };
}
