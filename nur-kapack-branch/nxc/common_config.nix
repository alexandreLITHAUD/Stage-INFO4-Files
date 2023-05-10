{ pkgs, nur}:

{

    imports = [ nur.repos.kapack.modules.beegfs ];

    environment.noXlibs = false;
    environment.systemPackages = [
        nur.repos.kapack.beegfs
    ];

    environment.etc."/beegfs/auth-def.key" = {
    enable = true;
    text = "ThisIsALousySecret";
    mode = "0600";
    };


}