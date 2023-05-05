{ pkgs, ... }: {
  roles = {
    client = { pkgs, ... }:
      {
      networking.firewall.enable = false;
      imports = [ ./module_beegfs.nix ];
      services.beegfsEnable_mod = true;
 
      environment.noXlibs = false;
      environment.systemPackages = with pkgs; [
        (callPackage ./default_beegfs.nix {} )
      ];

    };
    mgmtd = { pkgs, ... }:
      {

      networking.firewall.enable = false;
      imports = [ ./module_beegfs.nix ];
      services.beegfsEnable_mod = true;
 
      environment.noXlibs = false;
      environment.systemPackages = with pkgs; [
        (callPackage ./default_beegfs.nix {} )
      ];
    #     environment.etc."/beegfs/auth-def.key" = {
    #     enable = true;
    #     text = "ThisIsALousySecret";
    #     mode = "0600";
    # };

    # services.beegfs_mod.default = {
    #   mgmtdHost = "mgmt";
    #   connAuthFile = "/etc/beegfs/auth-def.key";
    #   mgmtd = {
    #     enable = true;
    #     storeDir = "/data";
    #   };
    # };
        
    };

  storage = {pkgs, ...}:
    {
      networking.firewall.enable = false;
      imports = [ ./module_beegfs.nix ];
      services.beegfsEnable_mod = true;
 
      environment.noXlibs = false;
      environment.systemPackages = with pkgs; [
        (callPackage ./default_beegfs.nix {} )
      ];

    };

  
  };
  testScript = ''
    server.succeed("true")
    node.succeed("true")
  '';
}
