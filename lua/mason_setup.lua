-- mason_setup.lua
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Configure Mason
mason.setup()

-- Adiciona o Emmet LSP à lista de servidores que o Mason vai instalar
mason_lspconfig.setup()

-- Configuração do Emmet LSP com lspconfig
local lspconfig = require("lspconfig")

-- Configure o emmet-ls
lspconfig.emmet_ls.setup({
  filetypes = { "html", "css", "javascript", "typescript", "vue", "tsx", "jsx", "less", "sass", "scss" },
  init_options = {
    html = {
      options = {
        ["input"] = {
          "abbr",
        },
      },
    },
  },
})

