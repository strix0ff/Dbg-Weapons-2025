SWEP.Base = "weapon_octo_base_zoom"
SWEP.Category = 'Доброград' .. ' - Автоматы'
SWEP.PrintName = "SG552"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'rifles'
SWEP.FireModes = {'single', 'auto', 'semi'}
SWEP.DefaultFireMode = 1

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_rif_sg552acog.mdl"
SWEP.Primary.Sound = Sound("sg552.fire")
SWEP.Primary.DistantSound = Sound("sg552.fire-distant")
SWEP.Primary.Damage = 27
SWEP.Primary.RPM = 500
SWEP.Primary.ClipSize = 20
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/assault_rifles/sg552_acog/sg552_acog_reload.wav'
SWEP.ReloadTime = 2.6

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 1
SWEP.Primary.KickDown = 0.55
SWEP.Primary.KickHorizontal = 0.9

SWEP.VisualRecoilHorizontal = 1
SWEP.VisualRecoilVertical = 4
SWEP.VisualRecoilRecoverRate = 5

SWEP.MuzzlePos = Vector(22.02, -1.00, 7.80)
SWEP.MuzzleAng = Angle(-9.00, -0.20, 0.00)
SWEP.AimPos = Vector(-2.82, -0.89, 7.62)
SWEP.AimAng = Angle(-5.00, -0.30, 0.00)

SWEP.SightPos = Vector(1.50, -0.92, 7.98)
SWEP.SightAng = Angle(0.00, -90.00, 100.00)
SWEP.SightSize = 1.4
SWEP.SightFOV = 18
SWEP.SightZoomLevels = {1.25, 2, 2.5}

SWEP.FireModes = {'single', 'auto'}
SWEP.DefaultFireMode = 1

-- SWEP.Icon = octolib.icons.color('weapon_sg552')
