SWEP.Base = "weapon_octo_base_smg"
SWEP.Category = 'Доброград' .. ' - ПП'
SWEP.PrintName = "AR-15 Pistol"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'smgs'
SWEP.FireModes = {'single', 'auto', 'semi'}
SWEP.DefaultFireMode = 1

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_b_ar15pistol.mdl"
SWEP.Primary.Sound = Sound("ar15_pistol.fire")
SWEP.Primary.DistantSound = Sound("ar15_pistol.fire-distant")
SWEP.Primary.Damage = 11
SWEP.Primary.RPM = 500
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/smg/ar15_pistol/ar15_pistol_reload.wav'
SWEP.ReloadTime = 2

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 2.2
SWEP.Primary.KickDown = 0.64
SWEP.Primary.KickHorizontal = 0.7

SWEP.VisualRecoilHorizontal = 0.35
SWEP.VisualRecoilVertical = 1.5
SWEP.VisualRecoilRecoverRate = 2

SWEP.MuzzlePos = Vector(21.69, -0.94, 7.49)
SWEP.MuzzleAng = Angle(-10.08, 0.11, 0.00)
SWEP.AimPos = Vector(-5.86, -1.06, 4.61)
SWEP.AimAng = Angle(-9.50, 0.11, 0.00)

SWEP.ActiveHoldType = "ar2"
-- SWEP.Icon = octolib.icons.color('gun_smg')
