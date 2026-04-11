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
      fd
      television

      # Development
      git
      lazygit
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
