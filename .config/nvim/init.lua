local vim = vim
local TAB_SIZE = 4
local SCROLL_OFF = 4
vim.opt.tabstop = TAB_SIZE
vim.opt.shiftwidth = TAB_SIZE
vim.opt.scrolloff = SCROLL_OFF
vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.wo.number = true
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.autoread = true
vim.opt.history = 10000
vim.opt.showmode = false
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.wildmenu = true
vim.opt.spelllang = "en_gb"
vim.opt.termguicolors = true

vim.opt.winborder = "rounded"


vim.pack.add({
    { src = "https://github.com/kylechui/nvim-surround.git" },
    { 
        src = "https://github.com/catppuccin/nvim.git",
        -- version = "v1.10.0",
        -- opt = false,
    },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons.git" },
    { src = "https://github.com/echasnovski/mini.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/ThePrimeagen/harpoon" },
    { src = "https://github.com/alexghergh/nvim-tmux-navigation.git" },
    { src = "https://github.com/folke/todo-comments.nvim" },
    { src = "https://github.com/NvChad/nvim-colorizer.lua" },
    { src = "https://github.com/mason-org/mason.nvim"},
    { src = "https://github.com/neovim/nvim-lspconfig.git"},
    { src = "https://github.com/simrat39/rust-tools.nvim"},
    { src = "https://github.com/vxpm/ferris.nvim"},
    { src = "https://github.com/rust-lang/rust.vim"},
    { src = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"},
    { src = "https://github.com/nvim-treesitter/nvim-treesitter.git"},
    -- { src = "https://github.com/simrat/rustaceanvim.git" },
})


vim.keymap.set("n", "<C-y>", '"*y :let @+=@*<CR>', { noremap = true, desc = "Copy to clipboard" })
vim.keymap.set("v", "<C-y>", '"*y :let @+=@*<CR>', { noremap = true, desc = "Copy to clipboard" })
vim.keymap.set("n", "<space>r", "<cmd>source %<CR>")
vim.keymap.set("n", "<C-Right>", "e", { noremap = true, desc = "C-Arrow move right" })
vim.keymap.set("v", "<C-Right>", "e", { noremap = true, desc = "C-Arrow move right" })
vim.keymap.set("n", "<C-Left>", "b", { noremap = true, desc = "C-Arrow move left" })
vim.keymap.set("v", "<C-Left>", "b", { noremap = true, desc = "C-Arrow move left" })

vim.lsp.enable({"lua_ls", "svelte-language-server" })

vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {})

vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
-- vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})


require("nvim-surround").setup({
    move_cursor = false,
})




require("catppuccin").setup({
    no_italic = true,
    highlight_overrides = {
        all = function(colors)
            return {
                Normal = { fg = colors.text, bg = colors.crust },
                NormalNC = { fg = colors.text, bg = colors.crust },
                NormalFloat = { fg = colors.text, bg = colors.crust },
                CursorLine = { bg = colors.mantle },
                LineNr = { fg = colors.surface0 },
                Comment = { style = {} },
                NonText = { style = { "bold" } },

                DiagnosticVirtualTextError = { fg = colors.red },
                DiagnosticVirtualTextWarning = { fg = colors.yellow },
                DiagnosticVirtualTextInfo = { fg = colors.sapphire },
                DiagnosticVirtualTextHint = { fg = colors.teal },

                GhostText = { fg = colors.surface1 }, -- completions color
                LspInlayHint = { fg = colors.surface1, bg = colors.none },

                RenderMarkdownTableHead = { fg = colors.blue },
                RenderMarkdownTableRow = { fg = colors.subtext1 },

                StatusLine = { fg = colors.overlay0, bg = colors.none },
            }
        end,
    },
    integrations = {
        cmp = true,
        treesitter = true,
        harpoon = true,
        mason = true,
        mini = {
            enabled = true,
            indentscope_color = "green",
        },
        -- removes some of the stupid colors on rust 
        semantic_tokens = false,
        nvim_surround = true,



    },
})


vim.cmd[[colorscheme catppuccin-mocha]]


require("oil").setup({
    default_file_explorer = true,
    columns = {"permissions", "size", "icon"},
    experimental_watch_for_changes = true,
    view_options = {
        show_hidden = true,
    },
})
vim.keymap.set("n", "-", "<cmd>Oil<CR>", {})


require("mini.extra").setup({})
require("mini.pick").setup({})
vim.keymap.set("n", "<space><space>", "<cmd>Pick resume<CR>", {}) -- TODO: defult to Pick files
vim.keymap.set("n", "<space>f", "<cmd>Pick files<CR>", {}) 
vim.keymap.set("n", "<space>o", "<cmd>Pick oldfiles<CR>", {})
vim.keymap.set("n", "<space>g", "<cmd>Pick grep_live<CR>", {})
vim.keymap.set("n", "z=", "<cmd>Pick spellsuggest<CR>", {})

require("mini.pairs").setup({})
require("mini.notify").setup({})


require("harpoon").setup({
    save_on_toggle = false,    
    save_on_change = true,    
    enter_on_sendcmd = false,    
    tmux_autoclose_windows = false,    
    excluded_filetypes = { "harpoon" },    
    mark_branch = false,    
    tabline = false,
    tabline_prefix = " |",
    tabline_suffix = "| ",
})


require('nvim-tmux-navigation').setup({
    keybindings = {
        left =  "<A-h>",
        down =  "<A-j>",
        up =    "<A-k>",
        right = "<A-l>",
    }
})

local harpoon_ui = require("harpoon.ui")
vim.keymap.set("n", "<C-H>", require("harpoon.mark").add_file)
vim.keymap.set("n", "<C-J>", harpoon_ui.nav_next) 
vim.keymap.set("n", "<C-K>", harpoon_ui.nav_prev)
vim.keymap.set("n", "<C-L>", harpoon_ui.toggle_quick_menu)


require("todo-comments").setup({
    keywords = {
        TODO = { icon = " ", color = "#f2cdcd"},
        NOTE = { icon = " ", color = "#b4befe", alt = { "INFO", "DEBUG" } },
        WARN = { icon = " ", color = "#f9e2af", alt = { "WARNING" } },
        IDEA = { icon = "󰛨 ", color = "#fab387", alt = { "FUTURE" } },
        ERROR ={ icon = " ", color = "#f38ba8", alt = {"BUG", "FIXME"} },
        STEP0 = { icon = "󰎡 ", color = "#b4befe", alt = { "0." } },
        STEP1 = { icon = "󰎤 ", color = "#b4befe", alt = { "1." } },
        STEP2 = { icon = "󰎧 ", color = "#b4befe", alt = { "2." } },
        STEP3 = { icon = "󰎪 ", color = "#b4befe", alt = { "3." } },
        STEP4 = { icon = "󰎭 ", color = "#b4befe", alt = { "4." } },
        STEP5 = { icon = "󰎱 ", color = "#b4befe", alt = { "5." } },
        STEP6 = { icon = "󰎳 ", color = "#b4befe", alt = { "6." } },
        STEP7 = { icon = "󰎶 ", color = "#b4befe", alt = { "7." } },
        STEP8 = { icon = "󰎹 ", color = "#b4befe", alt = { "8." } },
        STEP9 = { icon = "󰎼 ", color = "#b4befe", alt = { "9." } },
        STEP10 ={ icon = "󰽽 ", color = "#b4befe", alt = { "10." } },
    },
    highlight = {multiline = true}
})

require("colorizer").setup({
    user_default_options = {
        tailwind = true,
    }
})

-- RUST
vim.g.rustfmt_autosave = 1
require("rust-tools").setup({ 
    tools = {
        inlay_hints = {
            auto = true,
            only_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = "<= ",
            other_hints_prefix = "-> ",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 3,
            highlight = "LspInlayHint",
        },
        hover_actions = {
            auto_focus = false,
        },
    },
    server = {
        on_attach = function(_, bufnr)
            -- Info and documentation + Hover actions
            -- vim.lsp.inlay_hint.enable(false)
        end,
    },
})
require("mason").setup({ })
require("ferris").setup({ })
require("lsp_lines").setup({ })
local diagnostics_active = true
vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = true,
})

vim.keymap.set("n", "<leader>d", function()
    if diagnostics_active then
        vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = true,
        })
    else
        vim.diagnostic.config({
            virtual_text = true,
            virtual_lines = false,
        })

    end
    diagnostics_active = not diagnostics_active
end)


require("nvim-treesitter").setup({})

require("nvim-treesitter.configs").setup({
    ensure_installed = {"rust", "lua"},
    highlight = {
        enable = true,
    },
    indent = { enable = true },
    sync_install = true,
    auto_install = true,
})


vim.pack.add({
    { src = "https://github.com/hrsh7th/nvim-cmp.git"},
    { src = "https://github.com/roobert/tailwindcss-colorizer-cmp.nvim" },
    { src = "https://github.com/L3MON4D3/LuaSnip.git"},
    -- dependencies "rafamadriz/friendly-snippets" },
    { src = "https://github.com/saadparwaiz1/cmp_luasnip.git" },
    { src = "https://github.com/neovim/nvim-lspconfig.git" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp.git" },
    { src = "https://github.com/hrsh7th/cmp-buffer.git" },
    { src = "https://github.com/hrsh7th/cmp-path.git" },
    { src = "https://github.com/hrsh7th/cmp-cmdline.git" },
})


local cmp = require("cmp")
cmp.setup({
    sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },
    }, {
        { name = "buffer" },
    }),
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),

        -- Alt-L must have a selection, cannot auto select
        ["<M-l>"] = cmp.mapping.confirm({
            i = function(fallback)
                if cmp.visible() and cmp.get_active_entry() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    fallback()
                end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        }),
        ["<M-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<M-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    }),
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    experimental = {
        ghost_text = { hl_group = "GhostText" },
    },
})
