{
  description = "Haskell development environment";
  inputs = {
    nixpkgs.url = "pkgs";
  };
  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    formatter.x86_64-linux = pkgs.alejandra;

    devShells.x86_64-linux.default = pkgs.haskellPackages.shellFor {
      name = "haskell-dev";

      packages = hpkgs: [
        # reuse the nixpkgs for this package
        # hpkgs.distribution-nixpkgs
      ];

      buildInputs = [
        pkgs.exercism
        pkgs.stack
      ];
    };
  };
}
