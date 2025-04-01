return {
    -- {
    --     "https://github.com/EggbertFluffle/beepboop.nvim",
    --     config = function()
    --         local stone_songs = { "stone1.oga", "stone2.oga", "stone3.oga", "stone4.oga" }
    --         require 'beepboop'.setup {
    --             audio_player = "paplay",
    --             -- max_sounds = 20,
    --             volume = 80,
    --             sound_directory = "/home/tohru/Music/sounds",
    --             sound_map = {
    --                 { key_map = { mode = "i", key_chord = "<BS>" }, sounds = stone_songs },
    --                 { auto_command = "VimEnter",                    sound = "chestopen.flac" },
    --                 { auto_command = "VimLeave",                    sound = "chestclosed.flac" },
    --                 { auto_command = "InsertCharPre",               sounds = stone_songs },
    --                 { auto_command = "CursorMoved",                 sounds = stone_songs },
    --                 { auto_command = "TextYankPost",                sounds = { "hit1.oga", "hit2.oga", "hit3.oga" } },
    --                 { auto_command = "BufWrite",                    sounds = { "open_flip1.oga", "open_flip2.oga", "open_flip3.oga" } },
    --             }
    --         }
    --     end
    -- },
    {
        "https://github.com/NStefan002/screenkey.nvim",
        config = function()
            require("keys").setup {
                enable_on_startup = false,
                win_opts = {
                    width = 25,
                    -- etc
                },
                -- TODO: more options later
            }
        end
    }
}
