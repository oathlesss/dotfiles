local theme_root = vim.fn.expand("~/.config/theme")
local name_file = theme_root .. "/name"
local switch_script = theme_root .. "/switch.sh"
local managed_themes = {
  "catppuccin-mocha",
  "tokyonight",
  "tokyonight-storm",
  "gruvbox",
  "rose-pine-moon",
  "kanagawa-wave",
  "nightfox",
  "onedark",
  "vague",
  "afterglow",
  "evergarden",
  "miasma",
  "neverland",
  "yugen",
  "melange",
  "citruszest",
  "boo",
}

local managed_theme_set = {}
for _, theme_name in ipairs(managed_themes) do
  managed_theme_set[theme_name] = true
end

local M = {}
local picker_active = false

local function read_saved_theme()
  local file = io.open(name_file, "r")
  if not file then
    return nil
  end

  local theme_name = file:read("*l")
  file:close()

  if not theme_name then
    return nil
  end

  theme_name = theme_name:gsub("%s+", "")
  if managed_theme_set[theme_name] then
    return theme_name
  end

  return nil
end

local function apply_theme(theme_name)
  if not theme_name or theme_name == "" then
    return false
  end

  vim.o.background = "dark"
  local ok = pcall(vim.cmd.colorscheme, theme_name)
  return ok
end

local function ensure_default_theme()
  local default_theme = "catppuccin-mocha"
  if apply_theme(read_saved_theme()) then
    return
  end

  apply_theme(default_theme)
end

ensure_default_theme()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function(args)
    if picker_active then
      return
    end

    local theme_name = args.match
    if not theme_name or theme_name == "" then
      return
    end

    if not managed_theme_set[theme_name] then
      return
    end

    vim.fn.jobstart({ switch_script, theme_name }, {
      detach = true,
      on_exit = function(_, code)
        if code ~= 0 then
          vim.schedule(function()
            vim.notify(
              "Theme cascade failed for " .. theme_name,
              vim.log.levels.WARN
            )
          end)
        end
      end,
    })
  end,
})

M.set_picker_active = function(active)
  picker_active = active
end

M.get_managed_themes = function()
  return vim.deepcopy(managed_themes)
end

M.get_saved_theme = function()
  return read_saved_theme()
end

M.apply_managed_theme = function(theme_name)
  if not managed_theme_set[theme_name] then
    return false
  end

  return apply_theme(theme_name)
end

M.enforce_dark_background = function()
  vim.o.background = "dark"
end

return M
