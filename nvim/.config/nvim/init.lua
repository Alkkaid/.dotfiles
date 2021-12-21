local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- global options
o.scrolloff = 8
o.smarttab = true

-- windows-local options
wo.number = true
wo.relativenumber = true



-- buffer-local options
bo.smartindent = true
bo.softtabstop = 4
bo.shiftwidth = 4
bo.expandtab = true
bo.tabstop = 4

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]

-- vim.cmd[[set clipboard+=unnamedplus]]

require('plugins')
require('mappings')


USER = vim.fn.expand('$USER')


-- lualine
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'tokyonight'
    -- ... your lualine config
  }
}

vim.g.tokyonight_style = "night"

----------------------------
-- LSP Servers -- I dont really know any other way of putting them

require('lspconfig').pyright.setup{}

-- lua language server
-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
    sumneko_root_path = "/Users/" .. USER .. "/.config/nvim/lua-language-server"
    sumneko_binary = "/Users/" .. USER .. "/.config/nvim/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
    sumneko_root_path = "/home/" .. USER .. "/.config/nvim/lua-language-server"
    sumneko_binary = "/home/" .. USER .. "/.config/nvim/lua-language-server/bin/Linux/lua-language-server"
else
    print("Unsupported system for sumneko")
end

require('lspconfig').sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
}

-- bash
require('lspconfig').bashls.setup{}
-- c++ c 
require'lspconfig'.ccls.setup{}

