with import <nixpkgs> { } ;

{
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
}