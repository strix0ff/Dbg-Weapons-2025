SWEP.Base = "weapon_octo_base_rifle"
SWEP.Category = 'Доброград' .. ' - Автоматы'
SWEP.PrintName = "HK G36"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'rifles'
SWEP.FireModes = {'single', 'auto', 'semi'}
SWEP.DefaultFireMode = 1

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_rif_g36.mdl"
SWEP.Primary.Sound = Sound("g36.fire")
SWEP.Primary.DistantSound = Sound("g36.fire-distant")
SWEP.Primary.Damage = 23
SWEP.Primary.RPM = 500
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/assault_rifles/hk_g36/hk_g36_reload.wav'
SWEP.ReloadTime = 2.5

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 1.87
SWEP.Primary.KickDown = 1.6
SWEP.Primary.KickHorizontal = 0.85

SWEP.VisualRecoilHorizontal = 1.5
SWEP.VisualRecoilVertical = 2
SWEP.VisualRecoilRecoverRate = 4

SWEP.MuzzlePos = Vector(10.61, -1.00, 7.50)
SWEP.MuzzleAng = Angle(-10.06, 0.00, 0.00)
SWEP.AimPos = Vector(-2.40, -1.00, 6.03)
SWEP.AimAng = Angle(-9.5, -0.15, 0.00)

-- SWEP.Icon = octolib.icons.color('gun_rifle')
