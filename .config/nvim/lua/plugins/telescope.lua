local builtin = require("telescope.builtin")
local telescope = {
   {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
}

return telescope
