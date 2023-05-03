{}:

let
	pkgs = import <nixpkgs> {};
in
	pkgs.callPackage ./default_beegfs.nix {}