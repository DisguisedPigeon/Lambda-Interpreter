{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          pkgs.ocamlformat
          pkgs.dune_3
          pkgs.fswatch
          pkgs.ocaml
          pkgs.ocamlPackages.odoc
          pkgs.ocamlPackages.ocaml-lsp
          pkgs.ocamlPackages.utop
        ];
      };

      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
