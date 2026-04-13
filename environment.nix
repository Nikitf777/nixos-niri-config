{ config, pkgs, inputs, ... }:
{
  environment = {
    shells = [
      pkgs.nushell
    ];

    sessionVariables = rec {
      EDITOR  = "edit";
    };

    systemPackages = with pkgs; [
      # System
      home-manager
      distrobox
      gpg-tui
      pinentry-all
      file
      ddcutil

      # Terminal
      msedit
      nushell
      zellij
      tmux
      neovim
      bat
      ripgrep
      btop
      nvtopPackages.full
      wl-clipboard
      jq
      yazi
      fd
      television
      wget
      fastfetch

      # Development
      nil
      git
      lazygit
      jujutsu
      lazyjj
      jjui
      gg-jj
      gcc
      clang
      meson
      cmake
      rustup
      rust-analyzer
      python3
      vala
      typescript
      nodejs_25
      deno
      bun
      dotnet-sdk_10
      dotnet-aspnetcore_10
      jdk25
      go
      zig
      docker
      podman
      mise
      devbox
      sqlite
      lazysql
      sqlit-tui
      qwen-code
    ];
  };
}
