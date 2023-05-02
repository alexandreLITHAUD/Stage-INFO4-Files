{ pkgs, ... }: {
  roles = {
    node = { pkgs, ... }:
      {
        # add needed package
        networking.firewall.enable = false;
        environment.systemPackages = with pkgs; [ glusterfs ];

        # fileSystems."/gluster" = {
        #   device = "server:/gv0";
        #   fsType = "glusterfs";
        # };
      };

    server = {pkgs, ...}:
      {
        networking.firewall.enable = false;
        services.glusterfs.enable = true;

        # boot.initrd.postDeviceCommands = ''
        #   ${pkgs.e2fsprogs}/bin/mkfs.ext4 -L data /dev/vdb
        # '';

        # fileSystems."/data" = { # fait planter le programme
        #   device = "/dev/disk/data/";
        #   fsType = "ext4";
        # }

      };
  };
  
  ## TODO FAIRE ÇA DANS UN SCRIPT A PART
  ## TODO GERE LE CAS DE PLUSIEUR SERVEURS EN COMMUN
  testScript = ''

  '';

    # server.wait_for_unit("glusterd.service")
    # server.wait_until_succeeds("gluster peer status")
    # server.succeed("gluster peer status | grep Connected")

    # server.succeed("mkdir -p /data/vg0")
    # server.succeed("gluster volume create gv0 server1:/data/vg0)
    # server.succeed("gluster volume start gv0")

    # node.wait_for_unit("gluster.mount")
}
