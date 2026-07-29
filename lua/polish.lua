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
-- Ctrl + Z: desfazer
-- =========================================================

-- Modo normal
map("n", "<C-z>", "u", {
  noremap = true,
  silent = true,
  desc = "Desfazer",
})

-- Modo insert: desfaz sem sair do modo de inserção
map("i", "<C-z>", "<C-o>u", {
  noremap = true,
  silent = true,
  desc = "Desfazer",
})

-- Modo visual
map("x", "<C-z>", "<Esc>u", {
  noremap = true,
  silent = true,
  desc = "Desfazer",
})

-- =========================================================
-- Ctrl + C: copiar
-- =========================================================

-- Sem seleção: copia a linha atual inteira
map("n", "<C-c>", '"+yy', {
  noremap = true,
  silent = true,
  desc = "Copiar linha",
})

-- Com seleção: copia apenas o texto selecionado
map("x", "<C-c>", '"+y', {
  noremap = true,
  silent = true,
  desc = "Copiar seleção",
})

-- No modo insert: copia a linha atual sem sair do insert
map("i", "<C-c>", '<C-o>"+yy', {
  noremap = true,
  silent = true,
  desc = "Copiar linha",
})

-- =========================================================
-- Ctrl + V: colar
-- =========================================================

-- Modo normal
map("n", "<C-v>", '"+p', {
  noremap = true,
  silent = true,
  desc = "Colar",
})

-- No modo visual, substitui a seleção sem apagar
-- o conteúdo atual da área de transferência
map("x", "<C-v>", '"_d"+P', {
  noremap = true,
  silent = true,
  desc = "Colar sobre seleção",
})

-- Modo insert
map("i", "<C-v>", "<C-r>+", {
  noremap = true,
  silent = true,
  desc = "Colar",
})

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
-- Ctrl + B: abrir ou fechar o Neo-tree
-- Mantém o atalho que já existia no seu arquivo
-- =========================================================

map("n", "<C-b>", "<cmd>Neotree toggle<CR>", {
  noremap = true,
  silent = true,
  desc = "Abrir/fechar Neo-tree",
})
