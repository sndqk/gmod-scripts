local zona, cache = {}, {}
local PATH_FILE = 'zona/data.json'

local file = file
local ToTable = util.JSONToTable
local ToJSON = util.TableToJSON
local Derma_Req = Derma_StringRequest

file.CreateDir 'zona'
if not file.Exists(PATH_FILE, 'DATA') then file.Write(PATH_FILE, ToJSON({})) end

function zona.getData()
    return ToTable(file.Read(PATH_FILE, 'DATA') or '[]')
end

function zona.getVar(var, def)
    if not cache[var] then return def end
    return cache[var]
end

function zona.setVar(var, any, save)
    cache[var] = any
    if not save then return end
    file.Write(PATH_FILE, ToJSON(cache))
end

function zona.initVar(var, def)
    if not cache[var] then return zona.setVar(var, def) end
end

function zona.request(var, def)
    Derma_Req(
	'Request | ' .. var , 
	'Input the string to change settings',
	def or '',
	function(str) zona.setVar(var, str) end)
end

cache = zona.getData()

return zona
