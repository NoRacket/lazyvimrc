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

		vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
		vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
		vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

		vim.keymap.set({"i", "s"}, "<C-E>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, {silent = true})

		-- ls.add_snippets("java", {
		-- 	-- Very long example for a java class.
		-- 	s("fn", {
		-- 		c(1, {
		-- 			t(""),
		-- 			t("public "),
		-- 			t("private "),
		-- 			t("protected "),
		-- 		}),
		-- 		c(2, {
		-- 			t(""),
		-- 			t("static "),
		-- 		}),
		-- 		i(3, "void"),
		-- 		t(" "),
		-- 		i(4, "funcName"),
		-- 		t("("),
		-- 		i(5),
		-- 		t(")"),
		-- 		c(6, {
		-- 			t(""),
		-- 			sn(nil, {
		-- 				t(" thrwos "),
		-- 				i(1, "Exception"),
		-- 			}),
		-- 		}),
		-- 		t({" {", "\t"}),
		-- 		i(0),
		-- 		t({"", "}"}),
		-- 	}),
		-- 	s("class", {
		-- 		c(1, {
		-- 			t("public "),
		-- 			t(""),
		-- 			t("private "),
		-- 			t("protected "),
		-- 		}),
		-- 		c(2, {
		-- 			t(""),
		-- 			t("abstract "),
		-- 		}),
		-- 		t("class "),
		-- 		i(3, "ClassName"),
		-- 		c(4, {
		-- 			t"",
		-- 			sn(nil, {
		-- 				t" extends ",
		-- 				i(1, "Superclass"),
		-- 			}),
		-- 		}),
		-- 		c(5, {
		-- 			t"",
		-- 			sn(nil, {
		-- 				t" implements ",
		-- 				i(1, "Interfaces"),
		-- 			}),
		-- 		}),
		-- 		t{
		-- 			" {",
		-- 			"\t"
		-- 		},
		-- 		i(0),
		-- 		t{"", "}"},
		-- 	}),
		-- }, {
		-- 		key = "java",
		-- 	})

		ls.add_snippets("sh", {
			s("fn", {
				t("function "),
				i(1, "funcName"),
				t{" {", "\t"},
				i(0),
				t{"", "}"}
			}),
			s("if", {
				t("if "),
				c(1, {
					t("[ "),
					t("[[ "),
					t("(( "),
				}),
				c(2, {
					t(" ]"),
					t(" ]]"),
					t(" ))"),
				}),
				t{"; then", "\t"},
				i(0),
				t{"", "fi"}
			}),
			s("elif", {
				t("elif "),
				c(1, {
					t("[ "),
					t("[[ "),
				}),
				c(2, {
					t(" ]"),
					t(" ]]"),
				}),
				t{"; then", "\t"},
				i(0),
				t{"", "fi"}
			}),
		}, { 
				key = "sh"
			})

		ls.add_snippets("lua",{
			s("fn", {
				t("function "),
				i(1),
				t"(",
				i(2),
				t{")", "\t"},
				i(0),
				t{"", "end"},
			}),
		}, { key = "lua"})

	end
}

