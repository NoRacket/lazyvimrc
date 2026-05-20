local function close_surrounding (args, parent, user_args)
	return "\\end{" .. args[1][1] .. "}"
end
return {

	s("def", {
		t "\\begin{defn}",
		c(1, {
			t"",
			sn(nil, {
				t"\\label{def:",
				i(1),
				t"}",
			}),
		}),
		t{"", "\t"},
		i(0),
		t {"","\\end{defn}"},
	}),

	s("prop", {
		t "\\begin{prop}",
		c(1, {
			t"",
			sn(nil, {
				t"\\label{prop:",
				i(1),
				t"}",
			}),
		}),
		t{"", "\t"},
		i(0),
		t {"","\\end{prop}"},
	}),

	s("thm", {
		t "\\begin{thm}",
		c(1, {
			t"",
			sn(nil, {
				t"\\label{thm:",
				i(1),
				t"}",
			}),
		}),
		t{"", "\t"},
		i(0),
		t {"","\\end{thm}"},
	}),

	s("lem", {
		t "\\begin{lem}",
		c(1, {
			t"",
			sn(nil, {
				t"\\label{lem:",
				i(1),
				t"}",
			}),
		}),
		t{"", "\t"},
		i(0),
		t {"","\\end{lem}"},
	}),

	s("cor", {
		t "\\begin{cor}",
		c(1, {
			t"",
			sn(nil, {
				t"\\label{cor:",
				i(1),
				t"}",
			}),
		}),
		t{"", "\t"},
		i(0),
		t {"","\\end{cor}"},
	}),

	s("rmk", {
		t "\\begin{rmk}",
		c(1, {
			t"",
			sn(nil, {
				t"\\label{rmk:",
				i(1),
				t"}",
			}),
		}),
		t{"", "\t"},
		i(0),
		t {"","\\end{rmk}"},
	}),

	s("exa", {
		t "\\begin{exa}",
		c(1, {
			t"",
			sn(nil, {
				t"\\label{exa:",
				i(1),
				t"}",
			}),
		}),
		t{"", "\t"},
		i(0),
		t {"","\\end{exa}"},
	}),

	s("exc", {
		t {"\\begin{exc}", "\t"},
		i(0),
		t {"","\\end{exc}"},
	}),

	s("enum", {
		t {"\\begin{enumerate}", "\t\\item "},
		i(0),
		t {"","\\end{enumerate}"},
	}),

	s("item", {
		t {"\\begin{itemize}", "\t\\item "},
		i(0),
		t {"","\\end{itemize}"},
	}),

	s("i", {
		t"\\item",
	}),

	s("eneq", {
		t {"\\begin{enumeq}", "\t\\item "},
		i(0),
		t {"","\\end{enumeq}"},
	}),

	s("bew", {
		t {"\\begin{proof}", "\t"},
		i(0),
		t {"","\\end{proof}"},
	}),

	s("eq", {
		--t {"\\begin{equation*}", "\t"},
		--i(0),
		--t {"","\\end{equation*}"},
		t {"\\[", "\t"},
		i(0),
		t {"","\\]"},
	}),

	s("seq", {
		t {"\\begin{equation*}", "\t"},
		i(0),
		t {"","\\end{equation*}"},
		--t {"\\[", "\t"},
		--i(0),
		--t {"","\\]"},
	}),

	s("split", {
		t {"\\begin{plit}", "\t"},
		i(0),
		t {"","\\end{split}"},
	}),

	s("math", {
		--t {"\\begin{equation*}", "\t"},
		--i(0),
		--t {"","\\end{equation*}"},
		t {"\\(", "\t"},
		i(0),
		t {"","\\)"},
	}),

	s("aln", {
		t {"\\begin{align*}", "\t"},
		i(0),
		t {"","\\end{align*}"},
	}),

	s("neq", {
		t "\\begin{equation}\\label{eq:",
		i(1),
		t{"}","\t"},
		i(0),
		t {"","\\end{equation}"},
	}),

	s("beg", {
		t "\\begin{",
		i(1),
		t{ "}", "\t"},
		i(0),
		t {"",""},
		f(close_surrounding, {1}),
	}),

	s("em", {
		t "\\emph{",
		i(1),
		t"}",
		i(0),
	}),
}
