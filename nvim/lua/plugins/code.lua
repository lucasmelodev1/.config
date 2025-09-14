return {
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate" },

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
