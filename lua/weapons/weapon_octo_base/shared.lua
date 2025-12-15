SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.MuzzleAttachment = "1"
SWEP.DrawCrosshair = false
SWEP.ViewModelFOV = 65
SWEP.ViewModelFlip = true
SWEP.Primary.Sound = Sound("")
SWEP.Primary.Cone = .2
SWEP.Primary.Recoil = 10
SWEP.Primary.Damage = 10
SWEP.Primary.Spread = .008
SWEP.Primary.NumShots = 1
SWEP.Primary.RPM = 60
SWEP.Primary.ClipSize = 0
SWEP.Primary.DefaultClip = 0
SWEP.Primary.KickUp = 0
SWEP.Primary.KickDown = 0
SWEP.Primary.KickHorizontal = 0
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"
SWEP.Secondary.ClipSize = 0
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.IronFOV = 0
SWEP.ReloadTime = 1
SWEP.ViewModel = "models/weapons/v_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.PassiveHoldType = "normal"
SWEP.ActiveHoldType = "pistol"
SWEP.SightZoomLevels = {1, 2, 3.25, 4}
SWEP.BurstRPM = 500
SWEP.BurstDelay = 1
SWEP.BurstAmount = 3
SWEP.DefaultFireMode = 1
SWEP.FlashlightPos = Vector()
SWEP.FlashlightAng = Angle()
SWEP.FlashlightHalo = 1
SWEP.ScopeReticleMaterial = "octoteam/shapes/circle-128.png"
SWEP.ScopeReticleSize = .15
SWEP.VisualRecoilHorizontal = 1
SWEP.VisualRecoilVertical = 4
SWEP.VisualRecoilRecoverRate = 4
SWEP.IsOctoWeapon = true
-- SWEP.Icon = "octoteam/icons/gun_pistol.png"
SWEP.IsLethal = true
SWEP.CanScare = true
SWEP.CanBend = true
SWEP.NoAmmoSound = "Weapon_AR2.Empty"
SWEP.BendAngles = {
    _default = {["ValveBiped.Bip01_Spine"] = Angle(15, 0, 0), ["ValveBiped.Bip01_Spine1"] = Angle(15, 0, 0)},
    ar2 = {["ValveBiped.Bip01_Spine"] = Angle(30, 30, 0), ["ValveBiped.Bip01_Spine1"] = Angle(-15, -15, 15)},
    smg = {["ValveBiped.Bip01_Spine"] = Angle(30, 30, 0), ["ValveBiped.Bip01_Spine1"] = Angle(-15, -15, 15)}
}
SWEP.MuzzlePosAngPerHoldType = {
    _default = {Vector(10, .65, 3.5), Angle(-2, 5, 0)},
    revolver = {Vector(8, .65, 4), Angle(-2, 5, 0)},
    pistol = {Vector(10, .25, 3.5), Angle(-2, 5, 0)},
    ar2 = {Vector(25, -1, 7.5), Angle(-9, 0, 0)},
    smg = {Vector(12, -1, 7.5), Angle(-9, 0, 0)},
    duel = {Vector(9, 1, 3.5), Angle(0, 11, 0)}
}

function SWEP:Initialize()
    self.__RANDOMIZE_AimPos__ = self.AimPos
    self.__RANDOMIZE_AimAng__ = self.AimAng
    self.AimPos = Vector(0, 0, 0)
    self.AimAng = Angle(180, 0, 0)
    self:SetReady(false)
    if SERVER then self:SetNWBool("CanSetReady", true) end
    self:OnInitialize()

end

function SWEP:MuzzleFlashCustom()
    if self.Silent or (self.SightPos and handview) then return end

    local effectData = EffectData()
    effectData:SetEntity(self)
    effectData:SetFlags(1)
    util.Effect('MuzzleFlash', effectData)
end

SWEP.OnInitialize = function()
end
function SWEP:ShootBullet()
    local t = self:GetOwner()
    local l, i, o = self.Primary.KickUp, self.Primary.KickDown, self.Primary.KickHorizontal
    local e = 2
    if t:Crouching() then
        e = e / 2
    end
    if t:InVehicle() then
        e = e * 2
    else
        e = e + t:GetVelocity():Length() / 80
    end
    e = e * (hook.Run("dbgWeapons.kickMultiplier", t, self) or 1)
    local n = self.Primary.Spread
    -- if self:GetNetVar("IsStockHidden") then
    --     e = e * 1.15
    --     n = n * 1.1
    -- end
    local r = t:GetNWInt("EffectAMT") > .8 and 1.25 or 1
    n = n * r
    local o = Angle(math.Rand(-i, -l) * e, math.Rand(-o, o) * e, 0) * r
    if CLIENT then
        local e = t:EyeAngles()
        e.p = e.p + (o.p / 2)
        e.y = e.y + (o.y / 2)
        t:SetEyeAngles(e)
    end
    self:TakePrimaryAmmo(1)
    self:ShootEffects()
    self.shotAt = os.time()
    local o, r = self:GetShootSounds()
    if CLIENT then
        t:EmitSound(o)
        if self.Primary.DistantSound then
            t:EmitSound(r)
        end
    else
        local e = RecipientFilter()
        e:AddAllPlayers()
        e:RemovePlayer(t)
        self:PlaySounds({o, r}, e)
    end
    if not self.NoMuzzleflash then
        t:MuzzleFlash()
    end
    local r = self.Primary.Damage
    local l = self.Primary.NumShots
    local i, o = self:GetShootPosAndDir()
    if self:CustomFireBullets(i, o) then
        return true
    end
    if SERVER then
        local e = {}
        e.Attacker = t
        e.Num = l
        e.Src = i
        e.Dir = o
        e.Spread = Vector(n, n, 0)
        e.Tracer = 3
        e.Force = r * .25
        e.Damage = r
        e.Distance = self.Primary.Distance
        e.Callback = function(o, n, l)
            local r = n.Entity
            if not IsValid(r) or r:GetClass() ~= "gmod_sent_vehicle_fphysics_base" then
                return self:BulletHitCallback(n, e)
            end
            local i = (n.HitPos - n.StartPos):GetNormalized()
            local o = {}
            o.start = n.HitPos - i * 5
            o.endpos = n.HitPos + i * 200
            o.filter = r
            local n = util.TraceLine(o).Entity
            if IsValid(n) and n:IsPlayer() then
                if
                    IsValid(n:GetVehicle()) and IsValid(n:GetVehicle():GetParent()) and
                        n:GetVehicle():GetParent().cdBulletproof
                 then
                    l:SetDamage(0)
                    return
                end
                e.Attacker = t
                e.Src = o.start
                e.Dir = i
                e.Spread = Vector()
                e.IgnoreEntity = r
                e.Callback = function(n, t)
                    return self:BulletHitCallback(t, e)
                end
                e.Distance = 200
                t:FireBullets(e)
            end
        end
        local n = t:GetVehicle()
        if IsValid(n) and IsValid(n:GetParent()) then
            e.IgnoreEntity = n:GetParent()
        end
        t:FireBullets(e)
    end
    return true
end

function SWEP:GetShootSounds()
    local t, e = self.Primary.Sound, self.Primary.DistantSound
    return t, e
end

function SWEP:PrimaryAttack()
    local e = CurTime()
    local firemode = self:GetNWString('firemode')

    if not IsFirstTimePredicted() or not self:CanFire() or
       (self.nextFire or 0) > e or self:GetNextPrimaryFire() > e or
       not self.FireModes[firemode] then return end

    if firemode == "single" then
        if self.nextFire and e < self.nextFire then
            return
        end
    end

    if self:Clip1() == 0 then
        self:EmitSound("Weapon_AR2.Empty")
        self.nextFire = e + 1
        self:SetNextPrimaryFire(self.nextFire)
        return
    end

    self.noAmmoSoundPlayed = nil
    self.nextFire = e + 1 / (self.Primary.RPM / 60)
    self:SetNextPrimaryFire(self.nextFire)
    self:ShootBullet()
    self:SetAnimation(PLAYER_ATTACK1)

    local endSound = self.ShootEndSound
    if isstring(endSound) then
        timer.Simple(self.ShootEndSoundDelay or 0, function()
            if not IsValid(self) then return end
            self:EmitSound(endSound, 50)
        end)
    end
end


function SWEP:CanFire()
    local owner = self:GetOwner()
    if not IsValid(owner) then return false end

    if self.ActiveHoldType == self.PassiveHoldType then
        return false
    end

    if not self:GetNWBool("CanSetReady") or not self:GetNWBool("IsReady") then return false end
    if CurTime() < self:GetNextPrimaryFire() then return false end
    if owner:GetNWInt("ScareState", 0) > 0.6 then return false end
    if owner:WaterLevel() == 3 then return false end

    return true
end


function SWEP:GetShootPosAndDir()
    local e = self.Owner
    local t = e:LookupAttachment("anim_attachment_rh")
    if t then
        local n = e:GetAttachment(t)
        local e, t = self.MuzzlePos, self.MuzzleAng
        if not e then
            local o = self.MuzzlePosAngPerHoldType
            if o[self.ActiveHoldType] then
                e, t = unpack(o[self.ActiveHoldType])
            else
                e, t = unpack(o._default)
            end
        end

        local t, e = LocalToWorld(e, t, n.Pos, n.Ang)
        return t, e:Forward(), e
    else
        return e:GetShootPos(), (e.viewAngs or e:EyeAngles()):Forward(), e.viewAngs
    end
end

function SWEP:GetDefaultMuzzlePos()
    local e = self:GetOwner()
    if not IsValid(e) then return end
    local e = e:GetAttachment(e:LookupAttachment("anim_attachment_rh"))
    if not e then return end
    local t, e = LocalToWorld(lpos, lang, e.Pos, e.Ang)
    return t, e
end

function SWEP:GetBulletSourcePos()
    if self.addPos or self.addAng then
        local e = self:GetOwner()
        if not IsValid(e) then return end
        local e = e:GetAttachment(e:LookupAttachment("anim_attachment_rh"))
        if e then
            local t, e = LocalToWorld(self.addPos or defaultlpos, self.addAng or defaultlang or angle_zero, e.Pos, e.Ang)
            return t, e
        end
    end

    local t, e = self:GetDefaultMuzzlePos()
    return t, e
end

function SWEP:Equip()
    self:SetReady(false)
    if self.ActiveHoldType == self.PassiveHoldType then
        self:SetNWBool("IsReady", false)
    end
end

function SWEP:Deploy()
    self:SetReady(false)
    if SERVER and self.DeploySound then self.Owner:EmitSound(self.DeploySound) end
    if self.ActiveHoldType == self.PassiveHoldType then
        self:SetNWBool("IsReady", false)
    end
    return true
end

function SWEP:SecondaryAttack()
end

function SWEP:BulletHitCallback(e, t)
    self:PlayImpactEffect(e)
end

function SWEP:CustomFireBullets(e, e)
end

function SWEP:Holster(e)
    if self.Owner:KeyDown(IN_ATTACK2) then return false end
    return true
end

local e = 1
function LerpAngleFT(t, n, r)
    return LerpAngle(math.min(t * e, 1), n, r)
end

function SWEP:BulletCallbackFunc(n, n, e, n, n, t, n, n)
    if e.MatType == MAT_FLESH then
        util.Decal("Blood", e.HitPos + e.HitNormal, e.HitPos - e.HitNormal)
        local t = e.HitPos
        local e = EffectData()
        e:SetOrigin(t)
        util.Effect("BloodImpact", e)
    end

    if self.NumBullet or 1 > 1 then return end
    if e.HitSky then return end
    if t then self:RicochetOrPenetrate(e) end
end

function SWEP:PlayImpactEffect(t)
    local e = EffectData()
    e:SetStart(t.StartPos)
    e:SetOrigin(t.HitPos)
    e:SetNormal(t.HitNormal)
    e:SetEntity(t.Entity)
    e:SetSurfaceProp(t.SurfaceProps)
    e:SetHitBox(t.HitBox)
    util.Effect("Impact", e, true, true)
end

-- hook.Add("PlayerSwitchWeapon", "dbg-scare", function(t, n, e) if t:GetNWInt("ScareState", 0) > .6 and IsValid(e) and e:GetClass() ~= "weapon_cuffed" then return true end end)
-- hook.Add("HUDPaint", "DisableCrosshair", function() return true end)