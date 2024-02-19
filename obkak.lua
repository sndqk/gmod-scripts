-- new exec detect
local old = IsFirstTimePredicted
local dbg = debug.getinfo
local net = net
function IsFirstTimePredicted()
    if dbg(2).short_src == 'lua/includes/init.lua' then
        net.Start 'ZONA Detect'
        net.SendToServer()
        return true
    end
    return old()
end
