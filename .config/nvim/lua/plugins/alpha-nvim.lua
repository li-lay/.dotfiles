return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
        ["<Leader>c"] = {
          function()
            local bufs = vim.fn.getbufinfo({ buflisted = true })
            require("astrocore.buffer").close(0)
            if
              require("astrocore").is_available("alpha-nvim") and not bufs[2]
            then
              require("alpha").start()
            end
          end,
          desc = "Close buffer",
        },
      },
    },
  },
}
