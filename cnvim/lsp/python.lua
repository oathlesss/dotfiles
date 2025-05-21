return {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "pyrightconfig.json",
        ".git",
    },
    settings = {
        basedpyright = {
            analysis = {
                -- stubPath = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "python-type-stubs"),
                typeCheckingMode = "off",
                -- ignore = { "reportUnreachable" },
                disableOrganizeImports = true,
                useTypingExtensions = true,
                diagnosticMode = "openFilesOnly",
            },
        },
    },
}
