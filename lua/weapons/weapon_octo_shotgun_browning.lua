SWEP.Base = "weapon_octo_base_shotgun"
SWEP.Category = 'Доброград' .. ' - Дробовики'
SWEP.PrintName = "Browning Auto-5"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'shotguns'

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_shot_browningauto.mdl"
SWEP.Primary.Sound = Sound("browning.fire")
SWEP.Primary.DistantSound = Sound("browning.fire-distant")
SWEP.Primary.Damage = 12
SWEP.Primary.RPM = 240
SWEP.Primary.ClipSize = 5
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/shotguns/browning_a5/browning_a5_reload.wav'
SWEP.ReloadTime = 3
SWEP.NoAmmoSound = 'Weapon_AR2.Empty'

SWEP.Primary.Distance = 2500
SWEP.Primary.Spread = 0.11
SWEP.Primary.KickUp = 10
SWEP.Primary.KickDown = 10
SWEP.Primary.KickHorizontal = 5.014

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
