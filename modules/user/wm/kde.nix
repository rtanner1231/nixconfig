{
  pkgs,
  lib,
  osConfig,
  ...
}:
{
  config = lib.mkIf (osConfig.desktop.environment == "kde") {

    # KDE-specific packages
    home.packages = with pkgs; [
      kdePackages.konsole
      kdePackages.dolphin
      kdePackages.spectacle
      kdePackages.kate
    ];

    # Example of KDE theme configuration (optional)
    qt = {
      enable = true;
      platformTheme = "kde";
      style.name = "breeze";
    };
  };
}
