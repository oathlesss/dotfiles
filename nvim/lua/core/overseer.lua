local now, add = MiniDeps.now, MiniDeps.add

now(function()
	add({
		source = "stevearc/overseer.nvim",
	})
	require("overseer").setup()
end)
