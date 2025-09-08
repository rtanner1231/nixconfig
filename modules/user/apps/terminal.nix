{config,pkgs,...}:
let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
    home.packages=with pkgs; [
        ghostty
        tmux
    ];

    xdg.configFile."tmux"={
        source=create_symlink "${dotfiles}/.config/tmux";
        recursive = true;
    };

    xdg.configFile."ghostty"={
        source=create_symlink "${dotfiles}/.config/ghostty";
        recursive = true;
    };

}
