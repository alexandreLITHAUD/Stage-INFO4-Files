{ pkgs, modulesPath, nur, helpers, ... }: {
  roles =
    let
      commonConfig = import ./common_config.nix {inherit pkgs nur;}; 
    in {
    mgmtd = { ... }:
      {

        imports = [ commonConfig ];
        # services.beegfsEnable_mod = true;

      # environment.noXlibs = false;
      # environment.systemPackages = [
      #   pkgs.nur.repos.kapack.beegfs
      # ];

      # imports = [ pkgs.nur.repos.kapack.modules.beegfs ];

      # services.beegfsEnable_mod = true;

      # environment.etc."/beegfs/auth-def.key" = {
      #   enable = true;
      #   text = "ThisIsALousySecret";
      #   mode = "0600";
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
  };
  testScript = ''
    mgmtd.succeed("true")
  '';
}
