{ config, pkgs, ... }:


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
    rebuild = "home-manager switch --flake /home/theholytachanka/Documents/nix-config/ && sudo nixos-rebuild switch --flake /home/theholytachanka/Documents/nix-config/";
    update = "sudo nixos-rebuild switch --upgrade";
    grep = "rg";
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
  ];
};