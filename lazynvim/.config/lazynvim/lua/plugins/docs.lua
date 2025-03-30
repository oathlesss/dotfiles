return {
  {
    "maskudo/devdocs.nvim",
    lazy = false,
    dependencies = {
      "folke/snacks.nvim",
    },
    keys = {
      {
        "<leader>id",
        mode = "n",
        "<cmd>DevDocs install<cr>",
        desc = "Install Devdocs",
      },
      {
        "<leader>fd",
        mode = "n",
        function()
          local devdocs = require("devdocs")
          local installedDocs = devdocs.GetInstalledDocs()
          vim.ui.select(installedDocs, {}, function(selected)
            if not selected then
              return
            end
            local docDir = devdocs.GetDocDir(selected)
            -- prettify the filename as you wish
            Snacks.picker.files({ cwd = docDir })
          end)
        end,
        desc = "View Devdocs",
      },
    },
    opts = {
      ensure_installed = {
        "go",
        "html",
        "htmx",
        "dom",
        "http",
        "css",
        "bootstrap~5",
        "javascript",
        "lua~5.1",
        "python~3.12",
        "django~5.2",
        "django_rest_framework",
        "docker",
      },
    },
  },
}
