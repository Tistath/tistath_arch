return {
  "mfussenegger/nvim-dap",
  lazy = true,
  config = function()
    local dap = require("dap")
    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
    }
    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input("Path: ", vim.fn.getcwd() .. "/", "file")
        end,
        args = {},
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
      },
    }

    vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0 })
    vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0 })
    vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0 })

    local dap_breakpoint = {
      error = {
        text = "●",
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
      },
      condition = {
        text = "󰟃",
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
      },
      rejected = {
        text = "󰃤",
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
      },
      logpoint = {
        text = "",
        texthl = "DapLogPoint",
        linehl = "DapLogPoint",
        numhl = "DapLogPoint",
      },
      stopped = {
        text = "󰜴",
        texthl = "DapStopped",
        linehl = "DapStopped",
        numhl = "DapStopped",
      },
    }

    vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
    vim.fn.sign_define("DapBreakpointCondition", dap_breakpoint.condition)
    vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
    vim.fn.sign_define("DapLogPoint", dap_breakpoint.logpoint)
    vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)

    vim.keymap.set("n", "<Leader>d;",   dap.continue,                                                   { desc = "继续执行" })
    vim.keymap.set("n", "<Leader>dj",   dap.step_over,                                                  { desc = "单步跳过" })
    vim.keymap.set("n", "<Leader>dk",   dap.step_into,                                                  { desc = "单步进入" })
    vim.keymap.set("n", "<Leader>dl",   dap.step_out,                                                   { desc = "单步跳出" })
    vim.keymap.set("n", "<Leader>db",   dap.toggle_breakpoint,                                          { desc = "切换断点" })
    vim.keymap.set("n", "<Leader>dB",   function() dap.set_breakpoint(vim.fn.input("条件: ")) end,      { desc = "条件断点" })
    vim.keymap.set("n", "<Leader>dr",   dap.repl.open,                                                  { desc = "打开 REPL" })
    vim.keymap.set("n", "<Leader>dc",   dap.run_to_cursor,                                              { desc = "运行到光标" })
    vim.keymap.set("n", "<Leader>dv",   function() require("dap.ui.widgets").hover() end,               { desc = "查看变量" })
    vim.keymap.set("n", "<Leader>ds",   dap.continue,                                                   { desc = "开始调试" })
    vim.keymap.set("n", "<Leader>dp",   dap.disconnect,                                                 { desc = "停止调试" })
  end,
}
