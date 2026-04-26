-- Bootstrap lazy.nvim
print("Started nvim in headless mode")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print("lazypath is " .. lazypath)
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        error("Failed to clone lazy.nvim:\n" .. out)
    end
end
vim.opt.rtp:prepend(lazypath)
print("lazy.nvim is downloaded")
-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { -- Highlight, edit, and navigate code
            'nvim-treesitter/nvim-treesitter',
            -- Not technically a dependency.
            dependencies = { "nvim-treesitter/nvim-treesitter-textobjects"},
            lazy = false,
            build = ':TSUpdate',
            branch = 'main',
            -- [[ Configure Treesitter ]] See `:help nvim-treesitter-intro`
            config = function()
                local ts = require('nvim-treesitter')
                local ts_install_dir = vim.env.XDG_DATA_DIRS .. '/nvim/site'
                -- local ts_install_dir = vim.fn.stdpath('data') .. '/site'
                ts.setup({
                    install_dir = ts_install_dir
                })
                print("Treesitter install_dir is " .. ts_install_dir)
                -- ensure basic parser are installed
                -- Execute `:=require('nvim-treesitter').get_available()`
                ts.install({ 
                    "bash",
                    "c",
                    "comment",
                    "commonlisp",
                    "css",
                    "csv",
                    "diff",
                    "dockerfile",
                    "editorconfig",
                    "fish",
                    "git_config",
                    "gitcommit",
                    "gitignore",
                    "gitattributes",
                    "html",
                    "json",
                    "just",
                    "lua",
                    "luadoc",
                    "make",
                    "markdown",
                    "markdown_inline",
                    "matlab",
                    "powershell",
                    "python",
                    "regex",
                    "scheme",
                    "ssh_config",
                    "todotxt",
                    "toml",
                    "tsv",
                    "vhs",
                    "vim",
                    "vimdoc",
                    "xresources",
                    "yaml"
                }):wait() -- makes it synchronous?
                -- }):wait(300000) -- wait max. 5 minutes
            end,
        },
    },
    git = {
        log = { "-2" },
    },

    rocks = {
        enabled = false,
    },
})
print("Done with lazy and treesitter")
vim.cmd('qa!')
