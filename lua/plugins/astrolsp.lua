-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configurações de recursos do LSP
    features = {
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    -- Formatação de código
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {},
        ignore_filetypes = {},
      },
      disabled = {},
      timeout_ms = 1000,
    },
    -- Servidores LSP para diferentes linguagens
    servers = {
      "pyright",   -- Python
      "ts_ls",  -- JavaScript/TypeScript
      "lua_ls",    -- Lua
      "clangd",    -- C/C++
      "html",      -- HTML
      "cssls",     -- CSS
      "bashls",    -- Bash
      "jsonls",    -- JSON
      "yamlls",    -- YAML
    },
    -- Configuração extra para servidores LSP
    config = {
      -- clangd = { capabilities = { offsetEncoding = "utf-8" } },
    },
    -- Mapeamentos de teclas para o LSP
    mappings = {
      n = {
        gd = { function() vim.lsp.buf.definition() end, desc = "Ir para definição" },
        K = { function() vim.lsp.buf.hover() end, desc = "Mostrar documentação" },
        ["<Leader>rn"] = { function() vim.lsp.buf.rename() end, desc = "Renomear símbolo" },
        ["<Leader>ca"] = { function() vim.lsp.buf.code_action() end, desc = "Ações do código" },
      },
    },
    -- Comandos automáticos
    autocmds = {
      lsp_codelens_refresh = {
        cond = "textDocument/codeLens",
        {
          event = { "InsertLeave", "BufEnter" },
          desc = "Atualizar CodeLens",
          callback = function(args)
            if require("astrolsp").config.features.codelens then
              vim.lsp.codelens.refresh { bufnr = args.buf }
            end
          end,
        },
      },
    },
    -- Configuração de eventos ao anexar um LSP
    on_attach = function(client, bufnr)
      local buf_map = vim.api.nvim_buf_set_keymap
      local opts = { noremap = true, silent = true }
      buf_map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      buf_map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    end,
  },
}
