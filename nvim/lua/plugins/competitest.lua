return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  config = function()
    require("competitest").setup({
      compile_command = {
        cpp = { exec = "g++", args = { "-std=c++20", "-DLOCAL", "$(FNAME)", "-o", "./exec/$(FNOEXT)" } },
      },
      run_command = {
        cpp = { exec = "./exec/$(FNOEXT)" },
      },
      template_file = "/home/shaun/Documents/Coding/Templates/template.$(FEXT)",
      evaluate_template_modifiers = true,
      testcases_directory = "./inputs",
      received_files_extension = "cpp",
      received_problems_prompt_path = false,
      received_contests_prompt_extension = false,
      open_received_contests = false,
      view_output_diff = true,
    })
  end,
}
