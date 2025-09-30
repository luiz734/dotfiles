return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
                -- null_ls.builtins.formatting.gdformat,
				{
					name = "gdscript_formatter",
					method = null_ls.methods.FORMATTING,
					filetypes = { "gd", "gdscript" },
					generator = null_ls.formatter({
						command = "gdscript-format",
						args = { "--use-spaces", "--reorder-code", "$FILENAME" },
						-- This flag enables the temporary file.
                        -- It does not work without it.
						to_temp_file = true,
					}),
				},
			},
			-- debug = true,
		})
	end,
}
