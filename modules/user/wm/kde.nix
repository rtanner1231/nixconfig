{ pkgs, ... }: {
  # KDE-specific packages
  home.packages = with pkgs; [
    konsole
    dolphin
    spectacle
    kate
  ];

  # Example of KDE theme configuration (optional)
  qt = {
    enable = true;
    platformTheme = "kde";
    style.name = "breeze";
  };
}
