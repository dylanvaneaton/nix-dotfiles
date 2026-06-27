{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    vscode
    gnome-tweaks
    gnomeExtensions.dash-to-dock
    pkgs.discord
    pkgs.ghostty
    pkgs.starship
    pkgs.devenv
    pkgs.openssl
    pkgs.nixfmt
  ];

  programs.firefox.enable = true;
  programs.direnv.enable = true;
}
