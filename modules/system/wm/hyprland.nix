{
  lib,
  config,
  pkgs,
  ...
}:
{

  options.desktop.hyprland.enable = lib.mkEnableOption "the Hyperland Desktop Environment";

  config = lib.mkIf (config.desktop.environment == "hyprland") {
    # Hyprland is a wayland compositor, so we don't need X11
    services.xserver.enable = false;
    services.displayManager.sddm.wayland.enable = true;
    # Enable Hyprland
    programs.hyprland.enable = true;

    # For screen sharing
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

    # Enable a display manager
    services.displayManager.sddm.enable = true;
  };
}
