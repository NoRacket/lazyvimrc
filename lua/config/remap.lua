vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>sl", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fm", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>M")
vim.keymap.set("n", "<C-u>", "<C-u>M")
vim.keymap.set("n", "<C-f>", "<C-f>M")
vim.keymap.set("n", "<C-b>", "<C-b>M")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>c", [["_c]])
vim.keymap.set({ "n", "v" }, "<leader>D", [["_D]])
vim.keymap.set({ "n", "v" }, "<leader>C", [["_C]])

-- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")
-- vim.keymap.set("n", "<C-c>", [["+yy]])
-- vim.keymap.set("v", "<C-c>", [["+y]])

-- surround with Klammern
vim.keymap.set("v", "(", "c()<Esc>P")
vim.keymap.set("v", "[", "c[]<Esc>P")
vim.keymap.set("v", "{", "c{}<Esc>P")

vim.keymap.set("n", "Q", "<nop>")
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>o", "<cmd>copen<CR><C-w><C-w>") -- open the error log
vim.keymap.set("n", "<leader>O", "<cmd>cclose<CR>")          -- close the error log
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")             -- walk through \
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")             -- error log

-- spell checking
vim.keymap.set("n", "<F6>", "<cmd>set spell<CR>")
vim.keymap.set("n", "<leader><F6>", "<cmd>set nospell<CR>")
vim.keymap.set("n", "<leader>j", "]szz")
vim.keymap.set("n", "<leader>k", "[szz")

vim.keymap.set("n", "<leader>si", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gcI<Left><Left><Left><Left>]])
vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>sh", [[:s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>so", function()
    vim.cmd("so")
end)

-- reset the highlight after searching
vim.keymap.set("n", "<Esc>", vim.cmd.nohlsearch)

-- movement and insertion
-- vim.keymap.set("i", "<C-l>", "<right>")
-- vim.keymap.set("i", "<C-j>", "<Esc>o")
-- vim.keymap.set("i", "<C-k>", "<Esc>O")
-- vim.keymap.set("i", "<C-h>", "<left>")

-- open files the old way (if you konow the name) / run through buffers.
vim.keymap.set("n", "<leader>bn", vim.cmd.bn)
vim.keymap.set("n", "<leader>bp", vim.cmd.bp)
vim.keymap.set("n", "<leader>bd", vim.cmd.bd)
vim.keymap.set("n", "<leader>bb", ":e %:h/")

-- Expanding braces
vim.keymap.set("i", "{<Cr>", "{<Cr>}<Esc>O")

-- vim.opt.makeprg = "buildTools/make.sh"
-- vim.keymap.set("n", "<C-s>", "<cmd>:wa<CR><cmd>make %<CR><cmd>copen<CR><C-w><C-w>")
-- vim.keymap.set("n", "<C-s>", "<cmd>:wa<CR><cmd>make %<CR>")
vim.opt.makeprg = "~/Uni/12_Functional_Programming/Vorlesung/make.sh"
vim.keymap.set("n", "<leader>m", "<cmd>make %<CR>")


-- intuitive save
-- vim.keymap.set("n", "<C-s>", ":w<CR>")

-- intuitive delete word
vim.keymap.set("i", "<C-backspace>", "<C-w>")
vim.keymap.set("i", "<C-w>", "<C-g>u<C-w>")
vim.keymap.set("i", "<C-u>", "<C-g>u<C-u>")

-- split stuff
vim.keymap.set("n", "<C-w><C-s>", vim.cmd.vsplit)
-- vim.keymap.set("n", "<Leader>ws", ":vsplit ")

-- easier to configure neovim
vim.keymap.set("n", "<leader>rpp", "<cmd>e ~/.config/nvim/lua/config/remap.lua<CR>")
vim.keymap.set("n", "<leader>rps", "<cmd>e ~/.config/nvim/lua/plugins/luasnip.lua<CR>")


-- reload luasnip
-- vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/snippets/snippets.lua<CR>")
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/plugins/luasnip.lua<CR>")

-- For LaTeX TODO: make only usable in tex-Files
-- vim.keymap.set("i", "__", "_{")

-- Exit insert mode
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")
