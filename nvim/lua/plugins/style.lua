return {
    { "catppuccin/nvim",                name = "catppuccin", priority = 1000 },
    -- Bottom bar with useful info
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    -- Line in each indentation
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {
            indent = { char = "│" }
        },
    },
    { "lukas-reineke/virt-column.nvim", opts = {} },
}
