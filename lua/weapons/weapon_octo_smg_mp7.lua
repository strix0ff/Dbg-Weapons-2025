SWEP.Base = "weapon_octo_base_smg"
SWEP.Category = 'Доброград' .. ' - ПП'
SWEP.PrintName = "HK MP7"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'smgs'
SWEP.FireModes = {'single', 'auto', 'semi'}
SWEP.DefaultFireMode = 1

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_smg_mp7.mdl"
SWEP.Primary.Sound = Sound("mp7.fire")
SWEP.Primary.DistantSound = Sound("mp7.fire-distant")
SWEP.Primary.Damage = 15
SWEP.Primary.RPM = 500
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/smg/mp7/mp7_reload.wav'
SWEP.ReloadTime = 2

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 1.35
SWEP.Primary.KickDown = 0.8
SWEP.Primary.KickHorizontal = 0.44

SWEP.VisualRecoilHorizontal = 0.25
SWEP.VisualRecoilVertical = 2
SWEP.VisualRecoilRecoverRate = 4

SWEP.MuzzlePos = Vector(0.70, -1.11, 3.67)
SWEP.MuzzleAng = Angle(-10.70, 2.03, 0.00)
SWEP.AimPos = Vector(-7.89, -1.35, 5.21)
SWEP.AimAng = Angle(-10.00, 2.03, 0.00)

SWEP.ActiveHoldType = "smg"
-- SWEP.Icon = octolib.icons.color('gun_smg')
