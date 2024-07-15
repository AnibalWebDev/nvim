-- @param m string: The mode in which the keybinding is active (e.g., "n" for normal mode).
-- @param k string: The key sequence to bind.
-- @param v string|function: The command or function to execute when the keybinding is triggered.
local function map(m, k, v)
	vim.keymap.set(m, k, v)
end

-- Save & Exit

map("n", "<A-q>", ":q<CR>")      -- exit neovim w/o saving
map("n", "<A-n>", ":tabnew<CR>") -- new tab
map("n", "<A-s>", ":w<CR>")      -- save file
map("n", "<A-w>", ":wq<CR>")     -- save and quit

-- Misc

map("n", "<leader>s", ":%s/")                      -- substitute pattern on all lines
map("n", "<C-m>", ":Man ")                         -- search manpages
map("n", "<C-n>", ":Neotree toggle<CR>")           -- toggle NeoTree file explorer
map("n", "<C-s>", ":Neotree float git_status<CR>") -- NeoTree git status view
map("n", "<A-x>", ":CopilotChatToggle<CR>")        -- toggle Copilot Chat
map("n", "<A-L>", ":Lazy<CR>")                     -- open Lazy package manager
map("n", "<A-%>", ":source %<CR>")                 -- source file in current buffer
map("n", "<A-b>", ":bd<CR>")                       -- kill the current buffer

-- Word Surrounds

map("n", "<A-a>", "i\"<ESC>ea\"<ESC>")   -- surround word w/ ""
map("n", "<A-c>", "i'<ESC>ea'<ESC>")     -- surround word w/ ''
map("n", "<A-e>", "i(<ESC>ea)<ESC>")     -- surround word w/ ()
map("n", "<A-r>", "i[<ESC>ea]<ESC>")     -- surround word w/ []
map("n", "<A-o>", "i{<ESC>ea}<ESC>")     -- surround word w/ {}
map("n", "<A-y>", "i<<ESC>ea><ESC>")     -- surround word w/ <>
map("n", "<A-u>", "i{% <ESC>ea %}<ESC>") -- surround word w/ (% %)
map("n", "<A-i>", "i{{ <ESC>ea }}<ESC>") -- surround word w/ {{  }}

-- Windows

map("n", "<C-p>", "<C-w>n")  -- new window (horizontal split)

map("n", "<C-h>", "<C-w>H")  -- move window left
map("n", "<C-l>", "<C-w>L")  -- move window right
map("n", "<C-k>", "<C-w>K")  -- move window up
map("n", "<C-j>", "<C-w>J")  -- move window down

map("n", "<A-h>", "<C-w><5") -- adjust window width left 5 cols
map("n", "<A-l>", "<C-w>>5") -- adjust window width right 5 cols
map("n", "<A-k>", "<C-w>-5") -- adjust window width up 5 cols
map("n", "<A-j>", "<C-w>+5") -- adjust window width down 5 cols

-- LSP

map("n", "<A-d>", ":lua vim.lsp.buf.definition()<CR>")                              -- LSP jump to definition of an identifier
map("n", "<A-;>", ":lua vim.lsp.buf.rename()<CR>")                                  -- LSP rename an identifier
map("n", "K", ":lua vim.lsp.buf.hover()<CR>")                                       -- LSP hover docstring for an identifier
map("n", "<leader>i", ":lua vim.diagnostic.open_float(nil, { focus = false })<CR>") -- Show inline diagnostics
map("n", "<leader>l", ":lua vim.diagnostic.setloclist()<CR>")                       -- Show all diagnostics in location list

-- Telescope

map("n", "<A-F>", ":Telescope find_files<CR>")            -- find files
map("n", "<A-G>", ":Telescope live_grep<CR>")             -- live grep
map("n", "<A-B>", ":Telescope buffers<CR>")               -- open buffers
map("n", "<A-H>", ":Telescope help_tags<CR>")             -- help docs
map("n", "<A-M>", ":Telescope marks<CR>")                 -- marks
map("n", "<A-R>", ":Telescope registers<CR>")             -- registers
map("n", "<A-S>", ":Telescope lsp_document_symbols<CR>")  -- document symbols
map("n", "<A-T>", ":Telescope treesitter<CR>")            -- treesitter symbols
map("n", "<A-V>", ":Telescope vim_options<CR>")           -- vim options
map("n", "<A-X>", ":Telescope commands<CR>")              -- vim commands
map("n", "<A-Z>", ":Telescope colorscheme<CR>")           -- colorschemes
map("n", "<A-~>", ":Telescope lsp_workspace_symbols<CR>") -- LSP workspace symbols

-- Fugitive

map("n", "<leader>G", ":G<CR>")        -- git status
map("n", "<leader>Ga", ":G add %<CR>") -- git add %
map("n", "<leader>Gd", ":Gdiff<CR>")   -- git diff %

-- Vim Dadbod UI

map("n", "<leader>Db", ":DBUIToggle<CR>")        -- toggle vim-dadbod-ui
map("n", "<leader>Da", ":DBUIAddConnection<CR>") -- add database connection to vim-dadbod-ui
