require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    school = "~/notes/school",
                    home = "~/notes/home",
                }
            }
        },
				["core.norg.concealer"] = {},
				["core.norg.completion"] = {
					config = {
						engine = 'nvim-cmp'
					}
				},
				["core.norg.journal"] = {
   				config = { -- Note that this table is optional and doesn't need to be provided
       			-- Configuration here
   				}
				},

				--[[["core.norg.concealer"] = {},
				["core.integrations.treesitter"] = {},
				["core.norg.completion"] = {
					config = {},
				},]]--
    }
}
