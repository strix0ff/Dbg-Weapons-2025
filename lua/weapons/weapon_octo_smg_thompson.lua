SWEP.Base						= "weapon_octo_base_smg"
SWEP.Category					= 'Доброград' .. ' - ПП'
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.PrintName = "Томсон"
SWEP.WeaponGroup = 'smgs'
SWEP.FireModes = {'single', 'auto', 'semi'}
SWEP.DefaultFireMode = 1
if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel = "models/octoteam/weapons/w_rif_thompson.mdl"
SWEP.Primary.Sound = Sound("ump45.fire")
SWEP.Primary.DistantSound = Sound("ump45.fire-distant")
SWEP.Primary.Damage = 14
SWEP.Primary.RPM = 500
SWEP.Primary.ClipSize = 27
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/smg/thompson/thompson_reload.wav'
SWEP.ReloadTime = 2

SWEP.Primary.Spread = 0.003
SWEP.Primary.KickUp = 1.82
SWEP.Primary.KickDown = 0.5
SWEP.Primary.KickHorizontal = 0.75

SWEP.VisualRecoilHorizontal = 0.8
SWEP.VisualRecoilVertical = 3
SWEP.VisualRecoilRecoverRate = 2

SWEP.MuzzlePos = Vector(17.95, -1.08, 7.26)
SWEP.MuzzleAng = Angle(-10.60, -0.11, -186.20)
SWEP.AimPos = Vector(-7.00, -1.03, 3.83)
SWEP.AimAng = Angle(-9.50, -0.14, 0.20)

SWEP.BurstRPM = 1200
SWEP.BurstAmount = 3
SWEP.BurstDelay = 0.25

SWEP.FlashlightPos = Vector(15.03, -2.62, 6.70)
SWEP.FlashlightAng = Angle(0.00, 0.00, 0.00)

SWEP.PassiveHoldType = "passive"
SWEP.ActiveHoldType = "ar2"
-- SWEP.Icon = octolib.icons.color('gun_smg')