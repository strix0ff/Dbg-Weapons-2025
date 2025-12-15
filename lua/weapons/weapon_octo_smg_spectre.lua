SWEP.Base = "weapon_octo_base_smg"
SWEP.Category = 'Доброград' .. ' - ПП'
SWEP.PrintName = "Spectre M4"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'smgs'

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/weapons/w_smg_spectrem4.mdl"
SWEP.Primary.Sound = Sound("spectre_m4.fire")
SWEP.Primary.DistantSound = Sound("spectre_m4.fire-distant")
SWEP.Primary.Damage = 9
SWEP.Primary.RPM = 500
SWEP.Primary.ClipSize = 50
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/smg/spectre_m4/spectre_m4_reload.wav'
SWEP.ReloadTime = 1.9

SWEP.Primary.Spread = 0.005
SWEP.Primary.KickUp = 1.42
SWEP.Primary.KickDown = 0.32
SWEP.Primary.KickHorizontal = 0.28

SWEP.VisualRecoilHorizontal = 0.55
SWEP.VisualRecoilVertical = 4
SWEP.VisualRecoilRecoverRate = 5

SWEP.MuzzlePos = Vector(14.25, -0.59, 6.95)
SWEP.MuzzleAng = Angle(-10.31, -357.97, 0.20)
SWEP.AimPos = Vector(-6.61, -1.27, 5.15)
SWEP.AimAng = Angle(-9.00, -357.97, 0.20)

SWEP.DefaultFireMode = 1
SWEP.FireModes = {'single'}
SWEP.BurstRPM = 500
SWEP.BurstAmount = 3
SWEP.BurstDelay = 0.3

SWEP.ActiveHoldType = "smg"
-- SWEP.Icon = octolib.icons.color('gun_smg')
