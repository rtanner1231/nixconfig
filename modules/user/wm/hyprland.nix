{ pkgs,lib,osConfig, ... }: {
  config= lib.mkIf (osConfig.desktop.environment=="hyprland") {

	  # Wayland- and Hyprland-specific packages
	  home.packages = with pkgs; [
	    kitty      # Terminal
	    waybar     # Status bar
	    swaybg     # Wallpaper
	    rofi-wayland # App launcher
	    mako       # Notification daemon
	    swaylock   # Screen locker
	  ];

	  # Hyprland configuration
	  wayland.windowManager.hyprland = {
	    enable = true;
	    settings = {
	      # Basic settings and keybindings
	      "$mod" = "SUPER";
	      exec-once = [
		"waybar"
		"swaybg -i /path/to/your/wallpaper.png" # Change this path
	      ];
	      
	      monitor = ",preferred,auto,1";

	      input = {
		kb_layout = "us";
	      };

	      general = {
		gaps_in = 5;
		gaps_out = 20;
		border_size = 2;
		"col.active_border" = "rgb(cdd6f4)";
		"col.inactive_border" = "rgb(1e1e2e)";
		layout = "dwindle";
	      };

	      decoration = {
		rounding = 10;
		blur.enabled = true;
		blur.size = 3;
		blur.passes = 1;
	      };

	      # Keybindings
	      bind = [
		"$mod, RETURN, exec, kitty"
		"$mod, Q, killactive,"
		"$mod, M, exit,"
		"$mod, E, exec, dolphin" # Example file manager
		"$mod, D, exec, rofi -show drun"
		"$mod, L, exec, swaylock"

		# Move focus
		"$mod, left, movefocus, l"
		"$mod, right, movefocus, r"
		"$mod, up, movefocus, u"
		"$mod, down, movefocus, d"

		# Switch workspaces
		"$mod, 1, workspace, 1"
		"$mod, 2, workspace, 2"
		"$mod, 3, workspace, 3"

		# Move active window to a workspace
		"$mod SHIFT, 1, movetoworkspace, 1"
		"$mod SHIFT, 2, movetoworkspace, 2"
		"$mod SHIFT, 3, movetoworkspace, 3"
	      ];
	    };
	  };
  };
}
