{...}: {
  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Enable NTFS support
  boot.supportedFilesystems = ["ntfs"];
}
