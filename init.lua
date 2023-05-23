--general keybinds
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 12
vim.keymap.set("n", "<leader>F", vim.cmd.Ex)
vim.keymap.set("n", "<leader>x", vim.cmd.close)


--setups lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--List of plugins for Lazy.nvim
require("lazy").setup({
	{
	"williamboman/mason.nvim",
	build = ":MasonUpdate"
	},
	{
	"nvim-telescope/telescope.nvim", tag = "0.1.1",
	dependencies = { "nvim-lua/plenary.nvim" }
	}
})

-- Plugin Setups
require("mason").setup()

--keybind for telescope
local telebuilt = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", telebuilt.find_files, {})
vim.keymap.set("n", "<leader>gf", telebuilt.git_files, {})
