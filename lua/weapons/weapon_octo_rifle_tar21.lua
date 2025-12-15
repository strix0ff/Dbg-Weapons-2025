SWEP.Base = "weapon_octo_base_rifle"
SWEP.Category = 'Доброград' .. ' - Автоматы'
SWEP.PrintName = "TAR-21"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'rifles'

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/tar21/w_rif_tar21.mdl"
SWEP.Primary.Sound = Sound("tar21.fire")
SWEP.Primary.DistantSound = Sound("tar21.fire-distant")
SWEP.Primary.Damage = 25
SWEP.Primary.RPM = 500
SWEP.Primary.ClipSize = 20
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/assault_rifles/tar_21/tar_21_reload.wav'
SWEP.ReloadTime = 2.45

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 1.69
SWEP.Primary.KickDown = 1.2
SWEP.Primary.KickHorizontal = 0.8

SWEP.VisualRecoilHorizontal = 1.7
SWEP.VisualRecoilVertical = 4
SWEP.VisualRecoilRecoverRate = 8

SWEP.MuzzlePos = Vector(17.42, -1.00, 6.85)
SWEP.MuzzleAng = Angle(-11.17, 0.00, 0.00)
SWEP.AimPos = Vector(-6.70, -0.97, 6.40)
SWEP.AimAng = Angle(-10.00, 0.00, 0.00)

SWEP.FireModes = {'single', 'auto'}
SWEP.DefaultFireMode = 1

-- SWEP.Icon = octolib.icons.color('gun_rifle')
