{
  description = "Haskell development environment";
  inputs = {
    nixpkgs.url = "pkgs";
  };
  outputs = {
    self,
    nixpkgs,
  }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;

    devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.haskellPackages.shellFor {
      name = "haskell-dev";
      packages = hpkgs: [
        # reuse the nixpkgs for this package
        # hpkgs.distribution-nixpkgs
      ];
    };
  };
}
