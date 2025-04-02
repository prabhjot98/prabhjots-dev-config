{
  config,
  pkgs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "pssandhu";
  home.homeDirectory = "/Users/pssandhu";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    raycast
    discord
    # obsidian
    cargo
    neovim
    wezterm
    lazygit
    neofetch
    ollama
    gh
    nil
    deno
    pnpm
    nodejs_22
    stylua
    eslint_d
    prettierd
    alejandra
    gcc
    ripgrep
    markdownlint-cli
    marksman
    tree-sitter
    fd
    dotnet-sdk_8
    virtualenv
    typescript
    flyctl
    tailwindcss-language-server
    docker
    n8n
  ];

  programs.fzf.enable = true;

  programs.starship = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    autocd = true;
    shellAliases = {
      p = "pnpm";
      pv = "pnpm verify";
      n = "nvim";
      g = "git";
      gp = "git pull --rebase";
      gP = "git push";
      gs = "git status";
      gS = "git stash -u";
      gpop = "git stash pop";
      ls = "eza";
      rm = "trash";
      s = "source ~/.zshrc";
      lg = "lazygit";
      reboot = "reboot --reboot --no-wall";
      shutdown = "shutdown -h now";
    };
    initExtra = "# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pssandhu/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/pssandhu/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pssandhu/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/pssandhu/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
";
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/pssandhu/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
