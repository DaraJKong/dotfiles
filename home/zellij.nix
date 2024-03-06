{...}: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      pane_frames = false;
      default_layout = "compact";
      keybinds = {
        locked = {
          bind = {
            _args = ["Ctrl f"];
            LaunchOrFocusPlugin = {
              _args = ["zellij:strider"];
              floating = true;
            };
          };
        };
      };
    };
  };
}
