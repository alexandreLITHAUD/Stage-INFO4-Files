{ pkgs, ... }: {
  roles = {
    node = { pkgs, ... }:
      {
        networking.firewall.enable = false;
        # imports = [ ./module_beegfs.nix ];
        # services.beegfsEnable_mod = true;
      #   services.beegfs_mod.default = {
      #     connAuthFile = "/etc/beegfs/auth-def.key";
      #     client = {
      #       mount = false;
      #       enable = true;
      # };
    };

    # fileSystems = pkgs.lib.mkVMOverride # FIXME: this should be creatd by the module
    #   [ { mountPoint = "/beegfs";
    #       device = "default";
    #       fsType = "beegfs";
    #       options = [ "cfgFile=/etc/beegfs/client-default.conf" "_netdev" ];
    #     }
    #   ];

    # environment.etc."/beegfs/auth-def.key" = {
    #   enable = true;
    #   text = "ThisIsALousySecret";
    #   mode = "0600";
    # };
      #};
    server = { pkgs, ... }:
      {

        # imports = [ ./module_beegfs.nix ];

      #   boot.initrd.postDeviceCommands = ''
      #     ${pkgs.e2fsprogs}/bin/mkfs.ext4 -L data /dev/vdb
      #   '';
      #   virtualisation.emptyDiskImages = [ 4096 ];

      #   fileSystems = pkgs.lib.mkVMOverride
      #     [ { mountPoint = "/data";
      #       device = "/dev/disk/by-label/data";
      #       fsType = "ext4";
      #   }
      # ];
      environment.noXlibs = false;
      environment.systemPackages = with pkgs; [
        (callPackage ./default_beegfs.nix {} )
      ];
    #     environment.etc."/beegfs/auth-def.key" = {
    #     enable = true;
    #     text = "ThisIsALousySecret";
    #     mode = "0600";
    # };

    # services.beegfsEnable_mod = true;
    # services.beegfs_mod.default = {
    #   mgmtdHost = "mgmt";
    #   connAuthFile = "/etc/beegfs/auth-def.key";
    #   server = {
    #     enable = true;
    #     storeDir = "/data";
    #   };
  # };
        
    };
  };
  testScript = ''
    foo.succeed("true")
  '';
}
