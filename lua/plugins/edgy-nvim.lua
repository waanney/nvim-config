return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	init = function()
		vim.opt.laststatus = 3
		vim.opt.splitkeep = "screen"
	end,
	opts = {
		-- Neotree edgy
		left = {
			{
				title = "NeoTree",
				ft = "neo-tree",
				filter = function(buf)
					return vim.b[buf].neo_tree_source == "filesystem"
				end,
				size = { height = 0.6 },
			},
			{
				title = "NeoTree Git",
				ft = "neo-tree",
				filter = function(buf)
					return vim.b[buf].neo_tree_source == "git_status"
				end,
				pinned = true,
				collapsed = true, -- show window as closed/collapsed on start
				open = "Neotree position=right git_status",
			},

			{
				title = function()
					local buf_name = vim.api.nvim_buf_get_name(0) or "[No Name]"
					return vim.fn.fnamemodify(buf_name, ":t")
				end,
				ft = "Outline",
				pinned = true,
				open = "SymbolsOutlineOpen",
			},
			-- any other neo-tree windows
			"neo-tree",
		},
    -- stylua: ignore
    keys = {
      ["q"] = function(win) win:close() end,
      ["<C-q>"] = function(win) win:hide() end,
      ["Q"] = function(win) win.view.edgebar:close() end,
      ["<C-w>h"] = function(win) win:prev() end,
      ["<C-w>l"] = function(win) win:next() end,
    },
	},
}
