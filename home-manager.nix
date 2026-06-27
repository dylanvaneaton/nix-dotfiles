{ pkgs, ... }:

let
  home-manager = fetchTarball "https://github.com/nix-community/home-manager/archive/release-26.05.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.psparks = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
      gnomeExtensions.dash-to-dock
      gnome-tweaks
      trash-cli
      vim
      ghostty
      starship
      vscode
      nixfmt
      discord
      spotify
      devenv
      nixd
    ];

    programs.bash = {
      enable = true;
      initExtra = ''
        eval "$(starship init bash)"
      '';
    };

    programs.git = {
      enable = true;
      settings = {
        user.name = "psparks";
        user.email = "psparks1225@gmail.com";
      };
    };

    dconf.settings = {
      "org/gnome/desktop/sound" = {
        event-sounds = false;
      };
    };

    xsession = {
      enable = true;
      windowManager.command = "gnome-shell";
    };

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatiblehanges.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "26.05"; # Please read the comment before changing.
  };

  home-manager.backupCommand = "${pkgs.trash-cli}/bin/trash-put";
}
