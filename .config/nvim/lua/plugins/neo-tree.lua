return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        filesystem = {
            filtered_items = {
                visible = true,  -- Set to true to show hidden files
                hide_dotfiles = false,  -- Set to false to display dotfiles
                hide_gitignored = false,  -- Set to false to display gitignored files
                hide_by_name = {
                    -- "node_modules",  -- Example of files/folders you might want to hide
                    -- "thumbs.db",
                },
                never_show = {
                    -- ".git",  -- Files that should never be shown
                    ".DS_Store",
                    ".history",
                },
            },
        },
    },
}
