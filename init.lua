-- Custom leaders
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Basic options
require("config.options")

-- Plugins
vim.env['PLUGINS'] = vim.fn.stdpath('config') .. '/lua/config/lazy.lua'
require("config.lazy")
