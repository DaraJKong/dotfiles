{...}: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";

      default_shell = "nu";
      default_mode = "locked";
      default_layout = "compact";

      pane_frames = false;
      ui.pane_frames.rounded_corners = true;

      session_serialization = true;
      pane_viewport_serialization = true;

      keybinds = {
        locked = {
          bind = {
            _args = ["Ctrl t"];
            ToggleFloatingPanes = [];
          };
        };
      };
    };
  };
}
