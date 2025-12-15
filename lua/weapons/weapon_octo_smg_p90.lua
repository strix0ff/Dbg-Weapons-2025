SWEP.Base = "weapon_octo_base_smg"
SWEP.Category = 'Доброград' .. ' - ПП'
SWEP.PrintName = "P90"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'smgs'
SWEP.FireModes = {'single', 'auto', 'semi'}
SWEP.DefaultFireMode = 1

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_smg_p90.mdl"
SWEP.Primary.Sound = Sound("p90.fire")
SWEP.Primary.DistantSound = Sound("p90.fire-distant")
SWEP.Primary.Damage = 10
SWEP.Primary.RPM = 1000
SWEP.Primary.ClipSize = 50
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/smg/p90/p90_reload.wav'
SWEP.ReloadTime = 2.25

SWEP.Primary.Spread = 0.002
SWEP.Primary.KickUp = 1.1
SWEP.Primary.KickDown = 0.6
SWEP.Primary.KickHorizontal = 0.5

SWEP.VisualRecoilHorizontal = 0.7
SWEP.VisualRecoilVertical = 1.12
SWEP.VisualRecoilRecoverRate = 4

SWEP.MuzzlePos = Vector(17.18, -0.76, 5.99)
SWEP.MuzzleAng = Angle(-9.76, 2.25, 0.00)
SWEP.AimPos = Vector(-1.54, -0.97, 7.94)
SWEP.AimAng = Angle(-9.76, 2.25, 0.00)

SWEP.FlashlightPos = Vector(16.19, -1.65, 9.92)
SWEP.FlashlightAng = Angle(0.00, 0.00, 0.00)
SWEP.FlashlightHalo = 1.15

SWEP.ActiveHoldType = "smg"
-- SWEP.Icon = octolib.icons.color('weapon_p90')
