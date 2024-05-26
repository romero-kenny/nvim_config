local lhome = vim.fn.expand("~/.the_vault")
require('telekasten').setup({
  home = lhome,
  dailies = lhome .. '/' .. 'daily',
  weeklies = lhome .. '/' .. 'daily',

})

-- Telekasten Keybinds / Notes Keybinds
vim.keymap.set("n", "<leader>nt", vim.cmd.Telekasten, {})
vim.keymap.set("n", "<leader>nli", "<cmd>Telekasten insert_link<CR>")
vim.keymap.set("n", "<leader>nlf", "<cmd>Telekasten follow_link<CR>")
vim.keymap.set("n", "<leader>nn", "<cmd>Telekasten new_note<CR>")
vim.keymap.set("n", "<leader>nf", "<cmd>Telekasten search_notes<CR>")
vim.keymap.set("n", "<leader>nlb", "<cmd>Telekasten show_backlinks<CR>")
vim.keymap.set("n", "<leader>nc", "<cmd>Telekasten show_calendar<CR>")
vim.keymap.set("n", "<leader>nk", "<cmd>Telekasten toggle_todo<CR>")


require("telescope").load_extension("media_files")
