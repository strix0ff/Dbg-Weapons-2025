SWEP.Base = "weapon_octo_base_rifle"
SWEP.Category = 'Доброград' .. ' - Автоматы'
SWEP.PrintName = "AK-105"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'rifles'
SWEP.FireModes = {'single', 'auto', 'semi'}
SWEP.DefaultFireMode = 1

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_rif_ak_105.mdl"
SWEP.Primary.Sound = Sound("ak105.fire")
SWEP.Primary.DistantSound = Sound("ak105.fire-distant")
SWEP.Primary.Damage = 28
SWEP.Primary.RPM = 500
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/assault_rifles/ak_105/ak_105_reload.wav'
SWEP.ReloadTime = 2.65

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 1.75
SWEP.Primary.KickDown = 1.2
SWEP.Primary.KickHorizontal = 0.8

SWEP.VisualRecoilHorizontal = 0.7
SWEP.VisualRecoilVertical = 3
SWEP.VisualRecoilRecoverRate = 6

SWEP.MuzzlePos = Vector(22.88, -1.21, 6.55)
SWEP.MuzzleAng = Angle(-10.00, 0.02, 0.00)
SWEP.AimPos = Vector(-4.09, -1.20, 4.07)
SWEP.AimAng = Angle(-10.00, 0.02, 0.00)

-- SWEP.Icon = octolib.icons.color('weapon_ak47')
