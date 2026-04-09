{ config, pkgs, inputs, ... }:
let
  helium = pkgs.appimageTools.wrapType2 {
    pname = "helium";
    version = "0.10.9.1";
    src = pkgs.fetchurl {
      url = "https://github.com/imputnet/helium-linux/releases/download/0.10.9.1/helium-0.10.9.1-x86_64.AppImage";
      sha256 = "14c3b8801db33a38609a37c4fd3d177436f434c0cab1016ecf2fceae0d620f8f";
    };
  };
in
{
  environment = {
    etc."niri/config.kdl".source = ./config/niri/global.kdl;

    sessionVariables = rec {
      EDITOR  = "edit";
    };

    systemPackages = with pkgs; [
      # System
      home-manager
      bazaar
      distrobox
      distroshelf
      mission-center
      resources
      gpg-tui
      pinentry-all
      file

      # Desktoop
      xwayland-satellite
      libreoffice
      clapper
      gnome-tweaks

      # Gaming
      heroic

      # Terminal
      ghostty
      msedit
      nushell
      neovim
      bat
      ripgrep
      btop
      nvtopPackages.full
      wl-clipboard
      jq

      # Development
      git
      lazygit
      github-desktop
      gitbutler
      jujutsu
      lazyjj
      jjui
      gg-jj
      gcc
      clang
      cmake
      rustup
      rust-analyzer
      python3
      typescript
      nodejs_25
      deno
      bun
      dotnet-sdk_10
      dotnet-aspnetcore_10
      jdk25
      go
      zig
      vscode
      zed-editor
      devtoolbox
      docker
      podman
      mise
      devbox
      sqlite
      lazysql
      sqlit-tui
      godot
      godot-mono
      qwen-code

      # Internet
      google-chrome
      telegram-desktop
      discord
    ] ++ [
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ] ++ [
      helium
    ];
  };
}
