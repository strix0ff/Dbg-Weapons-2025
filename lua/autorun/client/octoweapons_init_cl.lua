-- hook.Add('PlayerSwitchWeapon', 'dbg.weaponGroups', function()
-- 	return true
-- end)

hook.Add('PlayerFinishedLoading', 'dbg.weapons', function()
	weapons.GetStored('gmod_tool').ShootSound = ''
end)

--air
hook.Add('Initialize', 'dbg-weps.init', function()
	game.AddAmmoType({
		name = 'air',
		dmgtype = bit.band(DMG_BULLET, DMG_NEVERGIB, DMG_DIRECT),
		tracer = TRACER_LINE,
		plydmg = 0,
		npcdmg = 0,
		force = 0,
		minsplash = 5,
		maxsplash = 2.5,
		maxcarry = 100,
	})
end)

timer.Simple(0, function()
	function GAMEMODE:AdjustMouseSensitivity()
		local ply = LocalPlayer()
		if not IsValid(ply) then
			return -1
		end

		local wep = ply:GetActiveWeapon()
		if IsValid(wep) and wep.AdjustMouseSensitivity then
			return wep:AdjustMouseSensitivity()
		end

		return -1
	end
end)
