local now, add = MiniDeps.now, MiniDeps.add

now(function()
	add({
		source = "stevearc/oil.nvim",
		depends = { "echasnovski/mini.icons" },
	})
	require("oil").setup()
end)
