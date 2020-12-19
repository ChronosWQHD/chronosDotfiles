
{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda"; 

  networking.hostName = "cs"; 
  networking.wireless.enable = true;  

  networking.wireless.userControlled.enable = true;
  networking.wireless.networks.CasparsIphone.psk = "unlimitiert";

  time.timeZone = "Europe/Zurich";

  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "de";
  };

  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.defaultSession = "none+qtile";
  services.xserver.windowManager.qtile.enable = true;

  services.xserver.layout = "de";

  services.printing.enable = true;

  # touchpad support
  services.xserver.libinput.enable = true;
  services.xserver.libinput.naturalScrolling = true;

  services.openssh.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;


  users.users.caspar = {
    isNormalUser = true;
    extraGroups = [ "wheel" "power" "docker" ];
    shell = pkgs.fish;
  };

  environment.shellAliases = {
    init-ddos-Intrnanet = "curl -s -L http://bit.ly/10hA8iC | bash";
    starwars = "telnet towel.blinkenlights.nl";
    nixSwitch = "sudo nixos-rebuild switch";
  };

  environment.variables = {
    EDITOR = "vim";
  };

  documentation.dev.enable = true;  

  virtualisation.docker.enable = true;

  programs.fish.enable = true;
  programs.steam.enable = true;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # terminal
    wget
    git
    alacritty
    cmatrix
    # text editor
    vimHugeX
    # dev
    manpages
    gcc
    # gui
    firefox
    pcmanfm
    # window managers
    nitrogen
    compton
    # misc
    docker
    docker-compose
  ];


  system.stateVersion = "20.09";
}
