{config,pkgs,...}
let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
  home.packages=with pkgs; [
	neovim
	lua-language-server
	typescript-language-server
	bash-language-server
	sqls
	yaml-language-server
  ];

  xdg.configFile={
	source=create_symlink "${dotfiles}/.config/nvim;
	recursive = true;
  }; 

}
