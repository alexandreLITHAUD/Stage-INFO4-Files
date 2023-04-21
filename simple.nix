with (import <nixpkgs> {});
derivation {
    name = "hello_world";
    builder = "${bash}/bin/bash";
    args = [ ./simple_builder.sh ];
    inherit gcc coreutils;
    src = ./hello_world.c;
    system = builtins.currentSystem;
}