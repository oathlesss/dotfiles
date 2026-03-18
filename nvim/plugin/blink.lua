require("blink.cmp").setup({
  fuzzy = {
    implementation = "lua", -- use pure Lua, no binary needed
  },
  keymap     = { preset = "default" },
  sources    = { default = { "lsp", "path", "snippets", "buffer" } },
  completion = {
    trigger       = { show_on_keyword = true, show_on_trigger_character = true },
    menu          = { auto_show = true },
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
  },
})

