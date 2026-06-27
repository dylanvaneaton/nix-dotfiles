{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.dash-to-dock
    gnome-tweaks
    vim
    wget
    git
    openssl
    ghostty
    starship
    vscode
    nixfmt
    discord
    spotify
    devenv
  ];

  programs.firefox.enable = true;
  programs.direnv.enable = true;
}
