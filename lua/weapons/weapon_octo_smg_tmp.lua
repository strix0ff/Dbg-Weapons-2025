SWEP.Base = "weapon_octo_base_smg"
SWEP.Category = 'Доброград' .. ' - ПП'
SWEP.PrintName = "TMP"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'smgs'
SWEP.FireModes = {'single', 'auto', 'semi'}
SWEP.DefaultFireMode = 1

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_smg_tmp.mdl"
SWEP.Primary.Sound = Sound("tmp.fire")
SWEP.Primary.DistantSound = Sound("tmp.fire-distant")
SWEP.Primary.Damage = 18
SWEP.Primary.RPM = 500
SWEP.Primary.ClipSize = 32
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/smg/tmp/tmp_reload.wav'
SWEP.ReloadTime = 2

SWEP.Primary.Spread = 0.02
SWEP.Primary.KickUp = 0.92
SWEP.Primary.KickDown = 0.5
SWEP.Primary.KickHorizontal = 0.35

SWEP.VisualRecoilHorizontal = 0.75
SWEP.VisualRecoilVertical = 1.52
SWEP.VisualRecoilRecoverRate = 4

SWEP.MuzzlePos = Vector(10.75, -0.53, 4.64)
SWEP.MuzzleAng = Angle(-11.34, 2.08, 0.00)
SWEP.AimPos = Vector(-6.45, -1.18, 3.13)
SWEP.AimAng = Angle(-10.00, 2.08, 0.00)

SWEP.PassiveHoldType = "normal"
SWEP.ActiveHoldType = "pistol"
-- SWEP.Icon = octolib.icons.color('weapon_tmp')

SWEP.NoAmmoSound = 'Weapon_AR2.Empty'
SWEP.FlashlightPos = Vector(9.58, -0.60, 1.84)
SWEP.FlashlightAng = Angle(0.00, 0.00, 0.00)
SWEP.FlashlightHalo = 1.15
