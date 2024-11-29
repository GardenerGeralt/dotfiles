return {
	"AlphaTechnolog/pywal.nvim",
	lazy = false,
	name = "pywal",
	priority = 1000,
	config = function()
		local pywal = require("pywal")
		pywal.setup()
	end,
}
