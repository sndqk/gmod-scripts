local color_formats = {
	{
		name = "hex",
		tostring = function(c)
    		return string.format("%x", (c.r * 0x10000) + (c.g * 0x100) + c.b):upper()
		end,
		tocolor = function(s)
			s = s:gsub("#", "")
    		local r, g, b = tonumber("0x".. s:sub(1,2)), tonumber("0x".. s:sub(3,4)), tonumber("0x".. s:sub(5,6))

    		if r and g and b then
				return Color(r, g, b)
			end
		end
	},
}

local function tohex(clr)
    return color_formats[1].tostring(clr)
end

local function tocol(clr)
    return color_formats[1].tocolor(clr)
end

local config = {
	['misc_rainbow_speed'] = 100,
}

hook.Add('Think', 'rainbow_popa_cosmos', function()
    local col = HSVToColor( ( CurTime() * config['misc_rainbow_speed'] ) % 360, 1, 1 )
    col.a = 255
    if col.r < 50 then col.r = 50 end
    memoriam.SetSetting('chams_entity_outline_color', tohex(col))
end)