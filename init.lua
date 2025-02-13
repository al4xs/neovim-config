-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"
require "mason_setup"

-- Mapeando o atalho para abrir e fechar o terminal
vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })

-- Isso impede que o Neovim entre automaticamente em modo de inserção ao abrir o terminal
vim.cmd [[
  autocmd TermOpen * startinsert | set nonu
]]

-- Salvar automaticamente ao digitar
vim.api.nvim_exec([[
  augroup AutoSave
    autocmd!
    " Salva automaticamente a cada alteração
    autocmd TextChanged,TextChangedI * silent! write
  augroup END
]], false)

vim.opt.number = true      -- Ativa a numeração absoluta
vim.opt.relativenumber = false  -- Desativa a numeração relativa


