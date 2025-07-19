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
        local isn = ls.indent_snippet_node
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node
        local c = ls.choice_node
        local d = ls.dynamic_node
        local r = ls.restore_node
        local events = require("luasnip.util.events")
        local ai = require("luasnip.nodes.absolute_indexer")
        local extras = require("luasnip.extras")
        local l = extras.lambda
        local rep = extras.rep
        local p = extras.partial
        local m = extras.match
        local n = extras.nonempty
        local dl = extras.dynamic_lambda
        local fmt = require("luasnip.extras.fmt").fmt
        local fmta = require("luasnip.extras.fmt").fmta
        local conds = require("luasnip.extras.expand_conditions")
        local postfix = require("luasnip.extras.postfix").postfix
        local types = require("luasnip.util.types")
        local parse = require("luasnip.util.parser").parse_snippet
        local ms = ls.multi_snippet
        local k = require("luasnip.nodes.key_indexer").new_key

        vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true })

        -- ls.add_snippets("all", {
        --     ls.parser.parse_snippet("ifsh", "if [ $1 ]; then\n\t$0\nfi"),
        -- })

        ls.add_snippets("sh", {
            ls.parser.parse_snippet("if", "if [ $1 ]; then\n\t$0\nfi"),
            ls.parser.parse_snippet("fun", "function $1 {\n\t$0\n}"),
        })


        ls.add_snippets("tex", {
            ls.parser.parse_snippet("sec", "\\section{$1}\\label{sec:$2}\n$0"),
            ls.parser.parse_snippet("sub", "\\subsection{$1}\\label{sub:$2}\n$0"),
            ls.parser.parse_snippet("em", "\\emph{$1}$0"),
            ls.parser.parse_snippet("bf", "\\textbf{$1}$0"),
            ls.parser.parse_snippet("it", "\\textit{$1}$0"),
            ls.parser.parse_snippet("rm", "\\mathrm{$1}$0"),
            ls.parser.parse_snippet("cal", "\\mathcal{$1}$0"),
            ls.parser.parse_snippet("fr", "\\mathfrak{$1}$0"),
            ls.parser.parse_snippet("frac", "\\frac{$1}{$2}$0"),
            ls.parser.parse_snippet("begin", "\\begin{$1}\n\t$0\n\\end{$1}"),
            ls.parser.parse_snippet("eq", "\\begin{equation*}\n\t$0\n\\end{equation*}"),
            ls.parser.parse_snippet("eqn", "\\begin{equation}\\label{eq:$1}\n\t$0\n\\end{equation}"),
            ls.parser.parse_snippet("def", "\\begin{definition}\\label{def:$1}\n\t$0\n\\end{definition}"),
            ls.parser.parse_snippet("thm", "\\begin{theorem}\\label{thm:$1}\n\t$0\n\\end{theorem}"),
            ls.parser.parse_snippet("lem", "\\begin{lemma}\\label{lem:$1}\n\t$0\n\\end{lemma}"),
            ls.parser.parse_snippet("prop", "\\begin{proposition}\\label{prop:$1}\n\t$0\n\\end{proposition}"),
            ls.parser.parse_snippet("cor", "\\begin{corollary}\\label{cor:$1}\n\t$0\n\\end{corollary}"),
            ls.parser.parse_snippet("aufg", "\\begin{aufgabe}\\label{aufg:$1}\n\t$0\n\\end{aufgabe}"),
            ls.parser.parse_snippet("rem", "\\begin{remark}\\label{rem:$1}\n\t$0\n\\end{remark}"),
            ls.parser.parse_snippet("rems", "\\begin{remarks}\\label{rems:$1}\n\t$0\n\\end{remarks}"),
            ls.parser.parse_snippet("proof", "\\begin{proof}\n\t$0\n\\end{proof}"),
            ls.parser.parse_snippet("enum", "\\begin{enumerate}\n\t\\item $0\n\\end{enumerate}"),
            ls.parser.parse_snippet("enumeq", "\\begin{myequivalent}\n\t\\item $0\n\\end{myequivalent}"),
            ls.parser.parse_snippet("item", "\\begin{myitemize}\n\t\\item $0\n\\end{myitemize}"),
            ls.parser.parse_snippet("i", "\\item "),
            ls.parser.parse_snippet("sum", "\\sum_{$1}^{$2} $0"),
        })
    end,

}
