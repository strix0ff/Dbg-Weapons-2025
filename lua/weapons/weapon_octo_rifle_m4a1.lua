SWEP.Base = "weapon_octo_base_rifle"
SWEP.Category = 'Доброград' .. ' - Автоматы'
SWEP.PrintName = "M4A1"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'rifles'
SWEP.FireModes = {'single', 'auto', 'semi'}
SWEP.DefaultFireMode = 1

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_rif_m4a1.mdl"
SWEP.Primary.Sound = Sound("m4a1.fire")
SWEP.Primary.DistantSound = Sound("m4a1.fire-distant")
SWEP.Primary.Damage = 24
SWEP.Primary.RPM = 500
SWEP.Primary.ClipSize = 30

SWEP.ReloadSound = 'weapons-new/assault_rifles/m4a1/m4a1_reload.wav'
SWEP.ReloadTime = 2.4

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 2.28
SWEP.Primary.KickDown = 1
SWEP.Primary.KickHorizontal = 0.5

SWEP.VisualRecoilHorizontal = 2
SWEP.VisualRecoilVertical = 3.5
SWEP.VisualRecoilRecoverRate = 4

SWEP.MuzzlePos = Vector(25.66, -1.00, 8.16)
SWEP.MuzzleAng = Angle(-10.70, 0.00, 0.00)
SWEP.AimPos = Vector(-4.90, -0.95, 5.91)
SWEP.AimAng = Angle(-9.80, 0.00, 0.00)

SWEP.FireModes = {'single', 'auto'}
SWEP.DefaultFireMode = 1

-- SWEP.Icon = octolib.icons.color('weapon_m4a1')
