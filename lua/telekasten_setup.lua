local lhome = vim.fn.expand("~/kdrive/notes")
require('telekasten').setup({
  home = lhome,
  dailies = lhome .. '/' .. 'daily',
  weeklies = lhome .. '/' .. 'weeklies',
  template_new_note = lhome .. '/' .. 'templates',
  template_new_daily = lhome .. '/' .. 'templates/template_for_daily',
  template_new_weekly = lhome .. '/' .. 'templates/weekly_template',
  templates = lhome .. '/' .. 'templates',

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
