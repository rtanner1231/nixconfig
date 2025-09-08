{config,pkgs,...}:
{
  nixpkgs.overlays = [
    # Add a new overlay.
    (final: prev: {
      # Add our custom package to the final package set.
      # It can now be referenced as `pkgs.suitecloud-cli`.
      suitecloud-cli = final.callPackage ../../../pkgs/suitecloud-cli.nix { };
    })
  ];

    home.packages=with pkgs; [
        nodejs
        suitecloud-cli
    ];
}
