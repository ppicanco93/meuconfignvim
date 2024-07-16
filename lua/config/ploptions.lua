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

    -- vim.cmd('e +'..linha..' ' .. filepath)
    return linha, filepath
end
local function goToFile()
    linha, filepath = getPackage()
    vim.cmd('e +'..linha..' ' .. filepath)
end
vim.keymap.set('n', '<leader>gR', function() goToFile() end, {})

local function window()
    linha, filepath = getPackage()
        buf = vim.api.nvim_create_buf(false, false)
        vim.api.nvim_buf_call(buf, function() vim.cmd('e +'..linha..' ' .. filepath) end)
        vim.api.nvim_buf_set_keymap(
            buf,
            "n",
            "q",
            "<Cmd>q!<CR>",
            { silent = true }
        )
    vim.api.nvim_open_win(buf, true, {relative='win', width=100, height=15, bufpos={0,1000}, border='double', style="minimal"})
    vim.cmd(''..linha)

end

vim.keymap.set('n', '<leader>gw', function() window() end, {})
