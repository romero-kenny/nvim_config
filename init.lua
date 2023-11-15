--general settings
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 12
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.smartindent = true
vim.opt.updatetime = 50
vim.opt.shiftwidth = 4
vim.opt.colorcolumn = "80"

--general keybinds
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)
vim.keymap.set("n", "<leader>bc", vim.cmd.close)
vim.keymap.set("n", "<leader>lf", vim.cmd.LspZeroFormat)
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", ".", "<nop>")

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
		"RRethy/nvim-base16"
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{
				-- Optional
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required { 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' }, -- Required
		}
	},
	{
		"Exafunction/codeium.vim",
		config = function()
			vim.g.codeium_disable_bindings = 1
			vim.keymap.set('i', '<M-a>', function() return vim.fn['codeium#Accept']() end, { expr = true })
			vim.keymap.set('i', '<M-l>', function() return vim.fn['codeium#CycleCompletions'](1) end,
				{ expr = true })
			vim.keymap.set('i', '<M-h>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
				{ expr = true })
			vim.keymap.set('i', '<M-d>', function() return vim.fn['codeium#Clear']() end, { expr = true })
		end,
	},
	-- Trying out telekastan.nvim instead, and making it fully intergratable with neovim
	-- {
	-- 	"epwalsh/obsidian.nvim",
	-- 	lazy = false,
	-- 	event = { "BufReadPre /Users/kenny/ken_drive/mind_attackz/*.md" },
	-- 	-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
	-- 	-- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
	-- 	dependencies = {
	-- 		-- Required.
	-- 		"nvim-lua/plenary.nvim",

	-- 		-- see below for full list of optional dependencies 👇
	-- 	},
	-- 	opts = {
	-- 		dir = "/Users/kenny/ken_drive/mind_attackz", -- no need to call 'vim.fn.expand' here

	-- 		-- see below for full list of options 👇
	-- 	},
	-- },
	-- Only needed if using tmux
	-- {
	-- "alexghergh/nvim-tmux-navigation",
	-- config = function()
	-- 	require("nvim-tmux-navigation").setup({
	-- 		disable_when_zoomed = false,
	-- 		keybindings = {
	-- 			left = "<C-h>",
	-- 			down = "<C-j>",
	-- 			up = "<C-k>",
	-- 			right = "<C-l>",
	-- 		},
	-- 	})
	-- end
	-- },
	{
		'renerocksai/telekasten.nvim',
		dependencies = {
			'nvim-telescope/telescope.nvim',
			'nvim-lua/popup.nvim',
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-media-files.nvim',
			'renerocksai/calendar-vim', }
	},
	{
		"ellisonleao/glow.nvim", config = function() require("glow").setup() end
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
})

--plugin setups
require("mason").setup() -- for lsp manager

---keybinds and initilization for telekasten

---- Base Setup
require('telekasten').setup({
	home = vim.fn.expand("~/ken_drive/mind_vault"),
	subdirs_in_links = false,
})

vim.keymap.set("n", "<leader>tt", vim.cmd.Telekasten, {})
vim.keymap.set("n", "<leader>tli", "<cmd>Telekasten insert_link<CR>")
vim.keymap.set("n", "<leader>tlf", "<cmd>Telekasten follow_link<CR>")
vim.keymap.set("n", "<leader>tnn", "<cmd>Telekasten new_note<CR>")
vim.keymap.set("n", "<leader>tnf", "<cmd>Telekasten search_notes<CR>")
vim.keymap.set("n", "<leader>tnb", "<cmd>Telekasten show_backlinks<CR>")
vim.keymap.set("n", "<leader>tnc", "<cmd>Telekasten show_calendar<CR>")
vim.keymap.set("n", "<leader>tcl", "<cmd>Telekasten toggle_todo<CR>")
vim.keymap.set("n", "<leader>tp", "<cmd>Glow<CR>")

---keybinds for obsidian
-- vim.keymap.set("n", "<leader>of", vim.cmd.ObsidianFollowLink, {})
-- vim.keymap.set("n", "<leader>on", vim.cmd.ObsidianNewLink, {})
-- vim.keymap.set("n", "<leader>os", vim.cmd.ObsidianQuickSwitch, {})
-- vim.keymap.set("n", "<leader>oo", vim.cmd.ObsidianOpen, {})
-- vim.keymap.set("n", "<leader>ot", vim.cmd.ObsidianToday, {})
-- vim.keymap.set("n", "<leader>oy", vim.cmd.ObsidianYesterday, {})

---keybind for telescope / fuzzyfinder
local telebuilt = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telebuilt.find_files, {})
vim.keymap.set("n", "<leader>gf", telebuilt.git_files, {})

---- loads the media previewer for telescope
require("telescope").load_extension("media_files")

---telekastan setup
---- Markdown previewer peek
-- default config:

---theme selection
vim.cmd.colorscheme "base16-da-one-black"

---tree sitter configurations
require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "zig" },
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	}
})

---lsp setup
----lsp keybindings
local cmp = require("cmp")
cmp.setup({
	mapping = {
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<C-x>"] = cmp.mapping.close(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-J>"] = cmp.mapping.scroll_docs(),
	}
})

local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "<leader>gg", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "<leader>gk", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>gd", function() vim.diagnostics.open_float() end, opts)
	vim.keymap.set("n", "<leader>gn", function() vim.diagnostics.goto_next() end, opts)
	vim.keymap.set("n", "<leader>gp", function() vim.diagnostics.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.rename() end, opts)
end)

lsp.setup() --activates lsp
