{

    description = "Create environnement for Java project";
    inputs.nixpkgs.url = "nixpkgs/nixos-22.11";
    inputs.utils.url = "github:numtide/flake-utils";

    outputs = {self, nixpkgs, utils}:
    
    utils.lib.eachDefaultSystem (system:
        let
            pkgs = import nixpkgs { inherit system; };
        in {

            # package here for instance

            devShell = with pkgs;
                mkShell {
                    buildInputs = [
                        jdk
                        eclipses.eclipse-platform
                    ];
                };

        }
    
    );



}