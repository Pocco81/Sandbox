#!/usr/bin/env lua

--[[
Nvim implementation of the Katppuccino color palette
Homepage: https://github.com/Pocco81/Catppuccino.nvim
Copyright (C) 2021 Pocco81
]]

local M = {}
local hex_chars = "0123456789abcdef"
local color_palette = {
	katppuccino0 = "#F2F2F7",		-- Ghost White
	katppuccino1 = "#16131F",		-- Xiketic
	katppuccino2 = "#EA31B5",		-- Fashion Fuchsia
	katppuccino3 = "#AE9AD6",		-- Blue Shell
	katppuccino4 = "#F0A8E4",		-- Orchid Crayola
	katppuccino5 = "#E28D8D",		-- New York Pink
	katppuccino6 = "#E7A988",		-- Tumbleweed
	katppuccino7 = "#ADD692",		-- Granny Smith Apple
	katppuccino8 = "#E3DAA3",		-- Megium Champagne
	katppuccino9 = "#7EA1C8",		-- Cerulean Frost
	katppuccino10 = "#A7B6DC",		-- Wild Blue Yonder
	katppuccino11 = "#6F6A8A",		-- Rhythm
	katppuccino12 = "#3e4058",		-- Independence
	katppuccino13 = "#0D0B11",		-- Xiketic
	katppuccino14 = "#201C2B",		-- Raisin Black
	katppuccino15 = "#312C44",		-- Space Cadet
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
