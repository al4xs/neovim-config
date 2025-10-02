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

vim.opt.number = true      -- Ativa a numeração absoluta
vim.opt.relativenumber = false  -- Desativa a numeração relativa

-- Remove fundo de todos os highlights
vim.cmd [[
  hi StatusLine guibg=NONE ctermbg=NONE
  hi StatusLineNC guibg=NONE ctermbg=NONE
  hi TabLine guibg=NONE ctermbg=NONE
  hi TabLineFill guibg=NONE ctermbg=NONE
  hi TabLineSel guibg=NONE ctermbg=none

  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
  hi VertSplit guibg=NONE ctermbg=NONE
  hi StatusLine guibg=NONE ctermbg=NONE
  hi StatusLineNC guibg=NONE ctermbg=NONE
  hi Pmenu guibg=NONE ctermbg=NONE
  hi PmenuSel guibg=NONE ctermbg=NONE
  hi CursorLine guibg=NONE ctermbg=NONE
  hi CursorColumn guibg=NONE ctermbg=NONE
]]

-- ========================
-- Cursor minimalista
-- ========================

vim.opt.cursorline = false  -- Desativa linha do cursor
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

-- ========================
-- Outras configs visuais
-- ========================

vim.opt.termguicolors = true  -- Necessário para cores GUI no terminal
vim.opt.background = "dark"   -- Para tema escuro
