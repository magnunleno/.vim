-- Custom leaders
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Basic options
require("config.options")

-- Plugins
require("config.lazy")
vim.env['PLUGINS'] = vim.fn.stdpath('config') .. '/lua/config/plugins/'

-- Mappings
vim.env['MAPPING'] = vim.fn.stdpath('config') .. '/lua/config/mappings.lua'
require("config.mappings")

-- Commands
require("config.commands")
