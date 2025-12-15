SWEP.Base = "weapon_octo_base_zoom"
SWEP.Category = 'Доброград' .. ' - Снайперки'
SWEP.PrintName = "Remington 700"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'snipers'
SWEP.Primary.Ammo = "sniper"
SWEP.DefaultFireMode = 1

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_snip_rem700.mdl"
SWEP.Primary.Sound = Sound("rem700.fire")
SWEP.Primary.DistantSound = Sound("rem700.fire-distant")
SWEP.Primary.Damage = 72
SWEP.Primary.RPM = 25
SWEP.Primary.ClipSize = 6
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/sniper_rifles/remington_700/remington_700_reload.wav'
SWEP.ReloadTime = 3.5
SWEP.ShootEndSound = 'weapons-new/sniper_rifles/remington_700/remington_700_reload_shot.wav'
SWEP.ShootEndSoundDelay = 1
SWEP.NoAmmoSound = 'Weapon_AR2.Empty'

SWEP.Primary.Spread = 0
SWEP.Primary.KickUp = 3.78
SWEP.Primary.KickDown = 1.03
SWEP.Primary.KickHorizontal = 0.73

SWEP.VisualRecoilHorizontal = 7
SWEP.VisualRecoilVertical = 14
SWEP.VisualRecoilRecoverRate = 2

SWEP.MuzzlePos = Vector(42.76, -0.80, 10.60)
SWEP.MuzzleAng = Angle(-9.00, 0.00, 0.00)
SWEP.AimPos = Vector(-2.86, -0.85, 5.49)
SWEP.AimAng = Angle(-9.00, 0.00, 0.00)

SWEP.SightPos = Vector(-0.08, -0.86, 5.89)
SWEP.SightAng = Angle(0.00, -90.00, 100.00)
SWEP.SightSize = 1.6
SWEP.SightFOV = 12
SWEP.SightZoomLevels = {1, 2.5, 3.25}

SWEP.FireModes = {'single'}

-- SWEP.Icon = octolib.icons.color('gun_sniper')
