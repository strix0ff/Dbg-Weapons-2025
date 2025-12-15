SWEP.Base = "weapon_octo_base_smg"
SWEP.Category = 'Доброград' .. ' - ПП'
SWEP.PrintName = "SMG 919"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'smgs'

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_smg_919.mdl"
SWEP.Primary.Sound = Sound("smg919.fire")
SWEP.Primary.DistantSound = Sound("smg919.fire-distant")
SWEP.Primary.Damage = 12
SWEP.Primary.RPM = 500
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/smg/smg919/smg919_reload.wav'
SWEP.ReloadTime = 2.1

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 1.9
SWEP.Primary.KickDown = 0.4
SWEP.Primary.KickHorizontal = 0.2

SWEP.VisualRecoilHorizontal = 0.15
SWEP.VisualRecoilVertical = 4
SWEP.VisualRecoilRecoverRate = 4

SWEP.MuzzlePos = Vector(25.10, -0.23, 9.32)
SWEP.MuzzleAng = Angle(-10.48, 1.82, 0.00)
SWEP.AimPos = Vector(-6.71, -1.24, 5.63)
SWEP.AimAng = Angle(-9.50, 1.82, 0.00)

SWEP.DefaultFireMode = 1
SWEP.FireModes = {'single', 'auto'}

SWEP.ActiveHoldType = "smg"
-- SWEP.Icon = octolib.icons.color('gun_smg')
