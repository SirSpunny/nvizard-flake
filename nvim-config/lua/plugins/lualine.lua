local function active_lsps()
	local msg = ''
	local clients = vim.lsp.get_clients({ bufnr = 0 })

	if next(clients) == nil then
		return msg
	end

	local client_names = {}
	for _, client in pairs(clients) do
		table.insert(client_names, client.name)
	end
	return "[" .. table.concat(client_names, '|') .. "]"
end

return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		options = {
			-- theme = bubbles_theme,
			component_separators = '',
			section_separators = { left = '', right = '' },
		},
		sections = {
			lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
			lualine_b = { 'filename', 'branch' },
			lualine_c = { '%=', },
			lualine_x = { 'diagnostics' },
			lualine_y = { 'filetype', { active_lsps }, 'progress' },
			lualine_z = {
				{ 'location', separator = { right = '' }, left_padding = 2 },
			},
		},
		inactive_sections = {
			lualine_a = { 'filename' },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { 'location' },
		},
		tabline = {},
		extensions = {},
	},
}
