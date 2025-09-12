{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.desktop.kde.enable = lib.mkEnableOption "the KDE Plasma Desktop Environment";

  config = lib.mkIf (config.desktop.environment == "kde") {
    # Required to make the SDF cli work
    services.gvfs.enable = true;
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
    security.pam.services.sddm.enableGnomeKeyring = true;
  };
}
