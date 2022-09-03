--[[
Personal configuration file for Neovim
created by Mathias Bolle.
.-..-.               _         
: `: :              :_;        
: .` :.--. .--..-..-.-,-.,-.,-.
: :. ' '_.' .; : `; : : ,. ,. :
:_;:_`.__.`.__.`.__.:_:_;:_;:_;
--]]

require("settings") --personal settings for nvim
require("mappings")
require("colorscheme")
require("plugin-manager") -- packer plugin manager
require("file-explorer") --file explorer
--require("lsp.autocomplete")
--require("lsp.languages") -- language server
require("lsp.lsp")
require("lsp.ui") -- ui customization
--require("fzf-tool")
require("notes")
require("treesitter")
require("closetag")
