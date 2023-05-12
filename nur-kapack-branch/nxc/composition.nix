{ pkgs, modulesPath, nur, helpers, ... }: {
  roles =
    let
      commonConfig = import ./common_config.nix {inherit pkgs nur;}; 
    in {
    mgmt = { ... }:
      {

      imports = [ commonConfig ];
      services.beegfsEnable_mod = true;

      services.beegfs_mod.default = {
        mgmtdHost = "mgmt1";
        connAuthFile = "/etc/beegfs/auth-def.key";
        mgmtd = {
          enable = true;
          storeDir = "/data";
        };
      };

      };

    cli = { ... }:
      {

      imports = [ commonConfig ];
      services.beegfsEnable_mod = true;

      services.beegfs_mod.default = {
        mgmtdHost = "mgmt1";
        connAuthFile = "/etc/beegfs/auth-def.key";
        client = {
          enable = true;
          mount = true;
          mountPoint = "/run/beegfs";
        };
      };
      # service.beegfs_mod.fileSystems_mod = pkgs.lib.mkVMOverride # FIXME: this should be creatd by the module
      #   [ { mountPoint = "/beegfs";
      #       device = "default";
      #       fsType = "beegfs";
      #       options = [ "cfgFile=/etc/beegfs/client-default.conf" "_netdev" ];
      #     }
      #   ];
      };


    meta = { ... }:
      {

      imports = [ commonConfig ];
      services.beegfsEnable_mod = true;

      services.beegfs_mod.default = {
        mgmtdHost = "mgmt1";
        connAuthFile = "/etc/beegfs/auth-def.key";
        meta = {
          storeDir = "/data";
        };
      };
      };


    sto = { ... }:
      {

      imports = [ commonConfig ];
      services.beegfsEnable_mod = true;

      services.beegfs_mod.default = {
        mgmtdHost = "mgmt1";
        connAuthFile = "/etc/beegfs/auth-def.key";
        storage = {
          storeDir = "/data";
        };
      };

      };
  };
  testScript = ''

  '';
}
