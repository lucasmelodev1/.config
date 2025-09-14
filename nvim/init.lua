require("config.lazy")

-- Recursively require all lua files inside lua/config/
local function load_configs(dir, prefix)
  local scan = vim.fn.readdir(dir)

  for _, file in ipairs(scan) do
    local fullpath = dir .. "/" .. file
    local stat = vim.loop.fs_stat(fullpath)

    if stat and stat.type == "file" and file:match("%.lua$") then
      local mod = prefix .. file:gsub("%.lua$", "")
      require(mod)
    elseif stat and stat.type == "directory" then
      load_configs(fullpath, prefix .. file .. ".")
    end
  end
end

local config_path = vim.fn.stdpath("config") .. "/lua/config"
load_configs(config_path, "config.")

