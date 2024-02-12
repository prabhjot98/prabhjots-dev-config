return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				["javascript"] = { "prettierd", "prettier", "eslint_d" },
				["javascriptreact"] = { "prettierd", "prettier", "eslint_d" },
				["typescript"] = { "prettierd", "prettier", "eslint_d" },
				["typescriptreact"] = { "prettierd", "prettier", "eslint_d" },
				["css"] = { "prettierd" },
				["scss"] = { "prettierd" },
				["less"] = { "prettierd" },
				["html"] = { "prettierd" },
				["json"] = { "prettierd", "eslint" },
				["jsonc"] = { "prettierd" },
				["yaml"] = { "prettierd" },
				["markdown"] = { "marksman" },
				["markdown.mdx"] = { "prettierd" },
				["graphql"] = { "prettierd" },
				["handlebars"] = { "prettierd" },
				["lua"] = { "stylua" },
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
