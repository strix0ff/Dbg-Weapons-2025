SWEP.Base = "weapon_octo_base_zoom"
SWEP.Category = 'Доброград' .. ' - Снайперки'
SWEP.PrintName = "SVD"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'snipers'
SWEP.Primary.Ammo = "sniper"
SWEP.DefaultFireMode = 1

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/weapons/w_snip_svd.mdl"
SWEP.Primary.Sound = Sound("svd.fire")
SWEP.Primary.DistantSound = Sound("svd.fire-distant")
SWEP.Primary.Damage = 65
SWEP.Primary.RPM = 150
SWEP.Primary.ClipSize = 10
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/sniper_rifles/svd/svd_reload.wav'
SWEP.ReloadTime = 3.5

SWEP.Primary.Spread = 0
SWEP.Primary.KickUp = 8.13
SWEP.Primary.KickDown = 2.3
SWEP.Primary.KickHorizontal = 1.53

SWEP.VisualRecoilHorizontal = 4
SWEP.VisualRecoilVertical = 12
SWEP.VisualRecoilRecoverRate = 5

SWEP.MuzzlePos = Vector(35.25, -1.00, 9.93)
SWEP.MuzzleAng = Angle(-9.00, 0.30, 0.00)
SWEP.AimPos = Vector(-3.35, -1.18, 6.31)
SWEP.AimAng = Angle(-9.00, 0.00, 0.00)

SWEP.SightPos = Vector(-0.90, -1.09, 6.56)
SWEP.SightAng = Angle(0.00, -90.00, 100.00)
SWEP.SightSize = 1.6
SWEP.SightFOV = 12
SWEP.SightZoomLevels = {1, 2, 3, 3.5}
SWEP.DefaultFireMode = 2
SWEP.FireModes = {'single', 'auto'}
SWEP.DefaultFireMode = 1

-- SWEP.Icon = octolib.icons.color('gun_sniper')
