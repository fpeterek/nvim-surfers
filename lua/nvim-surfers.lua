-- main module file
local ns = require("nvim-surfers.module")

---@class Config
---@field opt string Your config option
local config = {
    path = "resources/surfers.mp4",
    window = nil,
    buffer = nil,
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
    return ns.create_surfer(M.config)
end

return M
