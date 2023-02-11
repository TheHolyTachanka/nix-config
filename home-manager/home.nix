{ config, pkgs, ... }:

{
  imports = [
    ./gnome.nix
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


programs.zsh = {
  enable = true;
  enableCompletion = false; # enabled in oh-my-zsh
  shellAliases = {
    ne = "nix-env";
    ni = "nix-env -iA";
    no = "nixops";
    ns = "nix-shell --pure";
    please = "sudo";
    cat = "bat";
    ls = "exa --long --all";
  };
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "thefuck" ];
    theme = "aussiegeek";
  };
  plugins = [
    {
      # will source zsh-autosuggestions.plugin.zsh
      name = "zsh-autosuggestions";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-autosuggestions";
        rev = "v0.4.0";
        sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
      };
    }
    {
      name = "enhancd";
      file = "init.sh";
      src = pkgs.fetchFromGitHub {
        owner = "b4b4r07";
        repo = "enhancd";
        rev = "v2.2.1";
        sha256 = "0iqa9j09fwm6nj5rpip87x3hnvbbz9w9ajgm6wkrd5fls8fn8i5g";
      };
    }
  ];
};


  programs.bat.enable = true;
  programs.exa.enable = true;
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
    pkgs.fishPlugins.pure
    pkgs.fishPlugins.grc
    pkgs.fishPlugins.done
    pkgs.fishPlugins.sponge
    pkgs.fishPlugins.fzf-fish
    pkgs.fishPlugins.colored-man-pages
  ];


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
