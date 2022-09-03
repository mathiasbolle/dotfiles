require('nvim-treesitter.configs').setup {
    ensure_installed = { "norg", "c_sharp", "css", "cpp", "rust", "javascript", "json", "vue", "html", "kotlin", "prisma" --[[ other parsers you would wish to have ]] },
    highlight = { -- Be sure to enable highlights if you haven't!
        enable = true,
    },
		--[[autotag = {
    	enable = true,
  	}]]--
}
