{ pkgs,lib,osConfig, ... }: {
  config= lib.mkIf (osConfig.desktop.environment=="gnome") {

	  # GNOME-specific packages
	  home.packages = with pkgs; [
	    gnome-tweaks
	    gnome-console
	    nautilus
	  ];

	 home.pointerCursor = {
		gtk.enable = true;
		package = pkgs.bibata-cursors;
		name = "Bibata-Modern-Ice";
		size = 22;
	 };
  };
}
