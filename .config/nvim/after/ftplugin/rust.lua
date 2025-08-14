-- using rust_tools's lsp hints
vim.lsp.inlay_hint.enable(false)

-- vim.keymap.set("n", "K", require("rust-tools").hover_actions.hover_actions, { buffer = 0 },
--     { desc = "Open rust hover actions, info and documentation (rust-tools)" })
-- vim.keymap.set("n", "J", require("rust-tools").join_lines.join_lines, { desc = "Join lines (rust-tools)" })
-- vim.keymap.set("n", "<Leader>'", require("rust-tools").code_action_group.code_action_group, { buffer = 0 },
--     { desc = "Open rust code actions" })
-- vim.keymap.set("n", "gq", require("rust-tools").open_cargo_toml.open_cargo_toml, { desc = "Open Cargo.toml" })
