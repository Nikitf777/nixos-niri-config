{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  boot.kernelPackages = pkgs.linuxPackages_6_18;
  boot.kernelPatches =
    let
      patchesDir = "${inputs.bore-scheduler-src}/patches/stable/linux-${lib.versions.majorMinor config.boot.kernelPackages.kernel.version}-bore";
    in
    lib.mapAttrsToList (name: _: {
      name = "bore-${name}";
      patch = "${patchesDir}/${name}";
    }) (builtins.readDir patchesDir);
}
