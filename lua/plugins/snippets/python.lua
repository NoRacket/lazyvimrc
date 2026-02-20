return {
	s("lm", {
		t "lambda ",
		i(1, "x"),
		t ": ",
		i(0, "body"),
	}),
	s("ini", {
		t "def __init__(self",
		i(1),
		t { "):", "\t" },
		i(0, "pass")
	}),
	s("meth", {
		t "def ",
		i(1, "funcName"),
		t"(self",
		i(2),
		t { "):", "\t" },
		i(0, "pass")
	}),
	s("def", {
		t "def",
		i(1, "funcName"),
		t"(",
		i(2),
		t { "):", "\t" },
		i(0, "pass")
	}),
}
