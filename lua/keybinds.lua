-- Important Remaps
---- neovim default file explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Oil)
---- Open search for language symbols
vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').lsp_document_symbols, { desc = 'Search Language Symbols ex. Functions, Variables'})
---- Open Telescope Find File
vim.keymap.set('n', '<leader>.', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
---- Telescope Grep
vim.keymap.set('n', '<leader>,', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
---- Telescope Search Opened Buffers
vim.keymap.set('n', '<leader>;', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
---- Telescope Search Current Buffer
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with jk on word wrapped lines (visually jump lines rather
-- than actual lines)
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
-- Leader D
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

---- Brackets
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

-- Telescope Remaps
---- Find Old Files
vim.keymap.set('n', '<leader>t?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
---- Find Git Files
vim.keymap.set('n', '<leader>tg', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
---- Grep Git Root
vim.keymap.set('n', '<leader>tG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
---- Telescope Diagnostics Search
vim.keymap.set('n', '<leader>td', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Window Keybinds
---- close window
vim.keymap.set("n", "<leader>x", vim.cmd.close)
