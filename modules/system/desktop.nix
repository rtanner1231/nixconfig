{ lib, config, ... }:
let
  cfg=config.desktop;
in
{
  # Create a custom option for our desktop switch
  options.desktop.environment = lib.mkOption {
    type = lib.types.enum [ "kde" "gnome" "hyprland" ];
    default = "kde"; 
    description = "The desktop environment to use.";
  };

  # Conditionally import the correct desktop module
  imports = [
    ./wm/kde.nix
    ./wm/gnome.nix
    ./wm/hyprland.nix
  ];

  config = {
     desktop.kde.enable = lib.mkIf (cfg.environment=="kde") true;
     desktop.gnome.enable = lib.mkIf (cfg.environment=="gnome") true;
     desktop.hyprland.enable = lib.mkIf (cfg.environment=="hyprland") true;
  };
}
