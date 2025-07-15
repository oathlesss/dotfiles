local now, add = MiniDeps.now, MiniDeps.add

now(function()
	add({
		source = "utilyre/barbecue.nvim",
		depends = { "SmiteshP/nvim-navic", },
	})
	require("barbecue").setup()
end)
