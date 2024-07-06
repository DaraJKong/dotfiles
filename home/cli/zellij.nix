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
          "bind \"Ctrl t\"" = {
            ToggleFloatingPanes = [];
          };
          "bind \"Ctrl a\"" = {
            LaunchOrFocusPlugin = {
              _args = ["https://github.com/Nacho114/harpoon/releases/download/v0.1.0/harpoon.wasm"];
              floating = true;
              move_to_focused_tab = true;
            };
          };
          "bind \"Ctrl y\"" = {
            LaunchOrFocusPlugin = {
              _args = ["https://github.com/imsnif/monocle/releases/download/v0.100.0/monocle.wasm"];
              floating = true;
            };
          };
        };
      };
    };
  };
}
