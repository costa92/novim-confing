local fn = vim.fn

-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap

-- 参考 https://github.com/zlongCoding/nvim/blob/main/lua/plugins.lua
-- https://learnku.com/articles/68258
-- https://www.lunarvim.org/plugins/02-extra-plugins.html#rnvimr
-- https://github.com/lxyoucan/nvim/blob/main/lua/plugins.lua

if fn.empty(fn.glob(install_path)) > 0 then
    vim.notify("正在安装Pakcer.nvim，请稍后...")
    packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        -- "https://github.com/wbthomason/packer.nvim",
        "https://gitcode.net/mirrors/wbthomason/packer.nvim",
        install_path,
    })

    -- https://github.com/wbthomason/packer.nvim/issues/750
    local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
    if not string.find(vim.o.runtimepath, rtp_addition) then
        vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
    end
    vim.notify("Pakcer.nvim 安装完毕")
end



-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("没有安装 packer.nvim")
    return
end

packer.startup({
    function(use)
        -- Packer 可以升级自己
        use("wbthomason/packer.nvim")
        -- treesitter
        use({
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate"
        })
        -- 方法聚焦
        use({
            "SmiteshP/nvim-gps",
            requires = "nvim-treesitter/nvim-treesitter",
            config = function()
                require("nvim-gps").setup()
                --  require('goto-preview').setup {}
            end
        })
        -- go 语法工具
        use("fatih/vim-go")
        -- 代码格式化
        use("sbdchd/neoformat")

        -- 文件搜索 预览 等
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
                "kyazdani42/nvim-web-devicons"
            }
        }
        -- //引用的方法使用弹框显示，而不是跳转tab
        use({
            "rmagatti/goto-preview",
            config = function()
              require("goto-preview").setup {}
            end
        })
        -- Comment 注释
        use("numToStr/Comment.nvim")
        -- 加速文件搜索速度,如果安装失败需要到插件目录执行make命令手动编译
        -- 用了这个插件以后，貌似更快了(感觉输入更跟手了，可能是心理作用)。但是对于我的小项目感受不是很明显
        use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
        if packer_bootstrap then
            packer.sync()
        end
    end,
    config = {
        -- 最大并发数
        max_jobs = 16,
        -- 自定义源
        git = {
            -- default_url_format = "https://hub.fastgit.xyz/%s",
            --default_url_format = "https://mirror.ghproxy.com/https://github.com/%s"
            -- default_url_format = "https://gitcode.net/mirrors/%s",
            -- default_url_format = "https://gitclone.com/github.com/%s",
        }
        -- display = {
        -- 使用浮动窗口显示
        --   open_fn = function()
        --     return require("packer.util").float({ border = "single" })
        --   end,
        -- },
    }
})
