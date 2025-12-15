SWEP.Base = "weapon_octo_base_shotgun"
SWEP.Category = 'Доброград' .. ' - Дробовики'
SWEP.PrintName = "M3"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'shotguns'

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_shot_m3ben.mdl"
SWEP.Primary.Sound = Sound("m3.fire")
SWEP.Primary.DistantSound = Sound("m3.fire-distant")
SWEP.Primary.Damage = 17
SWEP.Primary.RPM = 40
SWEP.Primary.ClipSize = 8
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/shotguns/m3/m3_super_90_reload.wav'
SWEP.ReloadTime = 3
SWEP.ShootEndSound = 'weapons-new/shotguns/m3/m3_super_90_pump_bf.wav'
SWEP.ShootEndSoundDelay = 1
SWEP.NoAmmoSound = 'Weapon_AR2.Empty'

SWEP.Primary.Distance = 1250
SWEP.Primary.Spread = 0.09
SWEP.Primary.KickUp = 6.017
SWEP.Primary.KickDown = 2.514
SWEP.Primary.KickHorizontal = 4.002

SWEP.VisualRecoilHorizontal = 5
SWEP.VisualRecoilVertical = 12
SWEP.VisualRecoilRecoverRate = 6

SWEP.MuzzlePos = Vector(26.00, -1.01, 8.00)
SWEP.MuzzleAng = Angle(-11.06, 0.00, -118.06)
SWEP.AimPos = Vector(-3.72, -0.97, 4.36)
SWEP.AimAng = Angle(-10, 0.00, -118.06)

SWEP.DefaultFireMode = 1
SWEP.FireModes = {'single'}

SWEP.Primary.NumShots = 8
-- SWEP.Icon = octolib.icons.color('weapon_m3')
