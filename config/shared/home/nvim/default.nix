{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      cmp-buffer
      cmp-nvim-lsp
      cmp-path
      fidget-nvim
      gitsigns-nvim
      lualine-nvim
      luasnip
      neodev-nvim
      nvim-autopairs
      nvim-cmp
      nvim-colorizer-lua
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      oil-nvim
      presence-nvim
      rose-pine
      telescope-nvim
      vim-fugitive
    ];
  };
}
