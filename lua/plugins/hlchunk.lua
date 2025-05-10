return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
	indent = {
	    enable = true,
	    priority = 10,
	    style = { "#888888" },
	    use_treesitter = false,
	    chars = { "│" },
	    ahead_lines = 20,
	    delay = 100
	},
	chunk = {
	    enable = true,
	    priority = 15,
	    style = {
	        { fg = "#00FFFF" },
	        { fg = "#C21F30" }
	    },
	    use_treesitter = true,
	    chars = {
	        horizontal_line = "─",
	        vertical_line = "│",
	        left_top = "╭",
	        left_bottom = "╰",
	        right_arrow = ">"
	    },
	    textobject = "",
	    max_file_size = 2048 * 2048,
	    error_sign = true,
	    -- animation related
	    duration = 200,
	    delay = 150
	},
	blank = {
	    enabled = false,
	    priority = 5
	},
	line_num = {
	    enable = false,
	    priority = 4
	}
  }
}
