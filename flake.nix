{ 
  description = "My restic tooling to backup & restore my files";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils, ... }: {
    flake-utils.lib.eachSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        packages = {
          restic = pkgs.writeShellApplication {
            name = "restic";
            runtimeInputs = [ pkgs.restic ];
            text = builtins.readFile ./backup.sh;
          };
        };
      }
    );
  };
}