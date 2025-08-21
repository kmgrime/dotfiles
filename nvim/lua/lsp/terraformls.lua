-- Terraform language server configuration
-- Provides Terraform/HCL syntax support, validation, and completion

return {
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "terraform-vars" },
  root_markers = { ".terraform", ".git", "terraform.tfvars", "*.tf" },
  settings = {
    terraformls = {
      experimentalFeatures = {
        validateOnSave = true,
        prefillRequiredFields = true,
      },
    },
  },
  single_file_support = true,
}
