if SERVER then

	AddCSLuaFile()

end

-- game.AddAmmoType({
-- 	name = "sniper",
-- 	dmgtype = DMG_BULLET,
-- 	tracer = TRACER_LINE,
-- 	force = 2000,
-- })

SWEP.Base						= "weapon_octo_base"
SWEP.WeaponCategory				= "smg1"

SWEP.Primary.Ammo				= "smg1"
SWEP.Primary.Automatic			= true

SWEP.PassiveHoldType 			= "passive"
SWEP.ActiveHoldType 			= "ar2"
SWEP.HasZoom			= true

SWEP.ReloadTime 				= 3
-- SWEP.Icon = 'octoteam/icons/gun_sniper.png'

-- local mat = Material("overlays/scope_lens")
-- hook.Add( "HUDPaint", "octoweapons", function()
-- 	local wep = LocalPlayer():GetActiveWeapon()
-- 	if IsValid(wep) and wep.WeaponCategory == "sniper" then
-- 		local curfov = math.Round( LocalPlayer():GetFOV() )
-- 		local perc = (defaultfov - curfov) / 60
-- 		if perc ~= 0 then
-- 			surface.SetDrawColor( 255,255,255, perc*180 )
-- 			surface.SetMaterial( mat )
-- 			surface.DrawTexturedRect( 0, 0, ScrW(), ScrH() )
-- 		end
-- 	end
-- end)

-- hook.Add( "PreDrawHUD", "octoweapons", function()
-- 	local wep = LocalPlayer():GetActiveWeapon()
-- 	if IsValid(wep) and wep.WeaponCategory == "sniper" then
-- 		local curfov = math.Round( LocalPlayer():GetFOV() )
-- 		local perc = (defaultfov - curfov) / 60
-- 		if perc ~= 0 then
-- 			DrawToyTown( 4 * perc, ScrH() / 2 )
-- 		end
-- 	end
-- end)
