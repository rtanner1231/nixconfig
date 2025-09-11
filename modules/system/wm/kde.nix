{ lib, config, ... }:
{
  options.desktop.kde.enable = lib.mkEnableOption "the KDE Plasma Desktop Environment";

  config = lib.mkIf (config.desktop.environment == "kde") {
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
    security.pam.services.sddm.enableGnomeKeyring = true;
  };
}
