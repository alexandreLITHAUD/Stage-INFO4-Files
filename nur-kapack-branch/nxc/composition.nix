{ pkgs, modulesPath, nur, helpers, ... }: {
  roles =
    let
      commonConfig = import ./common_config.nix { inherit pkgs nur; };
    in
    {
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

          boot.initrd.postDeviceCommands = ''
            ${pkgs.e2fsprogs}/bin/mkfs.ext4 -L data /dev/vdb
          '';

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

          # services.beegfs_mod.fileSystems = pkgs.lib.attrsets.nameValuePair "/run/beegfs" 
          #   { mountPoint = "/run/beegfs";
          #       device = "default";
          #       fsType = "beegfs";
          #       options = [ "cfgFile=/etc/beegfs/client-default.conf" "_netdev" ];
          #   };
          # services.beegfs_mod.fileSystems = { "/run/beegfs" = 
          #   { mountPoint = "/run/beegfs";
          #       device = "default";
          #       fsType = "beegfs";
          #       options = [ "cfgFile=/etc/beegfs/client-default.conf" "_netdev" ];
          #   }; };
        };


      meta = { ... }:
        {

          imports = [ commonConfig ];
          services.beegfsEnable_mod = true;

          services.beegfs_mod.default = {
            mgmtdHost = "mgmt1";
            connAuthFile = "/etc/beegfs/auth-def.key";
            meta = {
              enable = true;
              storeDir = "/data";
            };
          };

          boot.initrd.postDeviceCommands = ''
            ${pkgs.e2fsprogs}/bin/mkfs.ext4 -L data /dev/vdb
          '';
        };


      sto = { ... }:
        {

          imports = [ commonConfig ];
          services.beegfsEnable_mod = true;

          services.beegfs_mod.default = {
            mgmtdHost = "mgmt1";
            connAuthFile = "/etc/beegfs/auth-def.key";
            storage = {
              enable = true;
              storeDir = "/data";
            };
          };

          boot.initrd.postDeviceCommands = ''
            ${pkgs.e2fsprogs}/bin/mkfs.ext4 -L data /dev/vdb
          '';

        };
    };
  testScript = ''
    
  '';
}
