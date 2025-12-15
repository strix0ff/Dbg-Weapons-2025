-- net.Receive('octoweapons.bend', function()
-- 	local ply, fraction = net.ReadEntity(), net.ReadInt(8)
-- 	if not IsValid(ply) then return end

-- 	local wep = ply:GetActiveWeapon()
-- 	local targetAngles = octolib.table.map((IsValid(wep) and wep.BendAngles) and (wep.BendAngles[wep:GetHoldType()] or wep.BendAngles._default) or {}, function(ang)
-- 		return ang * fraction
-- 	end)

-- 	octolib.manipulateBones(ply, targetAngles, 0.3)
-- end)