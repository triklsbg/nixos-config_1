{ config, pkgs, ... }:

{
  hardware = {
    pulseaudio = {
      enable = true;
      support32Bit = true;
    };
    opengl = {
      s3tcSupport = true;
      driSupport32Bit = true;
    };
    nvidia.modesetting.enable = true;
  };

  services.xserver = {
    enable = true;
    layout = "us,ru";
    xkbOptions = "grp:caps_toggle,compose:ralt";

    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;

    videoDrivers = [
      "nvidia"
    ];
    monitorSection = ''
      Option "UseEdidDpi" "True"
    '';
    screenSection = ''
      Option "TripleBuffer" "on"
      Option "AllowIndirectGLXProtocol" "off"
      Option "metamodes" "nvidia-auto-select +0+0 { ForceCompositionPipeline = On, ForceFullCompositionPipeline = On }"
    '';
  };

  services.flatpak = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-kde
    ];
  };

  environment.systemPackages = with pkgs; [
    amarok
    kdeApplications.ark
    kdeApplications.dolphin
    kdeApplications.filelight
    kdeApplications.gwenview
    kdeApplications.kmail
    kdeApplications.kmix
    kdeApplications.okular
    kdeconnect
    ktorrent
    partition-manager
    plasma-browser-integration 
    redshift-plasma-applet
    skrooge
  ];
}