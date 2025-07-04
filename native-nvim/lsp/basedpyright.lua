--@type vim.lsp.Config
return {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_dir = vim.fs.dirname(vim.fs.find({ "pyproject.toml", "setup.py", "requirements.txt", ".git" }, { upward = true })[1]),
	settings = {
		basedpyright = {
			typeCheckingMode = "off",
			reportMissingImports = false,
			reportMissingTypeStubs = false,
		},
	},
}
