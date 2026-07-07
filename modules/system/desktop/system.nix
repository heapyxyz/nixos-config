{ ... }:

{
  # make ghostty default terminal
  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "com.mitchellh.ghostty.desktop" ];
    };
  };

  environment.variables = {
    EDITOR = "code --wait";
    VISUAL = "code --wait";
  };
}
