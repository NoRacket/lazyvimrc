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
		i(0, "body")
	}),
}
