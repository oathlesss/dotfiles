return {
    -- {
    --     'tjdevries/present.nvim'
    -- },
    -- {
    --   'Chaitanyabsprip/present.nvim',
    --   opts = {
    --     -- ... your config here
    --   },
    -- },
    {
        "sotte/presenting.nvim",
        opts = {
            -- fill in your options here
            -- see :help Presenting.config
            options = {
                width = 120,
            },
        },
        cmd = { "Presenting" },
    }
}
