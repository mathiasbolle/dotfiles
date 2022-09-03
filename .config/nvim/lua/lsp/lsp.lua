--servers
local servers = {"rust_analyzer", "tsserver", "emmet_ls", "kotlin_language_server", "prismals"}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  --vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)


  --Format on save
	--look at https://github.com/neovim/nvim-lspconfig/issues/699

  if client.resolved_capabilities.document_formatting then
	  vim.cmd [[augroup Format]]
	 vim.cmd [[autocmd! * <buffer>]]
	 vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
	 vim.cmd [[augroup END]]
	end
	--
	--
	

	--for eslint
	vim.cmd [[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js,*.vue,*jsx EslintFixAll]]
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
		{ name = 'neorg'}
  }, {
		{name = 'buffer'},
	}),
}


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true --needed for html
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
		capabilities = capabilities,
    on_attach = on_attach,
  }
end

--additional LSP servers:
require('lspconfig')['html'].setup {
  capabilities = capabilities,
	on_attach = on_attach,
	filetypes= {"html", "jsp"}
}
require('lspconfig')['cssls'].setup {
  capabilities = capabilities,
	on_attach = on_attach,
}
require("lspconfig")["volar"].setup {
  capabilities = capabilities,
	on_attach = on_attach,
}
require("lspconfig")['eslint'].setup {
  capabilities = capabilities,
	on_attach = on_attach,
}
require("lspconfig")["texlab"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		texlab = {
    	auxDirectory = ".",
    	bibtexFormatter = "texlab",
    	build = {
      	args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
      	executable = "latexmk",
      	forwardSearchAfter = false,
      	onSave = true
    	},
		}
	}
}
