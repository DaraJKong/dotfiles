{config, ...}: {
  programs.nushell = {
    enable = true;
    environmentVariables =
      {
        STARSHIP_SHELL = "nu";
        ZELLIJ_AUTO_ATTACH = "false";
        ZELLIJ_WELCOME = "false";
        ZELLIJ_AUTO_EXIT = "false";

        PATH = "($env.PATH | split row (char esep) | append ($env.HOME | path join '.local/bin'))";
      }
      // config.home.sessionVariables;
    configFile.text = ''
      def create_left_prompt [] {
        starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
      }

      def start_zellij [] {
        if 'ZELLIJ' not-in ($env | columns) {
          if 'ZELLIJ_AUTO_ATTACH' in ($env | columns) and $env.ZELLIJ_AUTO_ATTACH == 'true' {
            zellij attach -c dev
          } else if 'ZELLIJ_WELCOME' in ($env | columns) and $env.ZELLIJ_WELCOME == 'true' {
            zellij -l welcome
          }

          if 'ZELLIJ_AUTO_EXIT' in ($env | columns) and $env.ZELLIJ_AUTO_EXIT == 'true' {
            exit
          }
        }
      }

      $env.config.show_banner = false

      $env.PROMPT_COMMAND = { || create_left_prompt }
      $env.PROMPT_COMMAND_RIGHT = ""
      $env.PROMPT_INDICATOR = ""
      $env.PROMPT_INDICATOR_VI_INSERT = ": "
      $env.PROMPT_INDICATOR_VI_NORMAL = "〉"
      $env.PROMPT_MULTILINE_INDICATOR = "::: "

      start_zellij
    '';
  };
}
