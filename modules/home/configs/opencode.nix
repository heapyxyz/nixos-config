{ pkgs, ... }:

{
  programs.opencode = {
    enable = true;
    enableMcpIntegration = true;
    settings = {
      shell = "${pkgs.zsh}/bin/zsh";
      lsp = {
        pyright = {
          command = [
            "pyright-langserver"
            "--stdio"
          ];
          initialization.python.pythonPath = "\${workspaceFolder}/.venv/bin/python";
        };
        clangd = {
          command = [
            "clangd"
            "--background-index"
            "--clang-tidy"
            "--compile-commands-dir=build"
          ];
        };
      };
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
            "deepseek-v4.1-flash" = {
              "name" = "DeepSeek V4.1 Flash";
              "reasoning" = true;
            };
          };
        };
      };
    };
  };
}
