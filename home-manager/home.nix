{ config, pkgs, ... }:

{
  imports = [
    ./gnome.nix
    ./zsh.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "theholytachanka";
  home.homeDirectory = "/home/theholytachanka";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  programs.git = {
    enable = true;
    userName  = "TheHolyTachanka";
    userEmail = "TheHolyTachankaYT@proton.me";
  };

  programs.bat.enable = true;
  programs.exa.enable = true;
  programs.ripgrep = {
    enable = true;
  };
  programs.brave = {
    enable = true;
    extensions = [
      "hjdoplcnndgiblooccencgcggcoihigg" # Terms of Service; Didn’t Read
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      "bgfofngpplpmpijncjegfdgilpgamhdk" # Modern scrollbar
      "chphlpgkkbolifaimnlloiipkdnihall" # Onetab
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark reader
      "kfghpdldaipanmkhfpdcjglncmilendn" # Get rss feed
    ];
  };
  home.packages = [
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
