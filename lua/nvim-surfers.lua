-- main module file
local ns = require("nvim-surfers.module")

---@class Config
---@field opt string Your config option
local config = {
    path = "resources/surfers.mp4",
    window = nil,
    buffer = nil,
    use_tmux = false,
}

---@class MyModule
local M = {}

---@type Config
M.config = config

---@param args Config?
-- you can define your setup function here. Usually configurations can be merged, accepting outside params and
-- you can also put some validation here for those.
M.setup = function(args)
    M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

M.surf = function()
    if M.config.use_tmux then
        return ns.create_tmux_split(M.config)
    else    
        return ns.create_nvim_split(M.config)
    end
end

return M
