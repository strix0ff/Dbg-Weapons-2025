SWEP.Base = "weapon_octo_base_air"
SWEP.Category = 'Доброград'
SWEP.PrintName = "Bean Bag"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.WeaponGroup = 'shotguns'

if SERVER then
    AddCSLuaFile()
end

SWEP.WorldModel = "models/octoteam/weapons/w_shotgun_beanbag.mdl"
SWEP.Primary.Sound = Sound("beanbag.fire")
SWEP.Primary.Automatic = false
SWEP.Primary.Damage = 1
SWEP.Primary.RPM = 70
SWEP.Primary.ClipSize = 4
SWEP.Primary.DefaultClip = 0

SWEP.ReloadSound = 'weapons-new/shotguns/remington870/remington_870_pump_reload.wav'
SWEP.ReloadTime = 3
SWEP.ShootEndSound = 'weapons-new/shotguns/remington870/remington_870_pump_bf.wav'
SWEP.ShootEndSoundDelay = 1
SWEP.NoAmmoSound = 'Weapon_AR2.Empty'

SWEP.Primary.Spread = 0
SWEP.Primary.KickUp = 3.28
SWEP.Primary.KickDown = 2.3
SWEP.Primary.KickHorizontal = 0.56
SWEP.VisualRecoilHorizontal = 2
SWEP.VisualRecoilVertical = 4
SWEP.VisualRecoilRecoverRate = 6
SWEP.Primary.Distance = 850

SWEP.MuzzlePos = Vector(22.74, -0.97, 7.50)
SWEP.MuzzleAng = Angle(-12.37, 0.00, 0.00)
SWEP.AimPos = Vector(-1.48, -0.98, 4.22)
SWEP.AimAng = Angle(-10.96, 0.00, 0.00)

SWEP.Primary.NumShots = 1
-- SWEP.Icon = "octoteam/icons/gun_shotgun.png"

SWEP.DefaultFireMode = 1
SWEP.FireModes = {'single'}

SWEP.CanScare = true
SWEP.IsLethal = true
SWEP.WaveOnShot = false

if SERVER then
    function SWEP:BulletHitCallback(trace, bullet)
        local ent = trace.Entity
        if not IsValid(ent) or not ent:IsPlayer() then return end
        ent.beanbagEffect = (ent.beanbagEffect or 0) + 1

        if ent.beanbagEffect == 1 then
            -- ent:MoveModifier('stunstick', {
            --     walkmul = 0.1,
            --     norun = true,
            --     nojump = true,
            -- })
            timer.Create('stunstick' .. ent:EntIndex(), 5, 1, function()
                if not IsValid(ent) then return end
                -- ent:MoveModifier('stunstick', nil)
            end)
        -- elseif ent.beanbagEffect == 2 then
        --     dbgDamage.damageHands(ent, 100, self:GetOwner())
        -- else
        --     dbgDamage.startDying(ent)
        -- end
        end
    end

    timer.Create('dbg-weps.resetEffects', 60, 0, function()
        for _, v in ipairs(player.GetAll()) do
            if v.beanbagEffect then
                v.beanbagEffect = v.beanbagEffect - 1
                if v.beanbagEffect <= 0 then
                    v.beanbagEffect = nil
                end
            end
        end
    end)
end
