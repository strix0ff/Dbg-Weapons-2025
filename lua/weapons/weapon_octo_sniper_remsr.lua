SWEP.Base = "weapon_octo_base_zoom"
SWEP.Category = 'Доброград' .. ' - Снайперки'
SWEP.PrintName = "Remington MSR"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'snipers'
SWEP.Primary.Ammo = "sniper"
SWEP.DefaultFireMode = 1

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_snip_rmsr.mdl"
SWEP.Primary.Sound = Sound("remsr.fire")
SWEP.Primary.DistantSound = Sound("remsr.fire-distant")
SWEP.Primary.Damage = 69
SWEP.Primary.RPM = 25
SWEP.Primary.ClipSize = 10
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/sniper_rifles/remington_msr/remington_msr_reload.wav'
SWEP.ReloadTime = 3.4
SWEP.ShootEndSound = 'weapons-new/sniper_rifles/remington_msr/remington_msr_reload_shot.wav'
SWEP.ShootEndSoundDelay = 1
SWEP.NoAmmoSound = 'Weapon_AR2.Empty'

SWEP.Primary.Spread = 0
SWEP.Primary.KickUp = 7.79
SWEP.Primary.KickDown = 2.9
SWEP.Primary.KickHorizontal = 2.5

SWEP.VisualRecoilHorizontal = 5
SWEP.VisualRecoilVertical = 12
SWEP.VisualRecoilRecoverRate = 6

SWEP.MuzzlePos = Vector(32.02, -0.75, 10.50)
SWEP.MuzzleAng = Angle(-9.00, 0.00, 0.00)
SWEP.AimPos = Vector(-2.86, -0.71, 7.57)
SWEP.AimAng = Angle(-9.00, 0.00, 0.00)

SWEP.SightPos = Vector(-0.03, -0.71, 7.93)
SWEP.SightAng = Angle(0.00, -90.00, 100.00)
SWEP.SightSize = 1.6
SWEP.SightFOV = 12
SWEP.SightZoomLevels = {1, 2, 3.25, 4}

SWEP.FireModes = {'single'}

-- SWEP.Icon = octolib.icons.color('gun_sniper')
