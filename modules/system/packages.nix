{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    apple-cursor
    brave
    btop
    clang-tools
    docker-compose
    equibop
    fastfetch
    git
    gh
    ghostty
    nixfmt
    nodejs_26
    pnpm
    telegram-desktop
    termius
    steam-run
    wget
    vscode-fhs
  ];

  fonts.packages = with pkgs; [
    inter
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports for Source Dedicated Server hosting

    extraPackages = with pkgs; [ apple-cursor ];
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.gamemode.enable = true;

  services.cloudflare-warp.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch";
      cleanup = "sudo nix-collect-garbage -d";
      update = "cwd=($pwd) && cd /etc/nixos && nix flake update && cd $cwd";
    };

    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "z"
      ];
    };

    histSize = 10000;
    histFile = "$HOME/.zsh_history";
  };

  programs.starship = {
    enable = true;
    settings = {
      "$schema" = "https://starship.rs/config-schema.json";

      format =
        "[](fg:color_bg3)"
        + "$os"
        + "$username"
        + "$directory"
        + "[](bg:color_bg2 fg:color_bg3)"
        + "$git_branch"
        + "$git_status"
        + "$c"
        + "$cpp"
        + "$rust"
        + "$golang"
        + "$nodejs"
        + "$bun"
        + "$php"
        + "$java"
        + "$kotlin"
        + "$haskell"
        + "$python"
        + "[](bg:color_bg1 fg:color_bg2)"
        + "$time"
        + "[ ](fg:color_bg1)"
        + "$line_break$character";

      palette = "heapy";

      palettes.heapy = {
        color_fg0 = "#e6e6e6";
        color_bg1 = "#616161";
        color_bg2 = "#4B73A3";
        color_bg3 = "#3584E4";
      };

      os = {
        disabled = false;
        style = "bg:color_bg3 fg:color_fg0";
        symbols = {
          NixOS = "󰌽";
        };
      };

      username = {
        show_always = true;
        style_user = "bg:color_bg3 fg:color_fg0";
        style_root = "bg:color_bg3 fg:color_fg0";
        format = "[ $user ]($style)";
      };

      directory = {
        style = "bg:color_bg3 fg:color_fg0";
        format = "[ $path ]($style)";
        truncation_length = 32;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = "󰝚 ";
          "Pictures" = " ";
          "Developer" = "󰲋 ";
        };
      };

      git_branch = {
        symbol = "";
        style = "bg:color_bg2";
        format = "[[ $symbol $branch ](fg:color_fg0 bg:color_bg2)]($style)";
      };

      git_status = {
        style = "bg:color_bg2";
        format = "[[($all_status$ahead_behind )](fg:color_fg0 bg:color_bg2)]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:color_bg2";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_bg2)]($style)";
      };

      bun = {
        symbol = "";
        style = "bg:color_bg2";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_bg2)]($style)";
      };

      c = {
        symbol = " ";
        style = "bg:color_bg2";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_bg2)]($style)";
      };

      cpp = {
        symbol = " ";
        style = "bg:color_bg2";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_bg2)]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:color_bg2";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_bg2)]($style)";
      };

      golang = {
        symbol = "";
        style = "bg:color_bg2";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_bg2)]($style)";
      };

      php = {
        symbol = "";
        style = "bg:color_bg2";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_bg2)]($style)";
      };

      java = {
        symbol = "";
        style = "bg:color_bg2";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_bg2)]($style)";
      };

      kotlin = {
        symbol = "";
        style = "bg:color_bg2";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_bg2)]($style)";
      };

      haskell = {
        symbol = "";
        style = "bg:color_bg2";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_bg2)]($style)";
      };

      python = {
        symbol = "";
        style = "bg:color_bg2";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_bg2)]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:color_bg1";
        format = "[[  $time ](fg:color_fg0 bg:color_bg1)]($style)";
      };

      line_break = {
        disabled = false;
      };

      character = {
        disabled = false;
        success_symbol = "[](bold fg:color_bg3)";
        error_symbol = "[](bold fg:color_bg3)";
        vimcmd_symbol = "[](bold fg:color_bg3)";
        vimcmd_replace_one_symbol = "[](bold fg:color_bg3)";
        vimcmd_replace_symbol = "[](bold fg:color_bg3)";
        vimcmd_visual_symbol = "[](bold fg:color_bg3)";
      };
    };
  };
}
