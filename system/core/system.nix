{
  inputs,
  pkgs,
  lib,
  ...
}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME desktop environment
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb.layout = "ca";

  # Configure console keymap
  console = lib.mkDefault {
    font = "Lat2-Terminus16";
    keyMap = "ca";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # Default fonts
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = ["FiraCode Nerd Font"];
      sansSerif = ["FiraCode Nerd Font"];
      monospace = ["FiraMono Nerd Font"];
    };
  };

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  services = {
    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable the OpenSSH daemon.
    openssh.enable = true;

    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;
    libinput.touchpad = {
      tapping = true;
      scrollMethod = "twofinger";
      disableWhileTyping = true;
    };

    udisks2.enable = true;
  };

  # Enable sound.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.dconf.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.nix-ld.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    wget
    alacritty
    wineWowPackages.stable
    libgig
    lmms
    vital
    # Enable real-time audio performance settings
    (inputs.musnix)
    # starship # TODO: having starship here means pkgs.startship will be stored during build and not during promptInit
  ];

  environment.variables = let
    makePluginPath = format:
      (lib.makeSearchPath format [
        "$HOME/.nix-profile/lib"
        "/run/current-system/sw/lib"
        "/etc/profiles/per-user/$USER/lib"
        # "${pkgs.vital.outPath}"
      ])
      + ":$HOME/.${format}";
  in {
    DSSI_PATH = makePluginPath "dssi";
    LADSPA_PATH = makePluginPath "ladspa";
    LV2_PATH = makePluginPath "lv2";
    LXVST_PATH = makePluginPath "lxvst";
    VST_PATH = makePluginPath "vst";
    VST3_PATH = makePluginPath "vst3";
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;
}
