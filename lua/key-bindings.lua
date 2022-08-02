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

-- ctrl + /
map("n", "<C-_>", ",t", {noremap = false})
map("v", "<C-_>", ",t", {noremap = false})
-- map("i", "<C-_>", ",c", { noremap = false })


return pluginKeys
