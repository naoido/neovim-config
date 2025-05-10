return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require'nvim-treesitter.configs'.setup {
        ensure_installed = { "lua", "vim", "vimdoc", "python", "javascript", "typescript", "rust", "go", "html", "css", "java", "dart" },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
      },
    }
  end
}

