return {
	"numToStr/Comment.nvim",
	opts = {
		---Add a space b/w comment and the line
			padding = false,
		---Whether the cursor should stay at its position
			sticky = true,
		---Lines to be ignored while (un)comment
			ignore = "^$",
		---LHS of toggle mappings in NORMAL mode
			toggler = {
				---Line-comment toggle keymap
					line = "gcc",
				---Block-comment toggle keymap
					block = "gbc",
			},
		---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				---Line-comment keymap
					line = "gc",
				---Block-comment keymap
					block = "gb",
			},
		---LHS of extra mappings
			extra = {
				---Add comment on the line above
					above = "gcO",
				---Add comment on the line below
					below = "gco",
				---Add comment at the end of line
					eol = "gcA",
			},
		---Enable keybindings
			---NOTE: If given `false` then the plugin won't create any mappings
			mappings = {
				---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
					basic = true,
				---Extra mapping; `gco`, `gcO`, `gcA`
					extra = true,
			},
		---Function to call before (un)comment
			pre_hook = function (ctx)
			local ft = vim.bo.filetype
			if ft == "tex" or ft == "latex" then
				-- set buffer-local commentstring to single percent with a space after when used
					--vim.bo.commentstring = "%% %s"
					return "% %s"
					end
					-- return nil to let comment.nvim continue its normal processing for other filetypes
					return nil
					end,
			---Function to call after (un)comment
			post_hook = nil,
	},
}
