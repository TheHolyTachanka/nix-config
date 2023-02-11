# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "bg+phonetic" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      gtk-theme = "adw-gtk3-dark";
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "org-gnome-console" "code" ];
      show-in-lock-screen = false;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      speed = -1.0;
    };

    "org/gnome/desktop/privacy" = {
      disable-camera = true;
      disable-microphone = true;
      old-files-age = mkUint32 2;
      recent-files-max-age = -1;
      remember-recent-files = false;
      remove-old-temp-files = true;
      remove-old-trash-files = true;
      report-technical-problems = false;
    };

    "org/gnome/desktop/screensaver" = {
      lock-enabled = false;
    };


    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = false;
      night-light-schedule-from = 0.0;
      night-light-schedule-to = 0.0;
      night-light-temperature = mkUint32 1700;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/shell" = {
      app-picker-layout = "[{'org.gnome.Geary.desktop': <{'position': <0>}>, 'org.gnome.Contacts.desktop': <{'position': <1>}>, 'org.gnome.Weather.desktop': <{'position': <2>}>, 'org.gnome.clocks.desktop': <{'position': <3>}>, 'org.gnome.Maps.desktop': <{'position': <4>}>, 'org.gnome.Extensions.desktop': <{'position': <5>}>, 'org.gnome.Photos.desktop': <{'position': <6>}>, 'org.gnome.Totem.desktop': <{'position': <7>}>, 'org.gnome.Calculator.desktop': <{'position': <8>}>, 'simple-scan.desktop': <{'position': <9>}>, 'org.gnome.Settings.desktop': <{'position': <10>}>, 'gnome-system-monitor.desktop': <{'position': <11>}>, 'cups.desktop': <{'position': <12>}>, 'nixos-manual.desktop': <{'position': <13>}>, 'Utilities': <{'position': <14>}>, 'org.gnome.TextEditor.desktop': <{'position': <15>}>, 'yelp.desktop': <{'position': <16>}>, 'org.gnome.Tour.desktop': <{'position': <17>}>, 'org.gnome.Cheese.desktop': <{'position': <18>}>, 'xterm.desktop': <{'position': <19>}>, 'org.gnome.Music.desktop': <{'position': <20>}>, 'org.gnome.Calendar.desktop': <{'position': <21>}>, 'org.gnome.Epiphany.desktop': <{'position': <22>}>}, {'net.lutris.Lutris.desktop': <{'position': <0>}>, 'nvim.desktop': <{'position': <1>}>, 'nvidia-settings.desktop': <{'position': <2>}>, 'org.qbittorrent.qBittorrent.desktop': <{'position': <3>}>, 'steam.desktop': <{'position': <4>}>, 'vlc.desktop': <{'position': <5>}>, 'code.desktop': <{'position': <6>}>}]";
      disable-user-extensions = false;
      disabled-extensions = [];
      enabled-extensions = [ "gsconnect@andyholmes.github.io" "blur-my-shell@aunetx" "appindicatorsupport@rgcjonas.gmail.com" ];
      favorite-apps = [ "code.desktop" "org.gnome.Console.desktop" "brave-browser.desktop" "org.gnome.Nautilus.desktop" ];
      last-selected-power-profile = "performance";
      welcome-dialog-last-shown-version = "43.2";
    };

    "org/gnome/shell/extensions/gsconnect" = {
      id = "dacf6dc4-f039-461c-967a-a03410691b76";
      name = "nixos";
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

  };
}
