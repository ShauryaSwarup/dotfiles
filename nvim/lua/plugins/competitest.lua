return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  config = function()
    require("competitest").setup({
      compile_command = {
        cpp = { exec = "g++", args = { "-std=c++20", "-DLOCAL", "$(FNAME)", "-o", "$(FNOEXT)" } },
      },
      template_file = "/home/shaun/Documents/Coding/Templates/template.$(FEXT)",
      evaluate_template_modifiers = true,
    })
  end,
}
