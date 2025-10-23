-- LSP Configuration for Backend Development
-- Python, Go, C/C++, TypeScript, YAML, JSON

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Python (Zubaan - High-performance LSP written in Rust)
-- Install: pip install zuban
lspconfig.zubaan.setup({
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
      },
    },
  },
})

-- Go
lspconfig.gopls.setup({
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})

-- C/C++
lspconfig.clangd.setup({
  capabilities = capabilities,
  cmd = { "clangd", "--background-index" },
})

-- TypeScript/JavaScript
lspconfig.ts_ls.setup({
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = false,
    },
  },
})

-- YAML
lspconfig.yamlls.setup({
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/docker-compose.json"] = "docker-compose*.yml",
        ["https://json.schemastore.org/kube-deployment.json"] = "k8s-*.yml",
      },
    },
  },
})

-- JSON
lspconfig.jsonls.setup({
  capabilities = capabilities,
})

-- Global mappings
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- On attach mappings
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", { desc = "Go to declaration" }, bufopts))
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", { desc = "Go to definition" }, bufopts))
  vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", { desc = "Hover" }, bufopts))
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", { desc = "Go to implementation" }, bufopts))
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, vim.tbl_extend("force", { desc = "Signature help" }, bufopts))
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, vim.tbl_extend("force", { desc = "Add workspace folder" }, bufopts))
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, vim.tbl_extend("force", { desc = "Remove workspace folder" }, bufopts))
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, vim.tbl_extend("force", { desc = "List workspace folders" }, bufopts))
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, vim.tbl_extend("force", { desc = "Type definition" }, bufopts))
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", { desc = "Rename" }, bufopts))
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", { desc = "Code action" }, bufopts))
  vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, vim.tbl_extend("force", { desc = "References" }, bufopts))
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, vim.tbl_extend("force", { desc = "Format" }, bufopts))
end

-- Update on_attach for all servers
for _, server in ipairs({ "zuban", "gopls", "clangd", "ts_ls", "yamlls", "jsonls" }) do
  if lspconfig[server] then
    lspconfig[server].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end
end
