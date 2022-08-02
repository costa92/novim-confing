local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd


-- 进入Terminal 自动进入插入模式
autocmd("TermOpen", {
  group = myAutoGroup,
  command = "startinsert",
})

-- 修改lua/plugins.lua 自动更新插件
autocmd("BufWritePost", {
  group = myAutoGroup,
  -- autocmd BufWritePost plugins.lua source <afile> | PackerSync
  callback = function()
    if vim.fn.expand("<afile>") == "lua/plugins.lua" then
      vim.api.nvim_command("source lua/plugins.lua")
      vim.api.nvim_command("PackerSync")
    end
  end,
})

