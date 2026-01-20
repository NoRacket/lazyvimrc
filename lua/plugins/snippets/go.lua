return {
	-- local function go_result_type(info)
	-- 	local function_node_types = {
	-- 		function_declaration = true,
	-- 		method_declaration = true,
	-- 		func_literal = true,
	-- 	}
	-- 	
	-- 	-- Find the first function node that's parent of the cursor
	-- 	local node = vim.treesitter.get_node()
	-- 	while node ~= nil do
	-- 		if function_node_types[node:type()] then
	-- 			break
	-- 		end
	-- 		node = node:parent()
	-- 	end

	-- 	-- Exit if no match
	-- 	if not node then
	-- 		vim.notify "Not inside of a fucntion"
	-- 		return t ""
	-- 	end

	-- 	local query = assert(vim.treesitter.query.get("go", "return-snippet"), "No query")
	-- 	for _, capture in query:iter_captures(node, 0) do
	-- 		if handlers[capture:type()] then
	-- 			return handlers[capture:type()](capture, info)
	-- 		end
	-- 	end
	-- end

	-- local function go_return_values(args)
	-- 	return sn(nil, go_result_type {
	-- 		index = 0,
	-- 		err_name = args[1][1],
	-- 		func_name = args[2][1],
	-- 	})
	-- end

	-- local default_values = {
	-- 	int = "0",
	-- 	bool = "false",
	-- 	string = '""',
	-- 	error = function (_, info)
	-- 		if info then
	-- 			info.index = info.index + 1
	-- 			return c(info.index, {
	-- 				t(info.err_name),
	-- 				t(string.format('errors.Wrap(%s, "%s")', info.err_name, info.func_name)),
	-- 			})
	-- 		else
	-- 			return t "err"
	-- 		end
	-- 	end,
	-- 	[function (text)
	-- 		return string.find(text, "*", 1, true) ~= nil
	-- 	end] = function(_,_)
	-- 		return nil
	-- 	end,
	-- 	[function (text)
	-- 		return not string.find(text, "*", 1, true) and string.upper(string.sub(text, 1, 1)) == string.sub(text, 1, 1)
	-- 	end] = function (text, info)
	-- 		info.index = info.index + 1
	-- 		return c(info.index, {
	-- 			t(text .. {}),
	-- 			t(text),
	-- 		})
	-- 	end,
	-- }
	-- local function transform(text, info)
	-- 	local condition_matches = function (condition, ...)
	-- 		if type(condition) == "string" then
	-- 			return condition == text
	-- 		else
	-- 			return condition(...)
	-- 		end
	-- 	end

	-- 	for condition, result in pairs(default_values) do
	-- 		if condition_matches(condition, text, info) then
	-- 			return t(result)
	-- 		else
	-- 			return result(text, info)
	-- 		end
	-- 	end
	-- 	return t(text)
	-- end

	s("fn", {
		t "func ",
		i(1),
		t "(",
		i(2),
		t ")",
		i(3),
		t { " {", "\t" },
		i(0),
		t { "", "}" }
	}),
	-- 			s("efi", fmta([[
	-- <val>, <err> := <f>(<args>)
	-- if <err_same> != nil {
	-- 	return <result>
	-- }
	-- <finish>
	-- ]],
	-- 				{
	-- 					val      = i(1),
	-- 					err      = i(2, "err"),
	-- 					f        = i(3),
	-- 					args     = i(4),
	-- 					err_same = rep(s),
	-- 					result   = d(5, go_return_values, {2, 3}),
	-- 					finish   = i(0),
	-- 				}
	-- 			)),
	-- 			s("err", {
	-- 				t"if ",
	-- 				c(1, {
	-- 					t"err != nil",
	-- 					sn(nil, {
	-- 						t"err := ",
	-- 						i(1),
	-- 						t"; err != nil"
	-- 					}),
	-- 				}),
	-- 				t{" {", "\treturn "},
	-- 				i(2),
	-- 				t{", err","}"},
	-- 				i(0),
	-- 			}),
	s("if", {
		t "if ",
		i(1, "cond"),
		t { " {", "\t" },
		i(0),
		t { "", "}" },
	}),
	s("elif", {
		t "else if ",
		i(1, "cond"),
		t { " {", "\t" },
		i(0),
		t { "", "}" },
	}),
	s("else", {
		t { "else {", "\t" },
		i(0),
		t { "", "}" },
	}),
	s("for", {
		t "for ",
		i(1),
		t { "{", "\t" },
		i(0),
		t { "", "}" },
	}),
	s("switch", {
		t "switch ",
		i(1),
		t { " {", "case " },
		i(2),
		t { ":", "\t" },
		i(0),
		t { "", "}" },
	}),
}
