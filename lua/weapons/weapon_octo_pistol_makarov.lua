SWEP.Base = "weapon_octo_base_pistol"
SWEP.Category = 'Доброград' .. ' - Пистолеты'
SWEP.PrintName = "Makarov"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'pistols'

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/weapons/w_pist_pm.mdl"
SWEP.Primary.Sound = Sound("pm.fire")
SWEP.Primary.DistantSound = Sound("pm.fire-distant")
SWEP.Primary.Damage = 23
SWEP.Primary.RPM = 245
SWEP.Primary.ClipSize = 8
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Distance = 1850

SWEP.ReloadSound = 'weapons-new/pistols/makarov/makarov_reload.wav'
SWEP.ReloadTime = 2.6

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 4.2
SWEP.Primary.KickDown = 1.15
SWEP.Primary.KickHorizontal = 0.68

SWEP.VisualRecoilHorizontal = 0.8
SWEP.VisualRecoilVertical = 8
SWEP.VisualRecoilRecoverRate = 3.5

SWEP.MuzzlePos = Vector(4.04, 0.14, 3.85)
SWEP.MuzzleAng = Angle(-2.68, 5.00, 0.00)
SWEP.AimPos = Vector(-13.70, -1.42, 3.53)
SWEP.AimAng = Angle(-2.50, 5.00, 0.00)

SWEP.DefaultFireMode = 1
SWEP.FireModes = {'single'}

-- SWEP.Icon = octolib.icons.color('gun_pistol2')
