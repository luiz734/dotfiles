return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")


      dap.adapters.godot = {
        type = "server",
        host = '127.0.0.1',
        port = 6006,
      }
      dap.configurations.gdscript = {
        {
          type = "godot",
          request = "launch",
          name = "Launch scene",
          project = "${workspaceFolder}",
          debug_collisions = false,
          launch_scene = true,
        }
      }


      require 'which-key'.register({
        ["<F9>"] = { dap.continue, "Debug continue" },
        ["<F8>"] = { dap.step_over, "Debug step_over" },
        ["<F7>"] = { dap.step_into, "Debug step_into" },
        ["<F11>"] = { dap.toggle_breakpoint, "Debug step_into" },
      })
    end

  },

  {
    "rcarriga/nvim-dap-ui",
    config = function()
      local dapui = require("dapui")
      dapui.setup({})

      require 'which-key'.register({
        ["<F12>"] = { dapui.toggle, "Debug continue" },
      })
    end
  }
}
