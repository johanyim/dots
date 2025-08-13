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
vim.opt.wildmenu = true
vim.opt.spelllang = "en_gb"
vim.opt.termguicolors = true

vim.pack.add({
    { src = "https://github.com/kylechui/nvim-surround.git" },
    { src = "https://github.com/catppuccin/nvim.git" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons.git" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/ThePrimeagen/harpoon" },
    { src = "https://github.com/alexghergh/nvim-tmux-navigation.git" },
    { src = "https://github.com/folke/todo-comments.nvim" },
    { src = "https://github.com/NvChad/nvim-colorizer.lua" },
    
    { src = "https://github.com/simrat/rustaceanvim.git" },
})

vim.keymap.set("n", "<C-y>", '"*y :let @+=@*<CR>', { noremap = true, desc = "Copy to clipboard" })
vim.keymap.set("v", "<C-y>", '"*y :let @+=@*<CR>', { noremap = true, desc = "Copy to clipboard" })
vim.keymap.set("n", "<space>r", "<cmd>source %<CR>")
vim.keymap.set("n", "<C-Right>", "e", { noremap = true, desc = "C-Arrow move right" })
vim.keymap.set("v", "<C-Right>", "e", { noremap = true, desc = "C-Arrow move right" })
vim.keymap.set("n", "<C-Left>", "b", { noremap = true, desc = "C-Arrow move left" })
vim.keymap.set("v", "<C-Left>", "b", { noremap = true, desc = "C-Arrow move left" })

vim.lsp.enable({"lua_ls"})

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
    color_overrides = {
        latte = {},
        frappe = {},
        macchiato = {},
        mocha = {},
    },
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

require("mini.pick").setup({})
vim.keymap.set("n", "<space><space>", "<cmd>Pick files<CR>", {})


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
        WARN = { icon = " ", color = "#f9e2af", alt = { "WARNING" } },
        NOTE = { icon = " ", color = "#b4befe", alt = { "INFO" } },
        IDEA = { icon = "󰛨 ", color = "#f9e2af", alt = { "FUTURE" } },
    },
    highlight = {multiline = true}
})


require("colorizer").setup({
    user_default_options = {
        tailwind = true,
    }
})

