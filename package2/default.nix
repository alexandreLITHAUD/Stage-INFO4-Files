let
    pkgs = import <nixpkgs> {};
    mkDerivation = import ./autotools2.nix pkgs;
in with pkgs; {
    hello = import ./helloTR.nix { inherit mkDerivation; };
    graphviz = import ./graphvix.nix {
        inherit mkDerivation lib gd pkg-config;
        ## If we wanted a specif version of graphviz
        ## We could pass it to gd = ...;

        ## We can use inherit gd because 
        ## with pkgs above !
    };
}