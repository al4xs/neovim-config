return {
  {
    "Mofiqul/dracula.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("dracula").setup({
        transparent_bg = false,
      })

      vim.cmd.colorscheme("dracula")
    end,
  },
}
