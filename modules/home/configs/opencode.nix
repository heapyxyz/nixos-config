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
    # fix(ghidra): admit newer 12.x releases as compatible builds (#6924)
    rev = "0d1a454e25db825567782e461da21530bad4b158";
    hash = "sha256-WqoNeYLtcTosEUV+mZLucJRsGajJ/id0ZU0jYYk+mE0=";
  };
  caveman = pkgs.fetchFromGitHub {
    owner = "JuliusBrussee";
    repo = "caveman";
    # Merge pull request #1394 from JuliusBrussee/daily-triage/2026-10-25
    rev = "9b68f7ed12b05e7efaff18e65c5a3fc2849fd0a4";
    hash = "sha256-fuSsPP7GMuAZ5Ab2paS41RAo5k/objd503ElcMeMgsk=";
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
      tools = {
        "rea_*" = false;
      };
      agent.rea = {
        mode = "primary";
        description = "Reverse engineering with REA tools";
        tools = {
          open_binary = true;
          close_binary = true;
          binary_overview = true;
          list_procedures = true;
          search_procedures = true;
          analyze_function = true;
          procedure_pseudo_code = true;
          procedure_assembly = true;
          procedure_info = true;
          procedure_callers = true;
          procedure_callees = true;
          batch_decompile = true;
          read_function_instructions = true;
          resolve_containing_procedure = true;
          xrefs = true;
          find_xrefs_to_name = true;
          get_call_graph = true;
          trace_call_path = true;
          build_call_path = true;
          list_strings = true;
          search_strings = true;
          search_bytes = true;
          list_names = true;
          list_segments = true;
          read_bytes = true;
          annotate_native_function = true;
          set_comment = true;
          set_inline_comment = true;
          inspect_analysis_view = true;
          get_evidence_bundle = true;
        };
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
          };
        };
      };
      provider = {
        "cheaper-inference" = {
          "npm" = "@ai-sdk/openai-compatible";
          "name" = "Cheaper Inference";
          "options" = {
            "baseURL" = "https://api.cheaperinference.com/v1";
            "setCacheKey" = true;
          };
          "models" = {
            "deepseek-v4.1-flash" = {
              "name" = "DeepSeek V4.1 Flash";
              "reasoning" = true;
              "cache" = true;
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
