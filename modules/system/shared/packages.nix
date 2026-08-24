{
  pkgs,
  flake-dir,
  hostname,
  ...
}:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    btop
    eza
    fastfetch
    git
    gh
    wget
  ];

  services.cloudflare-warp.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ff = "fastfetch";
      rebuild = "sudo nixos-rebuild switch --flake ${flake-dir}#${hostname}";
      rebuild-boot = "sudo nixos-rebuild boot --flake ${flake-dir}#${hostname}";
      cleanup = "sudo nix-collect-garbage -d; nix-store --optimise";
      update = "cd ${flake-dir}; nix flake update; cd -";
      shell = "nix-shell --command zsh ";
      ls = "eza ";
      tree = "eza --tree ";
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

  programs.nix-ld.enable = true;
}
