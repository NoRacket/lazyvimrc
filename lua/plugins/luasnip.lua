return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",

	config = function()
		local ls = require("luasnip")
		local s = ls.snippet
		local sn = ls.snippet_node
		local t = ls.text_node
		local i = ls.insert_node
		local f = ls.function_node
		local c = ls.choice_node
		local d = ls.dynamic_node
		local r = ls.restore_node
		local l = require("luasnip.extras").lambda
		local rep = require("luasnip.extras").rep
		local p = require("luasnip.extras").partial
		local m = require("luasnip.extras").match
		local n = require("luasnip.extras").nonempty
		local dl = require("luasnip.extras").dynamic_lambda
		local fmt = require("luasnip.extras.fmt").fmt
		local fmta = require("luasnip.extras.fmt").fmta
		local types = require("luasnip.util.types")
		local conds = require("luasnip.extras.conditions")
		local conds_expand = require("luasnip.extras.conditions.expand")

		vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<C-E>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true })
		ls.setup({
			snip_env = {
				s = ls.snippet,
				sn = ls.snippet_node,
				t = ls.text_node,
				i = ls.insert_node,
				f = ls.function_node,
				c = ls.choice_node,
				d = ls.dynamic_node,
				r = ls.restore_node,
				l = require("luasnip.extras").lambda,
				rep = require("luasnip.extras").rep,
				p = require("luasnip.extras").partial,
				m = require("luasnip.extras").match,
				n = require("luasnip.extras").nonempty,
				dl = require("luasnip.extras").dynamic_lambda,
				fmt = require("luasnip.extras.fmt").fmt,
				fmta = require("luasnip.extras.fmt").fmta,
				types = require("luasnip.util.types"),
				conds = require("luasnip.extras.conditions"),
				conds_expand = require("luasnip.extras.conditions.expand"),
			}
		})
		require("luasnip.loaders.from_lua").load({ paths = os.getenv("HOME") .. "/.config/nvim/lua/plugins/snippets" })
	end
}
