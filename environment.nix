{
  config,
  pkgs,
  inputs,
  ...
}:
{
  environment = {
    shells = [
      pkgs.nushell
    ];

    sessionVariables = {
      EDITOR = "edit";
    };

    systemPackages = with pkgs; [
      # System
      home-manager
      distrobox
      gpg-tui
      pinentry-all
      file
      ddcutil
      pciutils
      usbutils
      inotify-tools
      keyd

      # Terminal
      tree
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
      dig
      fastfetch
      imagemagick
      unzip
      gz-utils
      xz

      # Development
      nixd
      nil
      git
      github-cli
      glab
      gh-dash
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
      mise
      devbox
      sqlite
      lazysql
      sqlit-tui
      qwen-code
    ];
  };
}
