SWEP.Base = "weapon_octo_base_pistol"
SWEP.Category = 'Доброград' .. ' - Пистолеты'
SWEP.PrintName = "Taurus Judge"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'pistols'

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_pist_trb.mdl"
SWEP.Primary.Sound = Sound("taurus_judge.fire")
SWEP.Primary.DistantSound = Sound("taurus_judge.fire-distant")
SWEP.Primary.Damage = 39
SWEP.Primary.RPM = 125
SWEP.Primary.ClipSize = 6
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/pistols/taurus_judge/taurus_judge_reload.wav'
SWEP.ReloadTime = 2.8

SWEP.Primary.Spread = 0.001
SWEP.Primary.KickUp = 6.24
SWEP.Primary.KickDown = 2.22
SWEP.Primary.KickHorizontal = 2.52

SWEP.VisualRecoilHorizontal = 1.78
SWEP.VisualRecoilVertical = 16
SWEP.VisualRecoilRecoverRate = 3

SWEP.MuzzlePos = Vector(6.68, 0.33, 4.37)
SWEP.MuzzleAng = Angle(-3.20, 5.00, 4.00)
SWEP.AimPos = Vector(-13.70, -1.45, 4.85)
SWEP.AimAng = Angle(-1.5, 5.00, 4.00)

SWEP.DefaultFireMode = 1
SWEP.FireModes = {'single'}

-- SWEP.Icon = octolib.icons.color('gun_revolver')
