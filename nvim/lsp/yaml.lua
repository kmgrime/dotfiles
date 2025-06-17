return {
	cmd = {
		"yaml-language-server",
		"..stdio"
	},
	filetypes = {
		"yaml",
		"yml",
	},
	root_markers = {
		".git",
		".yamlrc",
		".yamlrc.yaml",
		".yamlrc.yml"
	},
	 settings = {
	     yaml = {
	       schemas = {
		    ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
		    ["https://json.schemastore.org/kustomization.json"] = "kustomization.yaml",
		},
		validate = true,
		hover = true,
		completion = true,
		schemaDownload = {
		    enable = true,
		},
	     },
	 },
	single_file_support = true,
}
