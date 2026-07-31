
-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here


-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

vim.keymap.set("n", "<C-b>", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

-- ~/.config/nvim/lua/polish.lua

-- =========================================================
-- Atalhos semelhantes ao VS Code
-- =========================================================

local map = vim.keymap.set

local default_options = {
  noremap = true,
  silent = true,
}

-- =========================================================
-- Ctrl + X: recortar
-- =========================================================

-- Sem seleção: recorta a linha atual inteira
map("n", "<C-x>", '"+dd', {
  noremap = true,
  silent = true,
  desc = "Recortar linha",
})

-- Com seleção: recorta somente o conteúdo selecionado
map("x", "<C-x>", '"+d', {
  noremap = true,
  silent = true,
  desc = "Recortar seleção",
})

-- No modo insert: recorta a linha atual sem sair do insert
map("i", "<C-x>", '<C-o>"+dd', {
  noremap = true,
  silent = true,
  desc = "Recortar linha",
})

-- =========================================================
-- Ctrl + A: selecionar tudo
-- =========================================================

map("n", "<C-a>", "ggVG", {
  noremap = true,
  silent = true,
  desc = "Selecionar tudo",
})

map("i", "<C-a>", "<Esc>ggVG", {
  noremap = true,
  silent = true,
  desc = "Selecionar tudo",
})

map("x", "<C-a>", "<Esc>ggVG", {
  noremap = true,
  silent = true,
  desc = "Selecionar tudo",
})

-- =========================================================
-- Ctrl + L: selecionar a linha inteira
-- Funciona no modo normal e no modo insert
-- =========================================================

map("n", "<C-l>", "V", {
  noremap = true,
  silent = true,
  desc = "Selecionar linha inteira",
})

map("i", "<C-l>", "<Esc>V", {
  noremap = true,
  silent = true,
  desc = "Selecionar linha inteira",
})

-- Quando já existe uma seleção de linhas,
-- Ctrl + L adiciona a próxima linha à seleção
map("x", "<C-l>", "j", {
  noremap = true,
  silent = true,
  desc = "Selecionar próxima linha",
})

-- =========================================================
-- Alt + seta para cima/baixo: mover linhas
-- =========================================================

-- Modo normal
map("n", "<C-Up>", ":move .-2<CR>==", {
  noremap = true,
  silent = true,
  desc = "Mover linha para cima",
})

map("n", "<C-Down>", ":move .+1<CR>==", {
  noremap = true,
  silent = true,
  desc = "Mover linha para baixo",
})

-- Modo insert
map("i", "<C-Up>", "<Esc>:move .-2<CR>==gi", {
  noremap = true,
  silent = true,
  desc = "Mover linha para cima",
})

map("i", "<C-Down>", "<Esc>:move .+1<CR>==gi", {
  noremap = true,
  silent = true,
  desc = "Mover linha para baixo",
})

-- Modo visual: move todas as linhas selecionadas
map("x", "<M-Up>", ":move '<-2<CR>gv=gv", {
  noremap = true,
  silent = true,
  desc = "Mover seleção para cima",
})

map("x", "<M-Down>", ":move '>+1<CR>gv=gv", {
  noremap = true,
  silent = true,
  desc = "Mover seleção para baixo",
})

-- Alternativas caso Alt + setas não funcione no terminal:
-- Alt + K move para cima
-- Alt + J move para baixo

map("n", "<M-k>", ":move .-2<CR>==", default_options)
map("n", "<M-j>", ":move .+1<CR>==", default_options)

map("i", "<M-k>", "<Esc>:move .-2<CR>==gi", default_options)
map("i", "<M-j>", "<Esc>:move .+1<CR>==gi", default_options)

map("x", "<M-k>", ":move '<-2<CR>gv=gv", default_options)
map("x", "<M-j>", ":move '>+1<CR>gv=gv", default_options)

-- =========================================================
-- Undo/Redo estilo VS Code
-- Ctrl + Z: desfazer
-- Ctrl + Y: refazer
-- =========================================================

map("n", "<C-z>", "u", {
  noremap = true,
  silent = true,
  desc = "Desfazer",
})

map("i", "<C-z>", "<C-g>u<C-o>u", {
  noremap = true,
  silent = true,
  desc = "Desfazer",
})

map("x", "<C-z>", "<Esc>u", {
  noremap = true,
  silent = true,
  desc = "Desfazer",
})

map("n", "<C-y>", "<C-r>", {
  noremap = true,
  silent = true,
  desc = "Refazer",
})

map("i", "<C-y>", "<C-o><C-r>", {
  noremap = true,
  silent = true,
  desc = "Refazer",
})

map("x", "<C-y>", "<Esc><C-r>", {
  noremap = true,
  silent = true,
  desc = "Refazer",
})

-- Cria pontos de desfazer enquanto você digita
map("i", "<Space>", "<Space><C-g>u", {
  noremap = true,
  silent = true,
})

map("i", "<CR>", "<CR><C-g>u", {
  noremap = true,
  silent = true,
})

map("i", ".", ".<C-g>u", {
  noremap = true,
  silent = true,
})

map("i", ",", ",<C-g>u", {
  noremap = true,
  silent = true,
})


-- =========================================================
-- Backspace/Delete: apagar seleção igual ao VS Code
-- =========================================================

map("x", "<BS>", '"_c', {
  noremap = true,
  silent = true,
  desc = "Apagar seleção",
})

map("x", "<Del>", '"_c', {
  noremap = true,
  silent = true,
  desc = "Apagar seleção",
})

-- Modo visual: mover seleção com Ctrl + seta
map("x", "<C-Up>", ":move '<-2<CR>gv=gv", {
  noremap = true,
  silent = true,
  desc = "Mover seleção para cima",
})

map("x", "<C-Down>", ":move '>+1<CR>gv=gv", {
  noremap = true,
  silent = true,
  desc = "Mover seleção para baixo",
})
