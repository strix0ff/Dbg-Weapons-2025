SWEP.Base = "weapon_octo_base_rifle"
SWEP.Category = 'Доброград' .. ' - Автоматы'
SWEP.PrintName = "FAMAS"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'rifles'
SWEP.FireModes = {'single', 'auto', 'semi'}
SWEP.DefaultFireMode = 1

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_rif_famas.mdl"
SWEP.Primary.Sound = Sound("famas.fire")
SWEP.Primary.DistantSound = Sound("famas.fire-distant")
SWEP.Primary.Damage = 22
SWEP.Primary.RPM = 500
SWEP.Primary.ClipSize = 25
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/assault_rifles/famas/famas_reload.wav'
SWEP.ReloadTime = 2.5

SWEP.Primary.Spread = 0.004
SWEP.Primary.KickUp = 2
SWEP.Primary.KickDown = 1.05
SWEP.Primary.KickHorizontal = 0.5

SWEP.VisualRecoilHorizontal = 0.7
SWEP.VisualRecoilVertical = 3
SWEP.VisualRecoilRecoverRate = 4

SWEP.MuzzlePos = Vector(16.26, -1.00, 6.49)
SWEP.MuzzleAng = Angle(-10.00, 0.00, 0.00)
SWEP.AimPos = Vector(-4.59, -1.04, 6.62)
SWEP.AimAng = Angle(-9.50, 0.00, 0.00)

-- SWEP.Icon = octolib.icons.color('weapon_famas')
