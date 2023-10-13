{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      cmp-buffer
      cmp-nvim-lsp
      cmp-path
      dressing-nvim
      fidget-nvim
      gitsigns-nvim
      lualine-nvim
      luasnip
      neodev-nvim
      nvim-autopairs
      nvim-cmp
      nvim-colorizer-lua
      nvim-lspconfig
      (nvim-treesitter.withPlugins (plugins: with plugins;
        [
          allGrammars
          tree-sitter-nu
        ]
      ))
      oil-nvim
      presence-nvim
      rose-pine
      telescope-nvim
      vim-fugitive
    ];
  };
  home.file.".config/nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
