local z_utils = require("telescope._extensions.zoxide.utils")

local exts = {
    zoxide = {
        prompt_title = "[ Zoxide List ]",

        -- Zoxide list command with score
        list_command = "zoxide query -ls",
        mappings = {
            default = {
                action = function(selection)
                    vim.cmd.cd(selection.path)
                end,
                after_action = function(selection)
                    vim.notify("Directory changed to " .. selection.path)
                end,
            },
            ["<C-t>"] = {
                action = function(selection)
                    vim.cmd.tcd(selection.path)
                end,
            },
        }
    }
}

return exts
