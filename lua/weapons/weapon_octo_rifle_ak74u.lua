SWEP.Base = "weapon_octo_base_rifle"
SWEP.Category = 'Доброград' .. ' - Автоматы'
SWEP.PrintName = "AK-74у"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'rifles'
SWEP.FireModes = {'single', 'auto', 'semi'}
SWEP.DefaultFireMode = 1

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_rif_aks74u.mdl"
SWEP.Primary.Sound = Sound("ak74u.fire")
SWEP.Primary.DistantSound = Sound("ak74u.fire-distant")
SWEP.Primary.Damage = 19
SWEP.Primary.RPM = 500
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/assault_rifles/ak_74u/ak_74u_reload.wav'
SWEP.ReloadTime = 2.5

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 2.19
SWEP.Primary.KickDown = 1.21
SWEP.Primary.KickHorizontal = 0.89

SWEP.VisualRecoilHorizontal = 1
SWEP.VisualRecoilVertical = 4
SWEP.VisualRecoilRecoverRate = 4

SWEP.MuzzlePos = Vector(20.70, -0.90, 6.47)
SWEP.MuzzleAng = Angle(-10.08, -0.04, 0.00)
SWEP.AimPos = Vector(-3.77, -0.85, 5.01)
SWEP.AimAng = Angle(-8.5, 0.00, 0.00)

SWEP.HasStock = true

-- SWEP.Icon = octolib.icons.color('weapon_ak47')
