SWEP.Base = "weapon_octo_base_sniper"
SWEP.Category = 'Доброград' .. ' - Снайперки'
SWEP.PrintName = "AWM"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'snipers'
SWEP.Primary.Ammo = "sniper"

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_snip_awm.mdl"
SWEP.Primary.Sound = Sound("awm.fire")
SWEP.Primary.DistantSound = Sound("awm.fire-distant")
SWEP.Primary.Damage = 77
SWEP.Primary.RPM = 50
SWEP.Primary.ClipSize = 5
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/sniper_rifles/awm/awm_reload.wav'
SWEP.ReloadTime = 3.5

SWEP.Primary.Spread = 0
SWEP.Primary.KickUp = 6.7
SWEP.Primary.KickDown = 1.2
SWEP.Primary.KickHorizontal = 0.62

SWEP.VisualRecoilHorizontal = 8
SWEP.VisualRecoilVertical = 12
SWEP.VisualRecoilRecoverRate = 4

SWEP.MuzzlePos = Vector(39.52, -0.78, 11.40)
SWEP.MuzzleAng = Angle(-10.16, 0.00, 0.00)
SWEP.AimPos = Vector(-3.86, -0.74, 6.36)
SWEP.AimAng = Angle(-10.16, 0.00, 0.00)

SWEP.SightPos = Vector(-0.87, -0.74, 6.82)
SWEP.SightAng = Angle(0.00, -90.00, 100.00)
SWEP.SightSize = 2
SWEP.SightFOV = 25
SWEP.SightZNear = 12
SWEP.SightZoomLevels = {1, 2, 3.25}

SWEP.FireModes = {'single', 'auto'}
SWEP.DefaultFireMode = 2

-- SWEP.Icon = octolib.icons.color('weapon_awp')
