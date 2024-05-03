require("neorg").setup({
   load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
      ["core.dirman"] = {
         config = {
            workspaces = {
               default = "~/Notes",
               english = "~/School/English"
            },
         },
      },
   },
})
