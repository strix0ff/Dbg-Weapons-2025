SWEP.Base = "weapon_octo_base_rifle"
SWEP.Category = 'Доброград' .. ' - Автоматы'
SWEP.PrintName = "Galil"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'rifles'
SWEP.FireModes = {'single', 'auto', 'semi'}
SWEP.DefaultFireMode = 1

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_rif_galilwood.mdl"
SWEP.Primary.Sound = Sound("galil.fire")
SWEP.Primary.DistantSound = Sound("galil.fire-distant")
SWEP.Primary.Damage = 28
SWEP.Primary.RPM = 500
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/assault_rifles/galil/galil_reload.wav'
SWEP.ReloadTime = 2.4

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 1.6
SWEP.Primary.KickDown = 0.28
SWEP.Primary.KickHorizontal = 0.35

SWEP.VisualRecoilHorizontal = 1.5
SWEP.VisualRecoilVertical = 3
SWEP.VisualRecoilRecoverRate = 7

SWEP.MuzzlePos = Vector(29.37, -0.66, 9.15)
SWEP.MuzzleAng = Angle(-11.15, 0.08, 0.00)
SWEP.AimPos = Vector(-3.00, -0.72, 5.63)
SWEP.AimAng = Angle(-10.50, -0.75, 0.00)

-- SWEP.Icon = octolib.icons.color('weapon_galil')
