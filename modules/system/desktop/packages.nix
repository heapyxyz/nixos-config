{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    apple-cursor
    brave
    clang-tools
    equibop
    ghostty
    heroic
    lutris
    nixfmt
    nodejs_26
    pgadmin4-desktopmode
    pnpm
    prismlauncher
    telegram-desktop
    termius
    steam-run
    vscode-fhs
  ];

  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-lgc-plus
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # open ports for Source Dedicated Server hosting
    gamescopeSession.enable = true;

    extraPackages = with pkgs; [ apple-cursor ];
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];

    protontricks.enable = true;
  };

  programs.gamemode.enable = true;

  programs.starship = {
    enable = true;
    settings = {
      "$schema" = "https://starship.rs/config-schema.json";

      format = "$os$username[](bg:#DA627D fg:#9A348E)$directory[](fg:#DA627D bg:#FCA17D)$git_branch[](fg:#FCA17D bg:#86BBD8)$c$cpp$nodejs$python$dotnet[](fg:#86BBD8 bg:#33658A)$time[ ](fg:#33658A)\n$character";

      username = {
        show_always = true;
        style_user = "bg:#9A348E";
        style_root = "bg:#9A348E";
        format = "[ $user ]($style)";
        disabled = false;
      };

      os = {
        style = "bg:#9A348E";
        format = "[ $symbol]($style)";
        disabled = false;
        symbols = {
          NixOS = "";
        };
      };

      directory = {
        style = "bg:#DA627D";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";

        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
        };
      };

      c = {
        symbol = "";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };

      cpp = {
        symbol = "";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };

      nodejs = {
        symbol = "󰎙";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };

      python = {
        symbol = "";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };

      dotnet = {
        symbol = "󰌛";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };

      git_branch = {
        symbol = "";
        style = "bg:#FCA17D";
        format = "[ $symbol $branch ]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R"; # Hour:Minute format
        style = "bg:#33658A";
        format = "[ $time ]($style)";
      };

      character = {
        disabled = false;
        format = "[ $symbol ]($style)";
      };
    };
  };
}
