{ config, lib,pkgs, ... }:

# This gets the desktop choice from your system config (`desktop.nix`)
let 
desktop = config.desktop.environment;
in
{
  # Import the correct home-manager module based on the desktop choice
  imports = [
    ./modules/user/wm/kde.nix
    ./modules/user/wm/gnome.nix
    ./modules/user/wm/hyprland.nix
    ./modules/user/apps/neovim.nix
    ./modules/user/apps/git.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rick";
  home.homeDirectory = "/home/rick";

  # Basic user packages that are always installed
  home.packages = with pkgs; [
    firefox
    htop
    nerd-fonts.fira-code
    cargo
    fd
    ripgrep
    fzf
  ];

  fonts.fontconfig.enable = true;

  # Nicely reload systemd units when changing configs.
  systemd.user.startServices = "sd-switch";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "23.11";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
