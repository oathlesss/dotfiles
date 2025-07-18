local add, now = MiniDeps.add, MiniDeps.now

now(function()
	add({
		source = "ThePrimeagen/harpoon",
		checkout = "harpoon2",
		monitor = "harpoon2",
		depends = { "nvim-lua/plenary.nvim" },
	})
	local harpoon = require("harpoon")
	harpoon:setup()

	vim.keymap.set("n", "<leader>hp", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Quick Menu" })
	vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon Add" })
	vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon Select 1" })
	vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon Select 2" })
	vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon Select 3" })
	vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon Select 4" })
end)
