return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
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
                { section = "startup" },
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

    },
    keys = {
        { "<leader>F",  function() Snacks.picker.smart() end,           desc = "[F]iles" },
        { "<leader>P",  function() Snacks.picker.projects() end,        desc = "[P]rojects" },
        { "<leader>B",  function() Snacks.picker.buffers() end,         desc = "[B]uffers" },
        { "<leader>/",  function() Snacks.picker.grep() end,            desc = "[/]Grep" },
        { "<leader>:",  function() Snacks.picker.command_history() end, desc = "[:]Command History" },
        { "<leader>N",  function() Snacks.picker.notifications() end,   desc = "[N]otification History" },
        { "<leader>T",  function() Snacks.explorer() end,               desc = "[T]ree (Snacks Explorer)" },
        { "<leader>t",  function() Snacks.terminal() end,               desc = "[t]erminal" },
        { "<leader>lg", function() Snacks.lazygit() end,                desc = "[l]azy[g]it" },
    },
}
