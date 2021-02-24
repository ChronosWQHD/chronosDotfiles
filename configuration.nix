{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./vim.nix
    ];

  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
    splashImage = "/home/caspar/Pictures/wallpapers/nix-wallpaper-dracula.png";
  };

  networking = {
    # these 2 options below use networking.wireless, a (in my opinion) less usefull method of
    # doing networking on nixos than networking.networking and nmcli/nmtui. (At least on a laptop)
    # networking.wireless.enable = true;
    # networking.wireless.userControlled.enable = true;

    hostName = "cs";
    networkmanager.enable = true;
    # I dont know if setting that to false does anything and I dont know why I set it to false, but I can't be bothered to change it...
    useDHCP = false;
    # If you want to adopt this config then you should change these names down there. (you could use for example "ifconfig -a")
    interfaces.eno1.useDHCP = true;
    interfaces.wlp3s0.useDHCP = true;
  };


  time.timeZone = "Europe/Zurich";

  # this does some locale settings. Consult the manual for what it does *exactly*.
  # It basically let's me keep my German keymap while setting the language to english everywhere.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "mononoki";
    keyMap = "de";
  };

  services = {
    xserver = {
      # this sets your whole xserver affair: Login stuff, your window manager and desktop environments.
      # I use Lightdm with qtile.
      enable = true;
      # Not working:
      # displayManager.lightdm.background = "/home/caspar/Pictures/wallpapers/nix-wallpaper-dracula.png";
      displayManager.lightdm.enable = true;
      displayManager.defaultSession = "none+qtile";

      windowManager.qtile.enable = true;

      layout = "de";

      # touchpad support
      libinput.enable = true;
      libinput.naturalScrolling = false;
    };
    printing.enable = true;
    # printing.drivers = [ "pkgs.hplip" ];
    openssh.enable = true;
    compton.enable = true;
  };

  fonts = {
    enableDefaultFonts = true;
      fonts = with pkgs; [
        (nerdfonts.override { fonts = [ "Mononoki" ]; })
        pkgs.ubuntu_font_family
        source-code-pro
        source-sans-pro
      ];
      fontconfig = {
        defaultFonts = {
          serif = [ "Ubuntu" ];
          sansSerif = [ "Source Sans Pro Semibold" ];
          monospace = [ "Source Code Pro Semibold" ];
        };
      };
  };

  sound.enable = true;
  sound.mediaKeys.enable = true;
  hardware.pulseaudio.enable = true;

  # Set to own user stuff
  users.users.caspar = {
    isNormalUser = true;
    extraGroups = [ "wheel" "power" "docker" "networkmanager" "vboxusers"];
    shell = pkgs.fish;
  };


  documentation.dev.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;

  # fish shell (better than bash ;)
  programs.fish.enable = true;
  programs.steam.enable = true;
  # Important for using networkmanager
  # See "nmtui" and "nmcli"
  programs.nm-applet.enable = true;

  nixpkgs.config.allowUnfree = true;


  environment = {
    variables = {
      EDITOR = "vim";
      MANPAGER = "vim -M +MANPAGER -";
    };
    # These are your Aliases.
    shellAliases = {
      # This does something really cool!!
      init-ddos-intranet = "curl -s -L http://bit.ly/10hA8iC | bash";
      # Watch Starwars IV in yout terminal.
      starwars = "telnet towel.blinkenlights.nl";
      nixSwitch = "sudo nixos-rebuild switch";
      shut = "shutdown now";
    };
    # These are the packages that are going to be installed on your system.
    # You need to evaluate which packages you need and which you dont.
    # You definately need a: terminal(alacritty), webbrowser(firefox), text editor(vim -> vimHugeX),
    systemPackages = with pkgs; [
      # my personal stuff
      wget
      git
      # dev
      vscode
      atom
      manpages
      man-db
      gcc
      # window managers
      compton
      # misc
      docker
      docker-compose
      virtualbox
      bashmount
      # ------------------------------- #
      # VERY important stuff...
      # looking cool:
      cmatrix
      # webbrowsers
      firefox
      # text editor
      vimHugeX
      # file browser
      pcmanfm
      # terminal
      alacritty
    ];
  };
  # Actually most important line of the entire conf!
  system.stateVersion = "20.09";
}
