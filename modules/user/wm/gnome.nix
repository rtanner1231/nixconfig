{ pkgs, ... }: {
  # GNOME-specific packages
  home.packages = with pkgs.gnome; [
    gnome-tweaks
    gnome-console
    nautilus
  ];
}
