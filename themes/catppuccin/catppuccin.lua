#!/usr/bin/env lua

--[[
Nvim implementation of the catppuccin color palette
Homepage: https://github.com/Pocco81/Catppuccino.nvim
Copyright (C) 2021 Pocco81
]]

local M = {}
local hex_chars = "0123456789abcdef"
local color_palette = {
	catppuccin0 = "#F2F2F7",		-- Ghost White
	catppuccin1 = "#16131F",		-- Xiketic
	catppuccin2 = "#EA31B5",		-- Fashion Fuchsia
	catppuccin3 = "#AE9AD6",		-- Blue Shell
	catppuccin4 = "#F0A8E4",		-- Orchid Crayola
	catppuccin5 = "#E28D8D",		-- New York Pink
	catppuccin6 = "#E7A988",		-- Tumbleweed
	catppuccin7 = "#ADD692",		-- Granny Smith Apple
	catppuccin8 = "#E3DAA3",		-- Megium Champagne
	catppuccin9 = "#7EA1C8",		-- Cerulean Frost
	catppuccin10 = "#A7B6DC",		-- Wild Blue Yonder
	catppuccin11 = "#6F6A8A",		-- Rhythm
	catppuccin12 = "#3e4058",		-- Independence
	catppuccin13 = "#0D0B11",		-- Xiketic
	catppuccin14 = "#201C2B",		-- Raisin Black
	catppuccin15 = "#312C44",		-- Space Cadet
}

--- @return string
function M.scriptname()
	return string.match(debug.getinfo(2).short_src, "[^/]*$")
end

local function color_is_bright(r, g, b)
	-- Counting the perceptive luminance - human eye favors green color
	local luminance = (0.299 * r + 0.587 * g + 0.114 * b) / 255
	if luminance > 0.5 then
		return true -- Bright colors, black font
	else
		return false -- Dark colors, white font
	end
end

function M.hex2rgb(hex)
	return tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6))
end

local function __init__()
	M.printf("Say hi to Catppuccino!! Thanks for using " .. M.scriptname())
	for color, hex in pairs(color_palette) do print("#" .. color .. ": " .. hex) end
end

return M
