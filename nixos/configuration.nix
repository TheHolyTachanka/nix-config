# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-b86c39ea-098c-493e-92d9-964c2c08cbff".device = "/dev/disk/by-uuid/b86c39ea-098c-493e-92d9-964c2c08cbff";
  boot.initrd.luks.devices."luks-b86c39ea-098c-493e-92d9-964c2c08cbff".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  system.autoUpgrade.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Sofia";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  
  # Enable nvidia drivers
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable; 
  hardware.opengl.driSupport = true; 
  hardware.pulseaudio.support32Bit = true;
  boot.kernelParams = ["nvidia_drm.modeset=1"];

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.wayland = false;
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.theholytachanka = {
    isNormalUser = true;
    description = "TheHolyTachanka";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      brave # Based browser
      gnomeExtensions.blur-my-shell # Adds nice blur 
      gnomeExtensions.gsconnect # Integrations with your phone
      gnomeExtensions.appindicator # Adds "legacy" support for tray-apps
      gnomeExtensions.fuzzy-app-search # Adds fuzzy search
      vlc # For playing legally obtained media
      qbittorrent # For obtaining media... legally
      vscode-fhs # Dev stuff
      neovim # Better dev stuff
      lutris # Gaming
      adw-gtk3 # Nice looking theme
      gnome.gnome-tweaks # Tweaks for gnome
      thefuck # Corrects your commands
      python39Packages.pip # Python package manager(Complete trash)
      python39 # Python... a programming language
      grc # Adds colors to your terminal
      davinci-resolve # Best video editor
      grapejuice # Roblox
      prismlauncher # Minecraft
    ];
  };
  # Enabling ZSH(the best shell)
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  neovim
  steam-run
  (lutris.override {
      extraLibraries =  pkgs: [
        libgdiplus
        libdrm
        libGL
        libva
      ];
    })
  ];

  # Enabling steam
  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
};
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        libgdiplus
        libdrm
        libGL
        libva
      ];
    };
  };

      environment.sessionVariables = rec {
      XDG_CACHE_HOME  = "\${HOME}/.cache";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_BIN_HOME    = "\${HOME}/.local/bin";
      XDG_DATA_HOME   = "\${HOME}/.local/share";
      # Steam needs this to find Proton-GE
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
      # note: this doesn't replace PATH, it just adds this to it
      PATH = [ 
        "\${XDG_BIN_HOME}"
      ];
    };

  # Enabling flatpak(Mostly for bottles)
  services.flatpak.enable = true;

  # Keeping only the last 10 generations
  nix.gc.automatic = true;

  # Enabling experimental features
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
networking.firewall.allowedTCPPortRanges = [
  # KDE Connect
  { from = 1714; to = 1764; }
  # Legally downloading media
  { from = 6881; to = 6999; }
  # Vlc server
  { from = 4212; to = 4212; }
];
networking.firewall.allowedUDPPortRanges = [
  # KDE Connect
  { from = 1714; to = 1764; }
  # Legally downloading media
  { from = 6881; to = 6999; }
];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
