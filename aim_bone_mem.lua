if not memoriam then print('No memoriam') return end
local me = LocalPlayer()

local AIM_HEAD = 0
local AIM_CHEST = 1
local AIM_STOMACH = 2

local weapons = {
    -- AIM_HEAD
    ['swb_deagle'] = AIM_HEAD,
    ['swb_sniper2'] = AIM_HEAD,
    ['swb_sniper'] = AIM_HEAD,
    ['swb_shotgun'] = AIM_HEAD,
    ['swb_m3super90'] = AIM_HEAD,
    ['swb_xm1014'] = AIM_HEAD,
    ['swb_hshotgun'] = AIM_HEAD,
    ['swb_scout'] =  AIM_HEAD,
    -- AIM_STOMACH
    ['swb_ar3'] = AIM_STOMACH,
    ['swb_ar2'] = AIM_STOMACH,
    ['swb_p90'] = AIM_STOMACH,
    ['swb_oicw'] = AIM_STOMACH,
    ['swb_rtboicw'] = AIM_STOMACH,
    ['swb_ak47'] =  AIM_STOMACH,
    ['swb_smg2'] =  AIM_STOMACH,
    ['swb_smg3'] = AIM_STOMACH,
    ['swb_ump'] = AIM_STOMACH,
}

local weapon = me:GetActiveWeapon()
local oldWeapon = IsValid(weapon) and weapon:GetClass() or 'NONE'

hook.Add('PlayerSwitchWeapon', util.CRC('%s:%s:%s'):format(me:SteamID(), GetHostName(), CurTime()), function( ply, _, newWep )
	if ply ~= me then return end
	if not IsValid(newWep) then return end
	if oldWeapon == newWep then return end

	oldWeapon = IsValid(newWep) and newWep:GetClass() or 'NONE'

    local bone = weapons[oldWeapon] 

	if not bone then return end

	memoriam.SetSetting('rage_aimbot_hitbox', bone)
end)
