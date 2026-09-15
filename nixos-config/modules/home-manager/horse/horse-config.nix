{ pkgs, ... }:

let
  horse = pkgs.buildGoModule {
    pname = "horse";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "if-not-nil";
      repo = "horse";
      rev = "290c5a351d8eec84c4af6bba8395ee1ade30e230";
      hash = "sha256-KCoU6OyvUk8K4nsBJho05AAb6HXSg2pZS/WqsTlF9Mo=";
    };
    vendorHash = "sha256-Cn1prgHQ8046ziWOBXmX2PlXRDYX8DqwcgYXBz2JPPc=";
  };
in
{
  home.packages = [
    horse
  ];
}
