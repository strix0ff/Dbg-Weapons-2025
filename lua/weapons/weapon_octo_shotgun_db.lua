SWEP.Base = "weapon_octo_base_shotgun"
SWEP.Category = 'Доброград' .. ' - Дробовики'
SWEP.PrintName = "Двустволка"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'shotguns'

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/db.mdl"
SWEP.Primary.Sound = Sound("db.fire")
SWEP.Primary.DistantSound = Sound("db.fire-distant")
SWEP.Primary.Damage = 13
SWEP.Primary.RPM = 500
SWEP.Primary.ClipSize = 2
SWEP.Primary.MaxStoredAmmo = 16
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/shotguns/double_barrel/double_barrel_reload.wav'
SWEP.ReloadTime = 3
SWEP.NoAmmoSound = 'Weapon_AR2.Empty'

SWEP.Primary.Spread = 0.13
SWEP.Primary.Distance = 1250
SWEP.Primary.KickUp = 6.842
SWEP.Primary.KickDown = 5.305
SWEP.Primary.KickHorizontal = 3.974

SWEP.VisualRecoilHorizontal = 5
SWEP.VisualRecoilVertical = 20
SWEP.VisualRecoilRecoverRate = 2

SWEP.MuzzlePos = Vector(25.00, -0.88, 7.50)
SWEP.MuzzleAng = Angle(-10.00, 0.00, 9.01)
SWEP.AimPos = Vector(-1.21, -0.92, 4.72)
SWEP.AimAng = Angle(-10.00, 0.00, 9.01)

SWEP.DefaultFireMode = 1
SWEP.FireModes = {'single'}

SWEP.Primary.NumShots = 8
-- SWEP.Icon = octolib.icons.color('gun_shotgun')
