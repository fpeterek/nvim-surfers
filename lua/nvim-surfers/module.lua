---@class CustomModule
local M = {}

---@return string
M.create_surfer = function(conf)
    vim.cmd('vsplit')
    conf.window = vim.api.nvim_get_current_win()
    conf.buffer = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_win_set_buf(conf.window, conf.buffer)

    vim.o.wrap = false

    path = debug.getinfo(1).source:sub(2, -28) .. conf.path

    conf.terminal = vim.fn.termopen(
        { "mplayer", "-vo", "caca", path },
        {
            env = { CACA_DRIVER='ncurses' },
            on_stdout = function(job_id, data, event) 
                conf.callbacks = conf.callbacks + 1
                vim.api.nvim_buf_set_lines(conf.buffer, 0, -1, false, { tostring(conf.callbacks) })
                vim.opt_local.modified = false
            end
        }
    )
end

return M
