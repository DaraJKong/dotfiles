{...}: {
  # Pick only one of the below networking options.
  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.
  networking = {
    networkmanager = {
      enable = true;
      wifi = {
        macAddress = "random";
        powersave = true;
      };
    };
    firewall = {
      enable = true;
      allowPing = false;
    };
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Slows down boot time
  systemd.services.NetworkManager-wait-online.enable = false;
}
