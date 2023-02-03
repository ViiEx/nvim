local status_ok, lspsaga = pcall(require, "lspsaga")

if not status_ok then
    return
end

lspsaga.setup({
    lightbulb = {
        enable = false,
        enable_in_insert = false,
        sign = false,
        sign_priority = 40,
        virtual_text = false,
    },
})
