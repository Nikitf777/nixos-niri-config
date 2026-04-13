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
    version = "0.10.9.1";
    src = pkgs.fetchurl {
      url = "https://github.com/imputnet/helium-linux/releases/download/0.10.9.1/helium-0.10.9.1-x86_64.AppImage";
      sha256 = "14c3b8801db33a38609a37c4fd3d177436f434c0cab1016ecf2fceae0d620f8f";
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

    sessionVariables = rec {
      EDITOR = "edit";
    };

    systemPackages =
      with pkgs;
      [
        # Desktoop
        xwayland-satellite
        zenity
        ghostty
        gnome-terminal
        gnome-console

        # General-purpose GUI apps
        nautilus
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
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      ]
      ++ [
        helium
      ];
  };
}
