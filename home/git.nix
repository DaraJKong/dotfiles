{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "DaraJKong";
    userEmail = "daraetkong@gmail.com";
    aliases = {
      br = "branch";
      co = "checkout";
      c = "commit -m";
      ca = "commit -am";
      r = "rebase";
      s = "status --short";
      ss = "status";
      st = "status";
      d = "diff";
      l = "log";
    };
    extraConfig = {
      core.editor = "hx";
    };
  };
}
