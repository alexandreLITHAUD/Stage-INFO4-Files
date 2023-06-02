{ stdenv
, lib
, fetchurl
, which
, kmod
, kernel
}:

## This file is a copy of the kernel module used by the client
## This version is working but it is preferable to use the file at the nxc folder
## It is better not to store the file in the nur repository 

let
  version = "7.3";
in
stdenv.mkDerivation {
  name = "beegfs-module-${version}-${kernel.version}";

  # src = /home/alex/dev/v7-7.0-d7fc807f40aea0e88afd714cbecee7a0dbadabf7;
  src = fetchurl {
    url = "https://git.beegfs.com/pub/v7/repository/archive.tar.bz2?ref=${version}";
    sha256 = "1wsljd5ybyhl94aqrdfvcs8a0l8w4pr0bs1vhjrf4y7ldhw35m3k";
  };

  hardeningDisable = [ "fortify" "pic" "stackprotector" ];

  nativeBuildInputs = [ which kmod ];

  buildInputs = kernel.moduleBuildDependencies;

  BEEGFS_VERSION = version;

  makeFlags = [
    "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build/"
    "YOP=${kernel.dev}/lib/modules/${kernel.modDirVersion}"
  ];

  #"BEEGFS_BUILDDIR=client_module/build"
  # "KERNELRELEASE=${kernel.modDirVersion}"
  # "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build/"
  # "KSRCDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/source/" ## WO -> PERMISSION DENIED || /source
  # "YOP=${kernel.dev}/lib/modules/${kernel.modDirVersion}"
  # "INSTALL_MOD_PATH=$(out)"
  # "RELEASE_PATH=$(out)" 
  # "KDIR_PRUNED_HEAD=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build/include/generated/uapi/linux/version.h"
  # "KSRCDIR_PRUNED_HEAD=${kernel.dev}/lib/modules/${kernel.modDirVersion}/source/"
  # "KDIR_PRUNED_HEAD=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build/"

  # "KERNEL_DIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build/"
  # "INSTALL_MOD_PATH=$(out)"

  NIX_CFLAGS_COMPILE = "-Wno-error=implicit-function-declaration";

  postPatch = ''
    patchShebangs ./
    find -type f -name Makefile -exec sed -i "s:/bin/bash:${stdenv.shell}:" \{} \;
    find -type f -name Makefile -exec sed -i "s:/bin/true:true:" \{} \;
    find -type f -name "*.mk" -exec sed -i "s:/bin/true:true:" \{} \;
  '';

  preBuild = "cd client_module/build";

  installPhase = ''
    instdir=$out/lib/modules/${kernel.modDirVersion}/extras/fs/beegfs
    mkdir -p $instdir
    cp beegfs.ko $instdir
  '';

  meta = with lib; {
    description = "High performance distributed filesystem with RDMA support";
    homepage = "https://www.beegfs.io";
    platforms = [ "i686-linux" "x86_64-linux" ];
    license = licenses.gpl2;
    maintainers = with maintainers; [ markuskowa ];
    broken = false;
  };
}
