SWEP.Base = "weapon_octo_base_pistol"
SWEP.Category = 'Доброград' .. ' - Пистолеты'
SWEP.PrintName = "Colt Python"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'pistols'

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/weapons/w_pist_python.mdl"
SWEP.Primary.Sound = Sound("python.fire")
SWEP.Primary.DistantSound = Sound("python.fire-distant")
SWEP.Primary.Damage = 34
SWEP.Primary.RPM = 150
SWEP.Primary.ClipSize = 6
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/pistols/colt_python/colt_python_reload.wav'
SWEP.ReloadTime = 2.5

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 5.54
SWEP.Primary.KickDown = 2.11
SWEP.Primary.KickHorizontal = 1.5

SWEP.VisualRecoilHorizontal = 1
SWEP.VisualRecoilVertical = 13
SWEP.VisualRecoilRecoverRate = 2

SWEP.MuzzlePos = Vector(5.05, 0.14, 4.26)
SWEP.MuzzleAng = Angle(-4.20, 4.94, 4.00)
SWEP.AimPos = Vector(-13.70, -1.51, 3.75)
SWEP.AimAng = Angle(-3.5, 4.90, 4.00)

SWEP.DefaultFireMode = 1
SWEP.FireModes = {'single'}

-- SWEP.Icon = octolib.icons.color('gun_revolver')
