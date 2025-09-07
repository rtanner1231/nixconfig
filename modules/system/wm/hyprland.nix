{ pkgs, ... }: {
  # Hyprland is a wayland compositor, so we don't need X11
  services.xserver.enable = false;

  # Enable Hyprland
  programs.hyprland.enable = true;

  # For screen sharing
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

  # Enable a display manager
  services.displayManager.sddm.enable = true;
}
