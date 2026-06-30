#!/usr/bin/env nu

let light_bg = (
    ls /run/current-system/sw/share/backgrounds/light/
        | get name
        | first
)
let dark_bg = (
    ls /run/current-system/sw/share/backgrounds/dark/
    | get name
    | first
)

jq --arg light $light_bg --arg dark $dark_bg '
  .wallpaperPath = $light |
  .wallpaperPathLight = $light |
  .wallpaperPathDark = $dark
' graphical/desktop/config/DankMaterialShell/session.json
    | save -f ~/.local/state/DankMaterialShell/session.json

cp -v graphical/desktop/config/DankMaterialShell/settings.json ~/.config/DankMaterialShell/settings.json

dms restart
