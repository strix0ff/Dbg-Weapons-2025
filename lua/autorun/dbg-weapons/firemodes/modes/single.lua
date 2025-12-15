dbgWeapons.registerFireMode('single', {
	init = function(wep)
		wep.Primary.Automatic = false
	end,
	shoot = function(wep)
		wep:ShootBullet()
		return 1 / (wep.Primary.RPM / 60)
	end,
})