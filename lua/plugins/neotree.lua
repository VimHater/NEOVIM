return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
  opts = function(_, opts)
    opts.window = {
      mappings = {
        ["a"] = { "add", nowait = true }, -- Create new file
        ["A"] = { "add_directory", nowait = true }, -- Create new folder
        ["r"] = { "rename", nowait = true }, -- Rename file/folder
        ["d"] = { "delete", nowait = true }, -- Delete file/folder
        ["y"] = { "copy_to_clipboard", nowait = true }, -- Copy file
        ["x"] = { "cut_to_clipboard", nowait = true }, -- Cut file
        ["p"] = { "paste_from_clipboard", nowait = true }, -- Paste file
        ["c"] = { "copy", nowait = true }, -- Duplicate file
        ["m"] = { "move", nowait = true }, -- Move file
        ["q"] = { "close_window", nowait = true }, -- Close Neo-Tree
        ["<CR>"] = "open", -- Open file
        ["<Esc>"] = "close_window", -- Close with Esc
      },
    }
    opts.event_handlers = {
      {
        event = "file_opened",
        handler = function(_)
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    }
    -- Add this section to show hidden files
    opts.filesystem = {
      filtered_items = {
        visible = true, -- Makes filtered items visible but dimmed
        hide_dotfiles = false, -- Show files starting with a dot
        hide_gitignored = false, -- Hide files ignored by Git
        hide_hidden = false, -- Show hidden files on non-Windows systems
      },
    }
  end,
}
