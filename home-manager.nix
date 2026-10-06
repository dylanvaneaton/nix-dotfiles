{ pkgs, inputs, ... }:

{
  imports = [ inputs.home-manager.nixosModules.default ];

  home-manager.users.dylan = { pkgs, ... }: {
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
      dbeaver-bin
      nodejs
      pnpm
      bun
      bruno
      obsidian
      imagemagick
      dig
      obs-studio
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
        user.name = "dylan";
        user.email = "dylanvaneaton@gmail.com";
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

    home.stateVersion = "26.05";
  };

  home-manager.backupCommand = "${pkgs.trash-cli}/bin/trash-put";
}
