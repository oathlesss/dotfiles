return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        -- Follow this to make deletion work
        -- https://github.com/folke/snacks.nvim/discussions/1058
        config = function()
            local harpoon = require("harpoon")

            local function generate_harpoon_picker()
                local file_paths = {}
                for _, item in ipairs(harpoon:list().items) do
                    table.insert(file_paths, {
                        text = item.value,
                        file = item.value,
                    })
                end
                return file_paths
            end

            harpoon:setup({})

            local snacks_picker = require("snacks.picker")
            snacks_picker.harpoon = function()
                Snacks.picker.pick({

                    finder = generate_harpoon_picker,
                    format = SnacksFormatter,
                    title = "Harpoon",
                    on_show = function()
                        -- I always want my buffers picker to start in normal mode
                        vim.cmd.stopinsert()
                    end,
                    confirm = function(picker, item)
                        picker:close()
                        -- Custom action to jump using harpoon
                        harpoon:list():select(item.idx)
                    end,
                    preview = "file", -- Show file preview
                    -- layout = "vertical",
                    layout = SnacksPickerLayout,
                    win = {
                        input = {
                            keys = {
                                ["d"] = { "harpoon_delete", mode = { "n", "x" } },
                            },
                        },
                        list = {
                            keys = {
                                ["d"] = { "harpoon_delete", mode = { "n", "x" } },
                            },
                        },
                    },
                    actions = {
                        harpoon_delete = function(picker, item)
                            local to_remove = item or picker:selected()
                            table.remove(harpoon:list().items, to_remove.idx)
                            picker:find({
                                refresh = true,
                            })
                        end,
                    },
                })
            end

            vim.keymap.set("n", "<leader>hh", function()
                Snacks.picker.harpoon()
            end, { desc = "Open harpoon window" })

            -- Default UI
            vim.keymap.set("n", "<leader>he", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = "Harpoon edit" })

            vim.keymap.set("n", "<leader>ha", function()
                harpoon:list():add()
            end, { desc = "Harpoon add" })

            vim.keymap.set("n", "<leader>1", function() -- qwer == 1234
                harpoon:list():select(1)
            end, { desc = "Harpoon 1" })

            vim.keymap.set("n", "<leader>2", function()
                harpoon:list():select(2)
            end, { desc = "Harpoon 2" })

            vim.keymap.set("n", "<leader>3", function()
                harpoon:list():select(3)
            end, { desc = "Harpoon 3" })

            vim.keymap.set("n", "<leader>4", function()
                harpoon:list():select(4)
            end, { desc = "Harpoon 4" })

            -- Toggle previous & next buffers stored within Harpoon list
            vim.keymap.set("n", "<leader>hp", function()
                harpoon:list():prev()
            end, { desc = "Harpoon next" })

            vim.keymap.set("n", "<leader>hn", function()
                harpoon:list():next()
            end, { desc = "Harpoon previous" })
        end,
    }
}
