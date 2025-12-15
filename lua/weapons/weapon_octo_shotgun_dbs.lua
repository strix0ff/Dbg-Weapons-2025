SWEP.Base						= "weapon_octo_base_shotgun"
SWEP.Category					= 'Доброград' .. ' - Дробовики'
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.PrintName						= "Обрез"
SWEP.WeaponGroup = 'shotguns'

if SERVER then

	AddCSLuaFile()

end

SWEP.WorldModel					= "models/octoteam/weapons/db_short.mdl"
SWEP.Primary.Sound 				= Sound( "dbs.fire" )
SWEP.Primary.DistantSound 		= Sound( "dbs.fire-distant" )
SWEP.Primary.Damage				= 12
SWEP.Primary.RPM				= 150
SWEP.Primary.ClipSize			= 2
SWEP.Primary.MaxStoredAmmo		= 16
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/shotguns/double_barrel/double_barrel_reload.wav'
SWEP.ReloadTime = 3
SWEP.NoAmmoSound = 'Weapon_AR2.Empty'

SWEP.Primary.Spread = 0.15
SWEP.Primary.KickUp = 6.842
SWEP.Primary.KickDown = 5.305
SWEP.Primary.KickHorizontal = 3.974

SWEP.VisualRecoilHorizontal = 5
SWEP.VisualRecoilVertical = 15
SWEP.VisualRecoilRecoverRate = 2
SWEP.Primary.Distance = 1050

SWEP.MuzzlePos = Vector(13.79, -0.99, 6.06)
SWEP.MuzzleAng = Angle(-9.42, 0.07, 0.00)
SWEP.AimPos = Vector(-3.52, -0.89, 4.39)
SWEP.AimAng = Angle(-9.42, -0.50, 0.00)

SWEP.DefaultFireMode = 1
SWEP.FireModes = {'single'}

SWEP.Primary.NumShots			= 8
-- SWEP.Icon = octolib.icons.color('gun_shotgun')