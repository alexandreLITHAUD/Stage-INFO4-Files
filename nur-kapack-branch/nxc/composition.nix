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
  };
  testScript = ''
    mgmt1.succeed("mkdir -p /data")
    mgmt1.succeed("beegfs-setup-mgmtd -C -p /data")
  '';
}
