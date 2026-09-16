{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
    openssl
  ];

  programs.firefox.enable = true;
  programs.direnv.enable = true;
  programs.nix-ld.enable = true;
}
