{ config, pkgs, ... }:

{
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
    pkgs.direnv
    pkgs.openssl
    pkgs.nixfmt
  ];
}
