return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = false,
        build = ":TSUpdate"
    },
    { "mason-org/mason.nvim", opts = {} },
    { "neovim/nvim-lspconfig" },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },

    -- dap
    { 'mfussenegger/nvim-dap' },
    { "rcarriga/nvim-dap-ui",            dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }, opts = {} },
    { 'theHamsta/nvim-dap-virtual-text', dependencies = { "mfussenegger/nvim-dap" },                          opts = {} },
    { 'leoluz/nvim-dap-go',              opts = {} },

    -- nvim-cmp
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },

    -- Snippet engines
    { "hrsh7th/vim-vsnip" },
    { "hrsh7th/cmp-vsnip" },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        'windwp/nvim-ts-autotag',
        lazy = false,
        opts = {}
    },
    { 'onsails/lspkind.nvim' }
}
