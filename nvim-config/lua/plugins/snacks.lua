return {
    "snacks-nvim",
    after = function()
        require("snacks").setup({
            bigfile = { enabled = true },
            explorer = { enabled = true },
            indent = { enabled = true },
            input = { enabled = true },
            notifier = { enabled = true },
            picker = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            terminal = { enabled = true },
            words = { enabled = true },

            dashboard = {
                enabled = true,

                sections = {
                    -- left side
                    { icon = "", title = "Recent Files", section = "recent_files", indent = 0, padding = 2 },
                    { icon = "", title = "Projects", section = "projects", indent = 0, padding = 2 },
                    {
                        pane = 2,
                        icon = "󰝖 ",
                        title = "Taskwarrior",
                        section = "terminal",
                        cmd = "task rc.verbose=footnote,blank minimal",
                        enabled = function()
                            return vim.fn.executable('task') == 1
                        end,
                        ttl = 5,
                        padding = 1,
                    },
                    -- right side
                    {
                        pane = 2,
                        icon = " ",
                        title = "Git Status",
                        section = "terminal",
                        enabled = function()
                            return Snacks.git.get_root() ~= nil
                        end,
                        cmd = "git status --short --branch --renames",
                        height = 5,
                        padding = 1,
                        ttl = 5 * 60,
                        indent = 3,
                    },
                },
            },
        })


        vim.keymap.set("n", "<leader>F", function() Snacks.picker.smart() end, { desc = "[F]iles" })
        vim.keymap.set("n", "<leader>P", function() Snacks.picker.projects() end, { desc = "[P]rojects" })
        vim.keymap.set("n", "<leader>B", function() Snacks.picker.buffers() end, { desc = "[B]uffers" })
        vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "[/]Grep" })
        vim.keymap.set("n", "<leader>:", function() Snacks.picker.command_history() end, { desc = "[:]Command History" })
        vim.keymap.set("n", "<leader>N", function() Snacks.picker.notifications() end,
            { desc = "[N]otification History" })
        vim.keymap.set("n", "<leader>T", function() Snacks.explorer() end, { desc = "[T]ree (Snacks Explorer)" })
        vim.keymap.set("n", "<leader>t", function() Snacks.terminal() end, { desc = "[t]erminal" })
        vim.keymap.set("n", "<leader>lg", function() Snacks.lazygit() end, { desc = "[l]azy[g]it" })
    end
}
