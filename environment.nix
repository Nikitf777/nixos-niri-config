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
      linuxHeaders
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
      jmtpfs

      # Terminal
      tree
      msedit
      nushell
      nushellPlugins.gstat
      nushellPlugins.query
      nushellPlugins.bson
      nushellPlugins.highlight
      nufmt
      zellij
      tmux
      neovim
      bat
      ripgrep
      btop
      lm_sensors
      nvtopPackages.full
      wl-clipboard
      jq
      yazi
      fd
      television
      wget
      yt-dlp
      parabolic
      dig
      inetutils
      fastfetch
      ffmpeg
      imagemagick
      unzip
      gz-utils
      xz
      ttyper
      cmatrix

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
      gnumake
      ninja
      cloc
      gcc
      clang
      meson
      cmake
      rustup
      rust-analyzer
      python3
      uv
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
      opencode
      qwen-code
      podman-tui
      pods
    ];
  };
}
