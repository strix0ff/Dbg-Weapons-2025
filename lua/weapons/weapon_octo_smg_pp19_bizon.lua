SWEP.Base = "weapon_octo_base_smg"
SWEP.Category = 'Доброград' .. ' - ПП'
SWEP.PrintName = "PP-19 Bizon"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'smgs'
SWEP.FireModes = {'single', 'auto', 'semi'}
SWEP.DefaultFireMode = 1

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_smg_bizon.mdl"
SWEP.Primary.Sound = Sound("pp19_bizon.fire")
SWEP.Primary.DistantSound = Sound("pp19_bizon.fire-distant")
SWEP.Primary.Damage = 8
SWEP.Primary.RPM = 500
SWEP.Primary.ClipSize = 64
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/smg/pp19_bizon/pp19_bizon_reload.wav'
SWEP.ReloadTime = 2

SWEP.Primary.Spread = 0.003
SWEP.Primary.KickUp = 1.45
SWEP.Primary.KickDown = 0.35
SWEP.Primary.KickHorizontal = 0.825

SWEP.VisualRecoilHorizontal = 1
SWEP.VisualRecoilVertical = 3
SWEP.VisualRecoilRecoverRate = 4

SWEP.MuzzlePos = Vector(19.10, -0.95, 6.90)
SWEP.MuzzleAng = Angle(-10.01, -0.09, 0.00)
SWEP.AimPos = Vector(-2.48, -1.03, 5.68)
SWEP.AimAng = Angle(-9.00, -0.09, 0.00)

SWEP.PassiveHoldType = "passive"
SWEP.ActiveHoldType = "ar2"
-- SWEP.Icon = octolib.icons.color('gun_smg')
