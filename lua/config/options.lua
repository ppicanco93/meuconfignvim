-- vim.opt.termguicolors = true
vim.cmd.colorscheme('catppuccin-frappe')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find [F]ile'})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find Grep'})
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Opened Buffers'})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help'})
vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>fn', function() builtin.find_files { cwd = vim.fn.stdpath 'config' } end, { desc = '[S]earch [N]eovim files' })
vim.keymap.set('n', '<leader>f1', function() builtin.find_files { cwd = '~/sccs/sccsdoneg-plsql' } end, { desc = 'Find Files in sccdoneg-plsql' })
vim.keymap.set('n', '<leader>f2', function() builtin.find_files { cwd = '~/sccs/infrascc-plsql' } end, { desc = 'Find Files in infrascc-plsql' })




vim.opt.mouse = "a" -- Enable mouse mode
vim.opt.number = true -- Print line number
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard.
vim.opt.tabstop = 4 -- Number of spaces tabs count for.
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- Use spaces instead of tabs


vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set('n', "<leader>w", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set('n', "<leader>q", "<cmd>q<cr><esc>", { desc = "Quit file" })


vim.keymap.set('i', "jj", "<esc>", { desc = "Quit Insert Mode" })
vim.keymap.set('i', "kk", "<esc>", { desc = "Quit Insert Mode" })


vim.keymap.set({'n','x','s'}, "<leader><tab>", ">", { desc = "Indent to the right" })
vim.keymap.set({'n','x','s'}, "<leader><S-tab>", "<", { desc = "Indent to the left" })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("i", "<A-h>", "<Left>", { desc = "Move cursor to the left" })
vim.keymap.set("i", "<A-j>", "<Down>", { desc = "Move cursor down"})
vim.keymap.set("i", "<A-k>", "<Up>", { desc = "Move cursor up" })
vim.keymap.set("i", "<A-l>", "<Right>", { desc = "Move cursor to the right" })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

require('mini.surround').setup()
require('mini.splitjoin').setup()
-- require('mini.trailspace').setup()

vim.keymap.set('n','<leader>T', '<CMD>lua MiniTrailspace.trim()<CR>', {})


vim.keymap.set('i','\'', '\'\'<Left>', { desc = 'Autoclose single quote'})
vim.keymap.set('i','\"', '\"\"<Left>', { desc = 'Autoclose double quote'})
vim.keymap.set('i','(', '()<Left>', { desc = 'Autoclose ()'})
vim.keymap.set('i', '[', '[]<Left>', { desc = 'Autoclose []'})
vim.keymap.set('i','{', '{}<Left>', { desc = 'Autoclose {}'})

vim.keymap.set('n','<leader>L', '<CMD>Lazy<CR>', { desc = 'Open Lazy'})
vim.keymap.set('n','<leader>ch', '<CMD>checkhealth<CR>', { desc = 'Open checkhealth'})

require('lualine').setup()
local harpoonmark = require('harpoon.mark')

vim.keymap.set('n','<leader>A', function() require('harpoon.mark').add_file() end, { desc = 'harpoon file'})
vim.keymap.set('n','<leader>a', function() require("harpoon.ui").toggle_quick_menu() end, { desc = 'harpoon quick menu'})
vim.keymap.set('n','<leader>1', function() require("harpoon.ui").nav_file(1) end, { desc = 'harpoon to file 1'})
vim.keymap.set('n','<leader>2', function() require("harpoon.ui").nav_file(2) end, { desc = 'harpoon to file 2'})
vim.keymap.set('n','<leader>3', function() require("harpoon.ui").nav_file(3) end, { desc = 'harpoon to file 3'})
vim.keymap.set('n','<leader>4', function() require("harpoon.ui").nav_file(4) end, { desc = 'harpoon to file 4'})
vim.keymap.set('n','<leader>5', function() require("harpoon.ui").nav_file(5) end, { desc = 'harpoon to file 5'})
vim.keymap.set('n','<leader>6', function() require("harpoon.ui").nav_file(6) end, { desc = 'harpoon to file 6'})
vim.keymap.set('n','<leader>7', function() require("harpoon.ui").nav_file(7) end, { desc = 'harpoon to file 7'})
vim.keymap.set('n','<leader>8', function() require("harpoon.ui").nav_file(8) end, { desc = 'harpoon to file 8'})
vim.keymap.set('n','<leader>9', function() require("harpoon.ui").nav_file(9) end, { desc = 'harpoon to file 9'})

local ls = require("luasnip")

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

require('gitsigns').setup()

vim.keymap.set("n", "<C-A-c>", "<CMD>call setreg('+', expand('%:p'))<CR>", { desc = "Copy Path to Clipboard" })

vim.keymap.set("n", "<C-A-r>","<CMD>exe \"!tmux send -t 1 \'@\" . expand(\'%:p\')  . \"\' Enter\"<CR>", { desc = "Copy Path to Clipboard" })


local function getPackage()
    word = vim.fn.expand('<cword>')
    Word = vim.fn.expand('<cWORD>')
    path = vim.fn.getcwd() .. '/02-Banco'
    -- word = string.match(word, 'pk')
    if word:sub(1, #'pk') == 'pk' then
        pacote = word
        chamada = Word:match(pacote .. '%.([%a_]+)')
    else
        pacote = Word:match('(pk[%a_]*)%.' .. word)
        chamada = word
    end
    pacote = pacote:upper()
    if chamada:sub(1, #'fc') == 'fc' then
        filepath = path .. '/' .. pacote .. '/' .. pacote .. '.sql'
        chamada = 'FUNCTION%s'..chamada
    elseif chamada:sub(1, #'pr') == 'pr' then
        filepath = path .. '/' .. pacote .. '/' .. pacote .. '.sql'
        chamada = 'PROCEDURE%s'..chamada
    else
        filepath = path .. '/' .. pacote .. '/' .. pacote .. '_spc.sql'
    end
    
    lines = vim.fn.readfile(filepath)
    linha = 1
    for linenum, line in ipairs(lines) do 
        -- you can also use vim.regex to perform these matches
        if line:match(chamada) then
          -- don't return to recycle the function in async context
          linha = linenum
          break
        end
    end

    vim.cmd('e +'..linha..' ' .. filepath)
end

vim.keymap.set('n', '<leader>gR', function() getPackage() end, {})

local function window()
    position = vim.api.nvim_win_get_cursor(0)
    vim.api.nvim_open_win(0, true, {relative='win', width=100, height=30, bufpos=position, border='double', style="minimal"})

end

vim.keymap.set('n', '<leader>gw', function() window() end, {})
