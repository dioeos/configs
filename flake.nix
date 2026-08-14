{
  description = "Nix shell environment flake for dotfiles developmment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=26.05";
  };

  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in
  {
    devShells."x86_64-linux".default =
      import ./shell.nix { inherit pkgs; };
  };
}
