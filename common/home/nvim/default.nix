{ pkgs, ... }:
{
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
      nvim-jdtls
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      tree-sitter-grammars.tree-sitter-nu
      oil-nvim
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
