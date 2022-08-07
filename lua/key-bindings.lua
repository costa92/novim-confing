-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
  noremap = true,
  silent = true,
}
-- 本地变量
local map = vim.api.nvim_set_keymap
-- 分屏 sv(split vertically) sh(split horizontally)
map('n', 'sv', ':vs<CR>', opt)
map('n', 'sh', ':sp<CR>', opt)
-- 关闭当前窗口 (close)
map('n', 'sc', '<C-w>c', opt)
-- 关闭其他窗口 (close other)
map('n', 'so', '<C-w>o', opt)
-- Alt + hjkl 在窗口之间跳转
map('n', '<A-h>', '<C-w>h', opt)
map('n', '<A-j>', '<C-w>j', opt)
map('n', '<A-k>', '<C-w>k', opt)
map('n', '<A-l>', '<C-w>l', opt)

-- 窗口比例调节
-- 左右方向键控制窗口水平比例
-- Ctrl-左右方向键 小幅度移动
map('n', '<C-Left>', ':vertical resize -2<CR>', opt)
map('n', '<C-Right>', ':vertical resize +2<CR>', opt)
-- s, s. 大幅度移动
map('n', 's,', ':vertical resize -20<CR>', opt)
map('n', 's.', ':vertical resize +20<CR>', opt)
-- 上下方向控制窗口垂直比例
-- Ctrl-上下方向键 小幅度移动
map('n', '<C-Up>', ':resize -2<CR>', opt)
map('n', '<C-Down>', ':resize +2<CR>', opt)
-- sj sk 大幅度移动
map('n', 'sj', ':resize +10<CR>', opt)
map('n', 'sk', ':resize -10<CR>', opt)
-- 窗口等比例显示
map('n', 's=', '<C-w>=', opt)

-- <leader>t 开启终端
map('n', '<leader>t', ':sp | terminal<CR>', opt)
map('n', '<leader>vt', ':vsp | terminal<CR>', opt)

-- <Esc> 退出终端
map('t', '<Esc>', '<C-\\><C-N>', opt)
-- 终端窗口中进行窗口切换
map('t', '<A-h>', [[ <C-\><C-N><C-w>h ]], opt)
map('t', '<A-j>', [[ <C-\><C-N><C-w>j ]], opt)
map('t', '<A-k>', [[ <C-\><C-N><C-w>k ]], opt)
map('t', '<A-l>', [[ <C-\><C-N><C-w>l ]], opt)

-- NORMAL 模式
-- H 移动到行首，L 移动到行尾
map('n', 'H', '^', opt)
map('n', 'L', 'g_', opt)
-- 上下滚动浏览
map('n', '<C-j>', '4j', opt)
map('n', '<C-k>', '4k', opt)
-- 修改 Ctrl-u 和 Ctrl-d 的移动幅度 从默认的移动半瓶改为移动 9 行
map('n', '<C-u>', '9k', opt)
map('n', '<C-d>', '9j', opt)

-- INSERT 模式
-- 映射 jk 为 <Esc>
map('i', 'jk', '<Esc>', opt)
-- 跳到行首行尾
map('i', '<C-h>', '<Esc>I', opt)
map('i', '<C-l>', '<Esc>A', opt)


-- VISUAL 模式 
-- 缩进代码
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)
-- 上下移动选中的文本
map('v', 'J', ":move '>+1<CR>gv-gv", opt)
map('v', 'K', ":move '<-2<CR>gv-gv", opt)
-- VISUAL 模式中粘贴的时候默认会复制被粘贴的文本 很反人类 不需要
map('v', 'p', '"_dP', opt)

-- 退出
map('n', 'q', ':q<CR>', opt)
map('n', 'qq', ':q!<CR>', opt)
map('n', 'Q', ':qa!<CR>', opt)

-- 插件快捷键
local pluginKeys = {}

map("n", "gd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opt)
map("n", "gi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", opt)
map("n", "gq", "<cmd>lua require('goto-preview').close_all_win()<CR>", opt)
map("n", "gr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", opt)


map("n", "<leader>1", ":NvimTreeToggle <CR>", opt)
map("n", "<F3>", ":NvimTreeToggle <CR>", opt)
map("n", "<leader>2", ":NvimTreeFocus <CR>", opt)
map("n", "<leader>mr", ":NvimTreeRefresh <CR>", opt)
map("n", "<leader>mf", ":NvimTreeFindFile <CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
    -- 打开文件或文件夹
    {key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit"},
    -- v分屏打开文件
    {key = "v", action = "vsplit"},
    -- h分屏打开文件
    {key = "h", action = "split"},
    -- Ignore (node_modules)
    {key = "i", action = "toggle_ignored"},
    -- Hide (dotfiles)
    {key = ".", action = "toggle_dotfiles"},
    {key = "R", action = "refresh"},
    -- 文件操作
    {key = "a", action = "create"},
    {key = "d", action = "remove"},
    {key = "r", action = "rename"},
    {key = "x", action = "cut"},
    {key = "c", action = "copy"},
    {key = "p", action = "paste"},
    {key = "y", action = "copy_name"},
    {key = "Y", action = "copy_path"},
    {key = "gy", action = "copy_absolute_path"},
    {key = "I", action = "toggle_file_info"},
    {key = "n", action = "tabnew"},
    -- 进入下一级
    {key = {"]"}, action = "cd"},
    -- 进入上一级
    {key = {"["}, action = "dir_up"},
    {key = "s", action = "system_open"}
}

-- bufferline
-- 左右Tab切换
map("n", "<TAB>", ":BufferLineCycleNext<CR>", opt)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opt)
-- "moll/vim-bbye" 关闭当前 buffer
map("n", "<leader>bc", ":Bdelete!<CR>", opt)
-- 关闭左/右侧标签页
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
-- 关闭其他标签页
map("n", "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)
-- 关闭选中标签页
map("n", "<leader>bp", ":BufferLinePickClose<CR>", opt)


-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<C-n>"] = "move_selection_next",
    ["<C-p>"] = "move_selection_previous",
    -- 历史记录
    ["<Down>"] = "cycle_history_next",
    ["<Up>"] = "cycle_history_prev",
    -- 关闭窗口
    -- ["<esc>"] = actions.close,
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}


-- Telescope
-- map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
--
map("n", "<leader>fm", ":Telescope marks <CR>", opt)
map("n", "<leader>fb", ":Telescope buffers <CR>", opt)
map("n", "<leader>ff", ":Telescope find_files <CR>", opt)
map("n", "<leader>fa", ":Telescope find_files follow=true no_ignore=true hidden=true <CR>", opt)
map("n", "<leader>cm", ":Telescope git_commits <CR>", opt)
map("n", "<leader>gt", ":Telescope git_status <CR>", opt)
map("n", "<leader>fh", ":Telescope help_tags <CR>", opt)
map("n", "<leader>fw", ":Telescope live_grep <CR>", opt)
map("n", "<leader>fo", ":Telescope oldfiles <CR>", opt)
map("n", "<leader>fp", ":Telescope projects<CR>", opt)
--  map("n", "<leader>th", ":Telescope themes <CR>", opt)
map("n", "<leader>3", "<cmd>Vista!!<CR>", opt)

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
    i = {
        -- 上下移动
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-n>"] = "move_selection_next",
        ["<C-p>"] = "move_selection_previous",
        -- 历史记录
        ["<Down>"] = "cycle_history_next",
        ["<Up>"] = "cycle_history_prev",
        -- 关闭窗口
        -- ["<esc>"] = actions.close,
        ["<C-c>"] = "close",
        -- 预览窗口上下滚动
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down"
    }
}

-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
    -- Normal 模式快捷键
    toggler = {
        line = ",t",
        block = ",tt"
    },
    -- Visual 模式
    opleader = {
        line = ",l",
        block = ",ll"
    }
}


-- 自定义 toggleterm 3个不同类型的命令行窗口
-- <leader>ta 浮动
-- <leader>tb 右侧
-- <leader>tc 下方
-- 特殊lazygit 窗口，需要安装lazygit
-- <leader>tg lazygit
pluginKeys.mapToggleTerm = function(toggleterm)
  vim.keymap.set({ "n", "t" }, "<leader>ta", toggleterm.toggleA)
  vim.keymap.set({ "n", "t" }, "<leader>tb", toggleterm.toggleB)
  vim.keymap.set({ "n", "t" }, "<leader>tc", toggleterm.toggleC)
  vim.keymap.set({ "n", "t" }, "<leader>tg", toggleterm.toggleG)
end


-- ctrl + /
map("n", "<C-_>", ",t", {noremap = false})
map("v", "<C-_>", ",t", {noremap = false})
-- map("i", "<C-_>", ",c", { noremap = false })

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    return {
        -- 上一个
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- 出现补全
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        -- 取消
        ["<A-,>"] = cmp.mapping(
            {
                i = cmp.mapping.abort(),
                c = cmp.mapping.close()
            }
        ),
        -- 确认
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm(
            {
                select = true,
                behavior = cmp.ConfirmBehavior.Replace
            }
        ),
        -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        -- 如果窗口内容太多，可以滚动
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
        -- snippets 跳转
        ["<C-l>"] = cmp.mapping(
            function(_)
                if vim.fn["vsnip#available"](1) == 1 then
                    feedkey("<Plug>(vsnip-expand-or-jump)", "")
                end
            end,
            {"i", "s"}
        ),
        ["<C-h>"] = cmp.mapping(
            function()
                if vim.fn["vsnip#jumpable"](-1) == 1 then
                    feedkey("<Plug>(vsnip-jump-prev)", "")
                end
            end,
            {"i", "s"}
        ),
        -- super Tab
        ["<Tab>"] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif vim.fn["vsnip#available"](1) == 1 then
                    feedkey("<Plug>(vsnip-expand-or-jump)", "")
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                end
            end,
            {"i", "s"}
        ),
        ["<S-Tab>"] = cmp.mapping(
            function()
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                    feedkey("<Plug>(vsnip-jump-prev)", "")
                end
            end,
            {"i", "s"}
        )
        -- end of super Tab
    }
end


-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  --[[
  Lspsaga 替换 rn
  mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
  --]]
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  --[[
  Lspsaga 替换 ca
  mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
  --]]
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx
  --[[
    mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  --]]
  mapbuf("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)
  --[[
  mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
  Lspsaga 替换 gh
  --]]
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  -- Lspsaga 替换 gr
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  --[[
  mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
  --]]      
  --[[
 
 Lspsaga 替换 gp, gj, gk
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --]]
  -- diagnostic
  mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
  mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
  mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- 未用
  -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- typescript 快捷键
pluginKeys.mapTsLSP = function(mapbuf)
  mapbuf("n", "gs", ":TSLspOrganize<CR>", opt)
  mapbuf("n", "gR", ":TSLspRenameFile<CR>", opt)
  mapbuf("n", "gi", ":TSLspImportAll<CR>", opt)
end


return pluginKeys
