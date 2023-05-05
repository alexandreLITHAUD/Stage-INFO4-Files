{ pkgs, modulesPath, nur, helpers, ... }: {
  roles = {
    mgmtd = { pkgs, nur, ... }:
      {
      # imports = [ pkgs.nur.repos.kapack.modules.beegfs ];

      # services.beegfsEnable_mod = true;

      environment.noXlibs = false;
      environment.systemPackages = [
        pkgs.nur.repos.kapack.beegfs
      ];

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
