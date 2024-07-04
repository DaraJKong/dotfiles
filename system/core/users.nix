{pkgs, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’
  users = {
    mutableUsers = true; # TODO: Add agenix secrets for user password and set this to false
    users = {
      darak = {
        isNormalUser = true;
        extraGroups = ["wheel" "networking"]; # Enable ‘sudo’ for the user
        packages = with pkgs; [
          freeoffice
        ];
      };
    };
  };
}
