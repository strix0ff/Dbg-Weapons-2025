SWEP.Base = "weapon_octo_base_pistol"
SWEP.Category = 'Доброград' .. ' - Пистолеты'
SWEP.PrintName = "Hi-Point C-9"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'pistols'

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_pist_c9.mdl"
SWEP.Primary.Sound = Sound("hi-point_c-9.fire")
SWEP.Primary.DistantSound = Sound("hi-point_c-9.fire-distant")
SWEP.Primary.Damage = 16
SWEP.Primary.RPM = 265
SWEP.Primary.ClipSize = 8
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Distance = 1750

SWEP.ReloadSound = 'weapons-new/pistols/hi-point_c-9/hi-point_c-9_reload.wav'
SWEP.ReloadTime = 2.2

SWEP.Primary.Spread = 0.003
SWEP.Primary.KickUp = 2.68
SWEP.Primary.KickDown = 1.35
SWEP.Primary.KickHorizontal = 0.62

SWEP.VisualRecoilHorizontal = 2
SWEP.VisualRecoilVertical = 4
SWEP.VisualRecoilRecoverRate = 8

SWEP.MuzzlePos = Vector(4.21, 0.09, 4.00)
SWEP.MuzzleAng = Angle(-2.50, 4.77, 0.00)
SWEP.AimPos = Vector(-13.70, -1.42, 3.77)
SWEP.AimAng = Angle(-2.00, 4.5, 0.00)

SWEP.DefaultFireMode = 1
SWEP.FireModes = {'single'}

-- SWEP.Icon = octolib.icons.color('gun_pistol2')
