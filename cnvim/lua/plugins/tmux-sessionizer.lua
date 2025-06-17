return {
    {
        "kkanden/tmux-sessionizer.nvim",
        opts = {
            directories = { "~/personal/repos", "~/work/repos", "~" },
            max_depth = 1,
        },
        keys = {

            {
                "<leader>t",
                "<Cmd>Tmux<CR>",
            },
        },
    }
}
