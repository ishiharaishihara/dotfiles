require('avante').setup({
    provider = "lmstudio",
    rules = {
        global_dir = vim.fn.expand("~/.config/avante/rules"),
    },
    behaviour = {
        auto_approve_tool_permissions = false,
        auto_suggestions = false,
    },
    providers = {
        lmstudio = {
            __inherited_from = "openai",
            endpoint = "http://localhost:1234/v1",
            model = "qwen3-coder-30b-a3b-instruct",
            api_key_name = "",
        },
        corp_ai = {
            __inherited_from = "openai",
            endpoint = "http://10.255.3.200:11434/v1",
            model = "gemma4:26b-a4b-it-qat",
            api_key_name = "",
        }
    },
})
