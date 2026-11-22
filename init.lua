-- Custom leaders
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Basic options
require("config.options")

-- Plugins
vim.env['PLUGINS'] = vim.fn.stdpath('config') .. '/lua/config/lazy.lua'
require("config.lazy")

-- Mappings
vim.env['MAPPING'] = vim.fn.stdpath('config') .. '/lua/config/mappings.lua'
require("config.mappings")

-- Commands
require("config.commands")
