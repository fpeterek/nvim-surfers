---@class CustomModule
local M = {}

M.get_path = function(conf)
    return debug.getinfo(1).source:sub(2, -28) .. conf.path
end

M.create_tmux_split = function(conf) 

    path = M.get_path(conf)

    vim.fn.jobstart(
        { "tmux", "split-window", "-h", "--", "CACA_DRIVER=ncurses mplayer -quiet -vo caca " .. path }
    )

    return ""
end

M.create_nvim_split = function(conf)
    vim.cmd('vsplit')
    conf.window = vim.api.nvim_get_current_win()
    conf.buffer = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_win_set_buf(conf.window, conf.buffer)

    vim.o.wrap = false

    path = M.get_path(conf)

    conf.terminal = vim.fn.termopen(
        { "mplayer", "-vo", "caca", path },
        {
            env = { CACA_DRIVER='ncurses' },
            on_stdout = function(job_id, data, event) 
                vim.api.nvim_buf_set_lines(conf.buffer, 0, -1, false, data)
                vim.opt_local.modified = false
            end
        }
    )

    return ""
end

return M
