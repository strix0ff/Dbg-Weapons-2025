SWEP.Base = "weapon_octo_base_sniper"
SWEP.Category = 'Доброград' .. ' - Снайперки'
SWEP.PrintName = "SG550"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'snipers'
SWEP.Primary.Ammo = "sniper"
SWEP.DefaultFireMode = 1

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_snip_sg550.mdl"
SWEP.Primary.Sound = Sound("sg550.fire")
SWEP.Primary.DistantSound = Sound("sg550.fire-distant")
SWEP.Primary.Damage = 52
SWEP.Primary.RPM = 400
SWEP.Primary.ClipSize = 15
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/sniper_rifles/sg550/sg550_reload.wav'
SWEP.ReloadTime = 3.4

SWEP.Primary.Spread = 0
SWEP.Primary.KickUp = 1.27
SWEP.Primary.KickDown = 0.89
SWEP.Primary.KickHorizontal = 0.93

SWEP.VisualRecoilHorizontal = 2
SWEP.VisualRecoilVertical = 6
SWEP.VisualRecoilRecoverRate = 3

SWEP.MuzzlePos = Vector(28.79, -0.78, 7.95)
SWEP.MuzzleAng = Angle(-9.00, 0.00, 0.00)
SWEP.AimPos = Vector(-4.08, -0.79, 5.20)
SWEP.AimAng = Angle(-9.00, 0.00, 0.00)

SWEP.SightPos = Vector(-1.86, -0.79, 5.50)
SWEP.SightAng = Angle(0.00, -90.00, 100.00)
SWEP.SightSize = 1.217
SWEP.SightFOV = 12
SWEP.SightZoomLevels = {1, 2, 3.25, 4}

SWEP.FireModes = {'single', 'auto'}

-- SWEP.Icon = octolib.icons.color('weapon_sg550')
