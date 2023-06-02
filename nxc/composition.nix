{ pkgs, modulesPath, nur, helpers, ... }: let kernel=pkgs.linuxPackages_4_14.kernel; in {
  roles =
    let
      commonConfig = import ./common_config.nix { inherit pkgs nur; }; ## File that will import the module used by the services
      beegfs_driver = pkgs.callPackage ./beegfs_ker.nix { kernel=kernel; }; ## Kernel module used by the Client Service
    in
    {
      ## MANAGMENT SERVICE ROLE
      mgmt = { ... }:
        {


          imports = [ commonConfig ];
          services.beegfsEnable_mod = true;
          boot.kernelPackages = pkgs.linuxKernel.packages.linux_4_14;

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

      ## CLIENT SERVICE ROLE
      cli = { ... }:
        { 

          imports = [ commonConfig ];
          services.beegfsEnable_mod = true;
          boot.kernelPackages = pkgs.linuxKernel.packages.linux_4_14;
          boot.extraModulePackages = [ beegfs_driver ];

          services.beegfs_mod.default = {
            mgmtdHost = "mgmt1";
            connAuthFile = "/etc/beegfs/auth-def.key";
            client = {
              enable = true;
              mount = true;
              mountPoint = "/run/beegfs";
            };
          };
        };

      ## METADATA SERVICE ROLE
      meta = { ... }:
        {
          imports = [ commonConfig ];
          services.beegfsEnable_mod = true;
          boot.kernelPackages = pkgs.linuxKernel.packages.linux_4_14;

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

      ## STORAGE SERVICE ROLE
      sto = { ... }:
        {

          imports = [ commonConfig ];
          services.beegfsEnable_mod = true;
          boot.kernelPackages = pkgs.linuxKernel.packages.linux_4_14;

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
