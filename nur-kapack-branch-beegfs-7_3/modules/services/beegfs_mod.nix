{ config, lib, pkgs,... }:

with lib;

let
  
  cfg = config.services.beegfs_mod;

  # functions for the generations of config files

  configMgmtd = name: cfg: pkgs.writeText "mgmt-${name}.conf" ''
    storeMgmtdDirectory = ${cfg.mgmtd.storeDir}
    storeAllowFirstRunInit = false
    connAuthFile = ${cfg.connAuthFile}
    connPortShift = ${toString cfg.connPortShift}

    ${cfg.mgmtd.extraConfig}
  '';

  configAdmon = name: cfg: pkgs.writeText "admon-${name}.conf" ''
    sysMgmtdHost = ${cfg.mgmtdHost}
    connAuthFile = ${cfg.connAuthFile}
    connPortShift = ${toString cfg.connPortShift}

    ${cfg.admon.extraConfig}
  '';

  configMeta = name: cfg: pkgs.writeText "meta-${name}.conf" ''
    storeMetaDirectory = ${cfg.meta.storeDir}
    sysMgmtdHost = ${cfg.mgmtdHost}
    connAuthFile = ${cfg.connAuthFile}
    connPortShift = ${toString cfg.connPortShift}
    storeAllowFirstRunInit = false

    ${cfg.meta.extraConfig}
  '';

  configStorage = name: cfg: pkgs.writeText "storage-${name}.conf" ''
    storeStorageDirectory = ${cfg.storage.storeDir}
    sysMgmtdHost = ${cfg.mgmtdHost}
    connAuthFile = ${cfg.connAuthFile}
    connPortShift = ${toString cfg.connPortShift}
    storeAllowFirstRunInit = false

    ${cfg.storage.extraConfig}
  '';

  configHelperd = name: cfg: pkgs.writeText "helperd-${name}.conf" ''
    connAuthFile = ${cfg.connAuthFile}
    ${cfg.helperd.extraConfig}
  '';

  configClientFilename = name: "/etc/beegfs/client-${name}.conf";

  configClient = name: cfg: ''
    sysMgmtdHost = ${cfg.mgmtdHost}
    connAuthFile = ${cfg.connAuthFile}
    connPortShift = ${toString cfg.connPortShift}

    ${cfg.client.extraConfig}
  '';

  serviceList = [
    { service = "admon"; cfgFile = configAdmon; }
    { service = "meta"; cfgFile = configMeta; }
    { service = "mgmtd"; cfgFile = configMgmtd; }
    { service = "storage"; cfgFile = configStorage; }
  ];

#########################################################################################
  # functions to generate systemd.service entries
  # ANCIENT WAY TO GENERATE THE SYSTEM SERVICES
#########################################################################################
  systemdEntry = service: cfgFile: (mapAttrs'
    (name: cfg:
      (nameValuePair "beegfs-${service}-${name}" (mkIf cfg.${service}.enable {
        wantedBy = [ "multi-user.target" ];
        requires = [ "network-online.target" ];
        after = [ "network-online.target" ];
        serviceConfig = rec {
          # pkgs.beegfs n'existe pas
          # On tente des technologies ici
          # ${pkgs.beegfs}/bin/beegfs-${service} \
          ExecStart = ''
            ${pkgs.nur.repos.kapack.beegfs}/bin/beegfs-${service} \
            cfgFile=/etc/beegfs/beegfs-${service}.conf \
            pidFile=/run/beegfs-${service}-${name}.pid
          '';
        };

        # # ${cfgFile name cfg} \ # OU /etc/beegfs/ IL FAUDRA PRENDRE LA VERSION QUI A ETE MODIFIER
        # PIDFile = "/run/beegfs-${service}-${name}.pid";
        # TimeoutStopSec = "300";

      })))
    cfg);


  systemdHelperd = mapAttrs'
    (name: cfg:
      (nameValuePair "beegfs-helperd-${name}" (mkIf cfg.client.enable {
        wantedBy = [ "multi-user.target" ];
        requires = [ "network-online.target" ];
        after = [ "network-online.target" ];
        serviceConfig = rec {
          # pkgs.beegfs n'existe pas
          # ${pkgs.beegfs}/bin/beegfs-helperd \
          # dans sur on remplacera par pkgs.nur.repos.kapack.beegfs
          # /run/current-system/sw/ semble marche mais est impur je croie
          ExecStart = ''
            ${pkgs.nur.repos.kapack.beegfs}/bin/beegfs-helperd \
            cfgFile=${configHelperd name cfg} \
            pidFile=${PIDFile}
          '';
          PIDFile = "/run/beegfs-helperd-${name}.pid";
          TimeoutStopSec = "300";
        };
      })))
    cfg;
#########################################################################################

  # wrappers to beegfs tools. Avoid typing path of config files
  utilWrappers = mapAttrsToList
    (name: cfg:
      (pkgs.runCommand "beegfs-utils-${name}"
        {
          nativeBuildInputs = [ pkgs.makeWrapper ];
          preferLocalBuild = true;
          # pkgs.beegfs n'existe pas
        } ''
        mkdir -p $out/bin

        makeWrapper ${pkgs.nur.repos.kapack.beegfs}/bin/beegfs-check-servers \
                    $out/bin/beegfs-check-servers-${name} \
                    --add-flags "-c ${configClientFilename name}" \
                    --prefix PATH : ${lib.makeBinPath [ pkgs.nur.repos.kapack.beegfs ]}

        makeWrapper ${pkgs.nur.repos.kapack.beegfs}/bin/beegfs-ctl \
                    $out/bin/beegfs-ctl-${name} \
                    --add-flags "--cfgFile=${configClientFilename name}"

        makeWrapper ${pkgs.nur.repos.kapack.beegfs}/bin/beegfs-ctl \
                    $out/bin/beegfs-df-${name} \
                    --add-flags "--cfgFile=${configClientFilename name}" \
                    --add-flags --listtargets  \
                    --add-flags --hidenodeid \
                    --add-flags --pools \
                    --add-flags --spaceinfo

        makeWrapper ${pkgs.nur.repos.kapack.beegfs}/bin/beegfs-fsck \
                    $out/bin/beegfs-fsck-${name} \
                    --add-flags "--cfgFile=${configClientFilename name}"
      ''
      ))
    cfg;
in
{
  ###### interface

  options = {
    services.beegfsEnable_mod = mkEnableOption "BeeGFS";

    services.beegfs_mod = mkOption {
      default = { };
      description = ''
        BeeGFS configurations. Every mount point requires a separate configuration.
      '';
      type = with types; attrsOf (submodule ({ ... }: {
        options = {
          mgmtdHost = mkOption {
            type = types.str;
            default = null;
            example = "master";
            description = ''Hostname of managament host.'';
          };

          connAuthFile = mkOption {
            type = types.str;
            default = "";
            example = "/etc/my.key";
            description = "File containing shared secret authentication.";
          };

          connPortShift = mkOption {
            type = types.int;
            default = 0;
            example = 5;
            description = ''
              For each additional beegfs configuration shift all
              service TCP/UDP ports by at least 5.
            '';
          };

          client = {
            enable = mkEnableOption "BeeGFS client";

            mount = mkOption {
              type = types.bool;
              default = true;
              description = "Create fstab entry automatically";
            };

            mountPoint = mkOption {
              type = types.str;
              default = "/run/beegfs";
              description = ''
                Mount point under which the beegfs filesytem should be mounted.
                If mounted manually the mount option specifing the config file is needed:
                cfgFile=/etc/beegfs/beegfs-client-&lt;name&gt;.conf
              '';
            };

            extraConfig = mkOption {
              type = types.lines;
              default = "";
              description = ''
                Additional lines for beegfs-client.conf.
                See documentation for further details.
              '';
            };
          };

          helperd = {
            enable = mkOption {
              type = types.bool;
              default = true;
              description = ''
                Enable the BeeGFS helperd.
                The helpered is need for logging purposes on the client.
                Disabling <literal>helperd</literal> allows for runing the client
                with <literal>allowUnfree = false</literal>.
              '';
            };

            extraConfig = mkOption {
              type = types.lines;
              default = "";
              description = ''
                Additional lines for beegfs-helperd.conf. See documentation
                for further details.
              '';
            };
          };

          mgmtd = {
            enable = mkEnableOption "BeeGFS mgmtd daemon";

            storeDir = mkOption {
              type = types.path;
              default = null;
              example = "/data/beegfs-mgmtd";
              description = ''
                Data directory for mgmtd.
                Must not be shared with other beegfs daemons.
                This directory must exist and it must be initialized
                with beegfs-setup-mgmtd, e.g. "beegfs-setup-mgmtd -C -p &lt;storeDir&gt;"
              '';
            };

            extraConfig = mkOption {
              type = types.lines;
              default = "";
              description = ''
                Additional lines for beegfs-mgmtd.conf. See documentation
                for further details.
              '';
            };
          };

          admon = {
            enable = mkEnableOption "BeeGFS admon daemon";

            extraConfig = mkOption {
              type = types.lines;
              default = "";
              description = ''
                Additional lines for beegfs-admon.conf. See documentation
                for further details.
              '';
            };
          };

          meta = {
            enable = mkEnableOption "BeeGFS meta data daemon";

            storeDir = mkOption {
              type = types.path;
              default = null;
              example = "/data/beegfs-meta";
              description = ''
                Data directory for meta data service.
                Must not be shared with other beegfs daemons.
                The underlying filesystem must be mounted with xattr turned on.
                This directory must exist and it must be initialized
                with beegfs-setup-meta, e.g.
                "beegfs-setup-meta -C -s &lt;serviceID&gt; -p &lt;storeDir&gt;"
              '';
            };

            extraConfig = mkOption {
              type = types.str;
              default = "";
              description = ''
                Additional lines for beegfs-meta.conf. See documentation
                for further details.
              '';
            };
          };

          storage = {
            enable = mkEnableOption "BeeGFS storage daemon";

            storeDir = mkOption {
              type = types.path;
              default = null;
              example = "/data/beegfs-storage";
              description = ''
                Data directories for storage service.
                Must not be shared with other beegfs daemons.
                The underlying filesystem must be mounted with xattr turned on.
                This directory must exist and it must be initialized
                with beegfs-setup-storage, e.g.
                "beegfs-setup-storage -C -s &lt;serviceID&gt; -i &lt;storageTargetID&gt; -p &lt;storeDir&gt;"
              '';
            };

            extraConfig = mkOption {
              type = types.str;
              default = "";
              description = ''
                Addional lines for beegfs-storage.conf. See documentation
                for further details.
              '';
            };
          };
        };
      }));
    };
  };

  ###### implementation

  config =
    mkIf config.services.beegfsEnable_mod {

      environment.systemPackages = utilWrappers;

      # Put the client.conf files in /etc since they are needed
      # by the commandline tools
      environment.etc = mapAttrs'
        (name: cfg:
          (nameValuePair "beegfs/client-${name}.conf" (mkIf (cfg.client.enable)
            {
              enable = true;
              text = configClient name cfg;
            })))
        cfg;

      # KERNEL MODULE IS DEALT WITH DIRECTLY IN THE COMPOSITION
      # BECAUSE IT REQUIRE A DIFFRENT KERNEL VERSION
      # Kernel module, we need it only once per host.
      # boot = mkIf (
      #   foldr (a: b: a || b) false
      #     (map (x: x.client.enable) (collect (x: x ? client) cfg)))
      # {
      #   kernelModules = [ "beegfs" ]; ## FIXME ??
      #   extraModulePackages = [ beegfs_driver ]; # NUR
      # };

      # generate fstab entries
      fileSystems = mapAttrs'
        (name: cfg:
          (nameValuePair cfg.client.mountPoint (optionalAttrs cfg.client.mount (mkIf cfg.client.enable {
            device = "beegfs_nodev";
            fsType = "beegfs";
            mountPoint = cfg.client.mountPoint;
            options = [ "cfgFile=${configClientFilename name}" "_netdev" ];
          }))))
        cfg;


      # ANCIENT WAY FOR GENERATING SYSTEMD SERVICES
      # generate systemd services
      # systemd.services = systemdHelperd //
      #   foldr (a: b: a // b) {}
      #     (map (x: systemdEntry x.service x.cfgFile) serviceList);


      ## MANAGEMENT SERVICE INITALISATION
      # ALL THE FILE WILL BE CORRECTLY CHANGED
      # ALL REMAINING IS THE EXCUTE THE COMMAND **beegfs-mgmtd cfgFile=/etc/beegfs/beegfs-mgmtd.conf pidFile=/run/beegfs-mgmtd-default.pid**
      # FOR THE SERVICE DO BE EFFECTIVELY RUNNING
      systemd.services.start_mgmtd = mkIf (cfg.default.mgmtd.enable) {
        wantedBy = [ "multi-user.target" ];
        requires = [ "network-online.target" ];
        after = [ "network-online.target" ];
        serviceConfig.Type = "oneshot";
        path = [ ];
        script = ''
          mkdir -p ${cfg.default.mgmtd.storeDir};

          cp ${pkgs.nur.repos.kapack.beegfs}/share/doc/beegfs/beegfs-mgmtd.conf /etc/beegfs/;
        
          ${pkgs.nur.repos.kapack.beegfs}/bin/beegfs-setup-mgmtd -p ${cfg.default.mgmtd.storeDir}
        '';
      };

      #     ${pkgs.nur.repos.kapack.beegfs}/bin/beegfs-mgmtd cfgFile=/etc/beegfs/beegfs-mgmtd.conf pidFile=/run/beegfs-mgmtd-default.pid

      ## METADATA SERVICE INITALISATION
      # USE CP TO GATHER THE BASE OF CONF FILE IN THE **/nix/store/beegfs7.3/shared/doc/beegfs-meta.conf in the /etc/beegfs folder**
      # USE THSIS COMMAND TO FREE THE WANTED DISK FS (HERE sda5) **dd if=/dev/zero of=/dev/sda5 bs=1M**
      # USE THIS COMAND TO ADD ext4 TO THE FS WITH THE CORRECT OPTIONS **mkfs.ext4 /dev/sda5** and **mount -o user_xattr /dev/sda5 <store directory>**
      # AFTER THAT YOU CAN INITIALIZE THE SERVICE WITH THE COMMAND **beegfs-meta cfgFile=/etc/beegfs/beegfs-meta.conf pidFile=/run/beegfs-meta-default.pid**
      systemd.services.start_meta = mkIf (cfg.default.meta.enable) {
        wantedBy = [ "multi-user.target" ];
        requires = [ "start_mgmtd.service" ];
        after = [ "start_mgmtd.service" ];
        serviceConfig.Type = "oneshot";
        path = [ ];
        script = ''
          mkdir -p ${cfg.default.meta.storeDir};
          ${pkgs.e2fsprogs}/bin/mkfs.ext4 -L data ${cfg.default.meta.storeDir};
          ${pkgs.coreutils}/bin/tune2fs -o user_xattr ${cfg.default.meta.storeDir};

          cp ${pkgs.nur.repos.kapack.beegfs}/share/doc/beegfs/beegfs-meta.conf /etc/beegfs/;

          ${pkgs.nur.repos.kapack.beegfs}/bin/beegfs-setup-meta -p ${cfg.default.meta.storeDir} -s 66 -m ${cfg.default.mgmtdHost}    
        '';
      };

      ## STORAGE SERVICE INITALISATION
      # ALL THE FILE WILL BE CORRECTLY CHANGED
      # ALL REMAINING IS THE EXCUTE THE COMMAND **beegfs-storage cfgFile=/etc/beegfs/beegfs-storage.conf pidFile=/run/beegfs-storage-default.pid**
      # FOR THE SERVICE DO BE EFFECTIVELY RUNNING
      systemd.services.start_storage = mkIf (cfg.default.storage.enable) {
        wantedBy = [ "multi-user.target" ];
        requires = [ "start_mgmtd.service" ];
        after = [ "start_mgmtd.service" ];
        serviceConfig.Type = "oneshot";
        path = [ ];
        script = ''     
          mkdir -p ${cfg.default.storage.storeDir};

          cp ${pkgs.nur.repos.kapack.beegfs}/share/doc/beegfs/beegfs-storage.conf /etc/beegfs/;

          ${pkgs.nur.repos.kapack.beegfs}/bin/beegfs-setup-storage -p ${cfg.default.storage.storeDir} -s 99 -i 399 -m ${cfg.default.mgmtdHost}     
        '';
      };

      ## STORAGE SERVICE INITALISATION
      # ALL THE FILE WILL BE CORRECTLY CHANGED
      systemd.services.start_client = mkIf (cfg.default.client.enable) {
        wantedBy = [ "multi-user.target" ];
        requires = [ "start_mgmtd.service" "start_meta.service" "start_storage.service" ];
        after = [ "start_mgmtd.service" "start_meta.service" "start_storage.service" ];
        serviceConfig.Type = "oneshot";
        path = [ ];
        script = ''    
          mkdir -p ${cfg.default.client.mountPoint};
          touch /etc/beegfs/beegfs-mounts.conf;
          echo "${cfg.default.client.mountPoint} ${configClientFilename "default"}" >> /etc/beegfs/beegfs-mounts.conf;

          cp ${pkgs.nur.repos.kapack.beegfs}/share/doc/beegfs/beegfs-client.conf /etc/beegfs/;

          ${pkgs.nur.repos.kapack.beegfs}/bin/beegfs-setup-client -m ${cfg.default.mgmtdHost};       
        '';
      };

    };
}
