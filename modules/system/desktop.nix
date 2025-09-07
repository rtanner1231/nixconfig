{ lib, config, ... }:

with lib;
let
  cfg = config.desktop;
in
{
  # Create a custom option for our desktop switch
  options.desktop.environment = mkOption {
    type = types.enum [ "kde" "gnome" "hyprland" ];
    default = "kde"; # <-- CHANGE YOUR DESKTOP HERE
    description = "The desktop environment to use.";
  };

  # Conditionally import the correct desktop module
  imports = [
    (mkIf (cfg.environment == "kde") ./wm/kde.nix)
    (mkIf (cfg.environment == "gnome") ./wm/gnome.nix)
    (mkIf (cfg.environment == "hyprland") ./wm/hyprland.nix)
  ];
}
