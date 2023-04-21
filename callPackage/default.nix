let
    nixpkgs = import <nixpkgs> {};
    allPkgs = nixpkgs // pkgs;
    callPackage = path: overrides:
        let f = import path;
        in f ((builtins.intersectAttrs (builtins.functionArgs f) allPkgs) // overrides);
    pkgs = with nixpkgs; {
        mkDerivation = import ./autotools2.nix nixpkgs;
        hello = callPackage ./helloTR.nix {};
        graphviz = callPackage ./graphvix.nix {};
        graphvixCore = callPackage ./graphvix.nix { gdSupport = false; };
    };
in pkgs