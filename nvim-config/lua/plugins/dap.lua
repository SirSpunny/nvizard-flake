return {
    "nvim-dap",
    keys = {
        { "<leader>D",  function() require("dapui").toggle() end,                                                    desc = "Toggle DAP UI" },
        { "<leader>db", function() require("dap").toggle_breakpoint() end,                                           desc = "Toggle Breakpoint" },
        { "<leader>dl", function() require("dap").set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, desc = "Log Point" },
        { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,        desc = "Conditional Breakpoint" },
        { "<leader>dc", function() require("dap").continue() end,                                                    desc = "Continue/Start" },
        { "<leader>de", function() require("dapui").eval() end,                                                      desc = "Eval under cursor" },
    },
    load = function(name)
        vim.cmd("packadd " .. name)
        vim.cmd("packadd nvim-dap-ui")
        vim.cmd("packadd nvim-dap-virtual-text")
        vim.cmd("packadd nvim-nio")
    end,
    after = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()
        require("nvim-dap-virtual-text").setup()

        dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
        dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
        dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end


        -- TODO Define the colors
        vim.api.nvim_set_hl(0, "DapBreakpoint", { link = "diffRemoved" })
        vim.api.nvim_set_hl(0, "DapBreakpointCondition", { link = "diffChanged" })
        vim.api.nvim_set_hl(0, "DapBreakpointRejected", { link = "diffChanged" })
        vim.api.nvim_set_hl(0, "DapLogPoint", { link = "DiagnosticSignInfo" })
        vim.api.nvim_set_hl(0, "DapStopped", { link = "DiagnosticOk" })

        local signs = {
            DapBreakpoint = { text = " ", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" },
            DapBreakpointCondition = { text = " ", texthl = "DapBreakpointCondition", linehl = "", numhl = "DapBreakpointCondition" },
            DapBreakpointRejected = { text = " 󰅙", texthl = "DapBreakpointRejected", linehl = "", numhl = "DapBreakpointRejected" },
            DapLogPoint = { text = " ", texthl = "DapLogPoint", linehl = "", numhl = "DapLogPoint" },
            DapStopped = { text = " ", texthl = "DapStopped", linehl = "diffAdded", numhl = "DapStopped" },
        }

        for name, config in pairs(signs) do
            vim.fn.sign_define(name, config)
        end
    end,
}
