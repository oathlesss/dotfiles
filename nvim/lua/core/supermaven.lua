local now, add = MiniDeps.now, MiniDeps.add

now(function()
	add({ source = "supermaven-inc/supermaven-nvim" })
	require("supermaven-nvim").setup({
		color = {
			suggestion_color = "#ffcccc",
			cterm = 244,
		},
	})
end)
