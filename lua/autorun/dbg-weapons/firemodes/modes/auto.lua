dbgWeapons.registerFireMode('auto', {
	init = function(wep)
		wep.Primary.Automatic = true
	end,
	shoot = function(wep)
		wep:ShootBullet()
		return 1 / (wep.Primary.RPM / 60)
	end,
})