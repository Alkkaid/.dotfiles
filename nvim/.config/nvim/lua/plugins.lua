vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

function get_config(name)
  return string.format('require("configs/%s")', name)
end

return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}

    use 'folke/tokyonight.nvim'

    use { 'neovim/nvim-lspconfig',
        config = get_config("lsp")} 

    use {
        'nvim-lualine/lualine.nvim',
            requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
	config = get_config("treesitter")
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
        }
    use {
	'filipdutescu/renamer.nvim',
	branch = 'master',
	requires = {'nvim-lua/plenary.nvim'},
	config = get_config("renamer") }

    use({
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = get_config("autopairs"),
    })


    -- AutoCompletion Stuff
    use { 'hrsh7th/nvim-cmp',
        config = get_config("cmp") }
    use { 'hrsh7th/cmp-nvim-lsp' } 
    use { 'hrsh7th/cmp-vsnip' }

    use { 'hrsh7th/vim-vsnip' }


    -- LSPSaga
    use { 'glepnir/lspsaga.nvim',
        config = get_config("lspsaga") }

end)

