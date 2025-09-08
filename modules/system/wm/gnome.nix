{ lib,config,... }: {
  options.desktop.gnome.enable = lib.mkEnableOption "the Gnome Desktop Environment";

  config=lib.mkIf (config.desktop.environment=="gnome") {
    services.xserver.enable = true;
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
  };
}
