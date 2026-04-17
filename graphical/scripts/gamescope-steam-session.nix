{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "gamescope-steam-session";
  runtimeInputs = [
    pkgs.gamescope
    pkgs.steam
  ];
  text = builtins.readFile ./gamescope-steam-session.sh;
}
