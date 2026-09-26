{ pkgs, ... }:

{
  programs.opencode = {
    enable = true;
    enableMcpIntegration = true;
    settings = {
      shell = "${pkgs.zsh}/bin/zsh";
      lsp = true;
      formatter = true;
      plugin = [
        "@dietrichgebert/ponytail"
        "opencode-vibeguard"
        "@tarquinen/opencode-dcp"
        "cc-safety-net"
      ];
      mcp = {
        context7 = {
          type = "remote";
          url = "https://mcp.context7.com/mcp";
        };
      };
      provider = {
        "cheaper-inference" = {
          "npm" = "@ai-sdk/openai-compatible";
          "name" = "Cheaper Inference";
          "options" = {
            "baseURL" = "https://api.cheaperinference.com/v1";
          };
          "models" = {
            "deepseek-v4-flash-0731" = {
              "name" = "DeepSeek V4 Flash 0731";
              "reasoning" = true;
            };
          };
        };
      };
    };
  };
}
