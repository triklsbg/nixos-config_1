# Settings that don't fit into particular category

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    atool
    awscli
    bat
    bcache-tools
    borgbackup
    calibre
    chromium
    colord-kde
    exa
    fd
    file
    firefox
    gdrive
    gimp
    gnupg
    htop
    httpie
    http-prompt
    hunspell
    hunspellDicts.ru_RU
    hunspellDicts.en_US-large
    imagemagick
    inkscape
    jq
    libreoffice-fresh
    kdeconnect
    kdeApplications.ark
    kdeApplications.dolphin
    kdeApplications.filelight
    kdeApplications.gwenview
    kdeApplications.kate
    kdeApplications.kcolorchooser
    kdeApplications.kwalletmanager
    kdeApplications.okular
    kdeApplications.spectacle
    keepassxc
    manpages
    mkvtoolnix
    mpv
    moreutils
    ncdu
    neovim
    nnn
    ntfs3g
    okteta
    p7zip
    pandoc
    partition-manager
    pciutils
    picard
    qbittorrent
    ripgrep
    rsync
    skrooge
    smplayer
    smtube
    smartmontools
    thunderbird
    tmux
    tree
    unrar
    unzip
    usbutils
    wget 
    youtube-dl
  ];
}
