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
      herdr
      neovim
      helix
      fresh-editor
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
      gdb
      clang
      lldb
      meson
      cmake
      rustc
      cargo
      rustfmt
      clippy
      rust-analyzer
      python3
      uv
      vala
      typescript
      nodejs_26
      deno
      bun
      (
        with dotnetCorePackages;
        dotnetCorePackages.combinePackages [
          sdk_8_0
          aspnetcore_8_0
          sdk_10_0
          aspnetcore_10_0
        ]
      )
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
