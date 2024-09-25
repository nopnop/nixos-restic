{
  description = "My restic tooling to backup & restore my files";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        backup = pkgs.writeShellApplication {
          name = "backup";
          runtimeInputs = [ pkgs.restic ];
          text = builtins.readFile ./backup.sh;
        };

      in
      {
        packages = {
          backup = backup;
        };

        devShell = pkgs.mkShell {
          buildInputs = [ pkgs.restic pkgs.direnv backup];
        };

        defaultPackage = backup;
      }
    );

}
