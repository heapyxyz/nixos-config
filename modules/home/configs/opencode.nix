{
  pkgs,
  flake-dir,
  config,
  ...
}:

let
  rea = pkgs.fetchFromGitHub {
    owner = "morluto";
    repo = "rea";
    # refactor(mcp): bind Electron tools through shared contracts
    rev = "d6bcfc10eafa3c0893c7cbd5f3dc6a90359be022";
    hash = "sha256-BnZ8TvXSei1XdGopEd5ZUXMbBMLzkSaie980jtDNIT8=";
  };
  caveman = pkgs.fetchFromGitHub {
    owner = "JuliusBrussee";
    repo = "caveman";
    # docs: refresh star history chart (#1537)
    rev = "9b243662ff98d392bc0a95b865a554583d71be75";
    hash = "sha256-1X2DjYa4xqO1ZqwxdFjCmaypp0+HYncEpXaut4i9LkE=";
  };
  link = f: config.lib.file.mkOutOfStoreSymlink "${flake-dir}/modules/home/configs/${f}";
in
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
      permissions = [
        {
          action = "rea_*";
          resource = "*";
          effect = "deny";
        }
      ];
      agents.rea = {
        mode = "primary";
        description = "Reverse engineering with REA tools";
        permissions = [
          {
            action = "rea_*";
            resource = "*";
            effect = "allow";
          }
        ];
      };
      skills.paths = [
        "${rea}/.agents/skills"
        "${caveman}/skills"
      ];
      plugin = [
        "@dietrichgebert/ponytail"
        "@tarquinen/opencode-dcp"
        "cc-safety-net"
        "superpowers@git+https://github.com/obra/superpowers.git"
      ];
      mcp = {
        context7 = {
          type = "remote";
          url = "https://mcp.context7.com/mcp";
        };
        rea = {
          type = "local";
          command = [
            "npx"
            "-y"
            "rea-agents@latest"
            "mcp"
          ];
          enabled = true;
          environment = {
            GHIDRA_INSTALL_DIR = "${pkgs.ghidra-bin}/lib/ghidra";
            JAVA_HOME = "${pkgs.openjdk21}";
            REA_MCP_TOOL_CATALOG_PROFILE = "hot-cold";
            REA_MCP_TOOL_FAMILIES = "session,direct,enhanced,native,artifact,application";
          };
        };
      };
      providers = {
        "cheaper-inference" = {
          package = "@opencode/ai/providers/openai-compatible";
          name = "Cheaper Inference";
          settings = {
            baseURL = "https://api.cheaperinference.com/v1";
          };
          compatibility = {
            supportsPromptCacheKey = true;
          };
          models = {
            "deepseek-v4.1-flash" = {
              name = "DeepSeek V4.1 Flash";
              capabilities = {
                reasoning = {
                  supported = true;
                  effort = [
                    "low"
                    "medium"
                    "high"
                    "max"
                  ];
                };
              };
            };
          };
        };
      };
    };
  };

  xdg.configFile = {
    "opencode/dcp.jsonc" = {
      source = link "opencode/dcp.jsonc";
      force = true;
    };
  };
}
