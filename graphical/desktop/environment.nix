{
  config,
  pkgs,
  inputs,
  ...
}:
let
  helium-icon = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/imputnet/helium/refs/heads/main/resources/branding/product_logo.svg";
    sha256 = "0qhxnfpymdx3j4h8f9zrd1ld8yk9hw7abjqixzpn9652i7i5r0yy";
  };

  helium = pkgs.appimageTools.wrapType2 {
    pname = "helium";
    version = "0.12.3.1";
    src = pkgs.fetchurl {
      url = "https://github.com/imputnet/helium-linux/releases/download/0.12.3.1/helium-0.12.3.1-x86_64.AppImage";
      sha256 = "5673a1ce102e96f14d041ff4003d5df8afd3cdf14bf59c2d93fbdc9b9bd697e2";
    };
    extraInstallCommands = ''
            # Install the icon
            install -Dm444 ${helium-icon} "$out/share/icons/hicolor/scalable/apps/helium.svg"

            # Create the desktop file
            mkdir -p "$out/share/applications"
            cat > "$out/share/applications/helium.desktop" << 'EOF'
      [Desktop Entry]
      Name=Helium
      GenericName=Web Browser
      Exec=helium %U
      Icon=helium
      Type=Application
      Categories=Network;WebBrowser;
      MimeType=text/html;x-scheme-handler/http;x-scheme-handler/https;
      EOF
            chmod 444 "$out/share/applications/helium.desktop"
    '';
  };
in
{
  environment = {
    shells = [
      pkgs.nushell
    ];

    etc."niri/config.kdl".source = ./config/niri/global.kdl;
    etc."niri/window-close-animation.kdl".source = ./config/niri/window-close-animation.kdl;
    etc."niri/window-open-animation.kdl".source = ./config/niri/window-open-animation.kdl;

    sessionVariables = {
      EDITOR = "edit";
    };

    pathsToLink = [
      "/share"
    ];

    systemPackages =
      with pkgs;
      [
        # Desktoop
        webkitgtk_4_1
        xwayland-satellite
        adwaita-fonts
        adwaita-icon-theme
        zenity
        ghostty

        # General-purpose GUI apps
        nautilus
        nautilus-python
        code-nautilus
        file-roller
        wifi-qr
        bazaar
        distroshelf
        mission-center
        resources
        libreoffice
        clapper
        gnome-tweaks
        gnome-text-editor
        gnome-disk-utility
        papers
        gnome-font-viewer
        gnome-calendar
        gnome-calculator
        decibels
        baobab
        loupe
        snapshot
        pinta
        gradia
        video-trimmer

        # Gaming
        heroic

        # Development (GUI)
        github-desktop
        gitbutler
        vscode
        zed-editor
        devtoolbox
        godot
        godot-mono

        # Internet (GUI)
        google-chrome
        telegram-desktop
        discord
      ]
      ++ [
        helium
      ];
  };
}
