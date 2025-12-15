octolib = octolib or {}
octolib.math = octolib.math or {}

include "shared.lua"
SWEP.PrintName = "Octothorp Weapon"
SWEP.Slot = 3
SWEP.SlotPos = 1
SWEP.DrawAmmo = true
SWEP.DrawWeaponInfoBox = false
SWEP.BounceWeaponIcon = false
SWEP.VisualRecoilState = Vector()
SWEP.TriggerFingerAnimation = 0
SWEP.SmoothAimAng = nil
CreateClientConVar("octoweapons_sight_resolution", 512, true)
local n = {}
local t, e, i, a
local s = Material("octoteam/overlays/scope1")
local function o()
    e = GetConVar("octoweapons_sight_resolution"):GetInt()
    i = GetRenderTarget("weaponSight-" .. e, e, e)
    if not n[e] then
        n[e] = CreateMaterial("weaponSight-" .. e, "UnlitGeneric", {})
    end
    a = n[e]
    t = {}
    local l, a, n, e = 0, 0, e / 2 - 1, 24
    t[#t + 1] = {x = l, y = a, u = .5, v = .5}
    for o = 0, e do
        local e = math.rad((o / e) * -360)
        t[#t + 1] = {
            x = l + math.sin(e) * n,
            y = a + math.cos(e) * n,
            u = math.sin(e) / 2 + .5,
            v = math.cos(e) / 2 + .5
        }
    end
end
o()
cvars.AddChangeCallback("octoweapons_sight_resolution", o, "octoweapons")
local l = false
local function c(e)
    l = true
    local n, t, a = e:GetShootPosAndDir()
    render.PushRenderTarget(i)
    if util.TraceLine({start = n - t * 15, endpos = n + t * ((e.SightZNear or 5) + 2), filter = LocalPlayer()}).Hit then
        render.Clear(0, 0, 0, 255)
    else
        render.RenderView({origin = n, angles = a, fov = e.SightFOV, znear = e.SightZNear})
    end
    render.PopRenderTarget()
    l = false
end

function SWEP:SetReady(e)
    if not self:GetNWBool("CanSetReady") then
        return
    end
    if e and not self.Owner:IsOnGround() then
        return
    end
    self.DrawCrosshair = e
end
local function translateFiremode(num)
	return (num == 1 and false) or (num == 2 and true)
end

function SWEP:Think()
	if translateFiremode(self:GetNWString('firemode')) ~= self.Primary.Automatic then
		self.Primary.Automatic = translateFiremode(self:GetNWString('firemode'))
	end
	-- if self:GetNetVar('NoReadyInput') then return end
	if self.Owner:KeyDown(IN_ATTACK2) and not self:GetNWBool('IsReady') then
		self:SetReady(true)
	elseif not self.Owner:KeyDown(IN_ATTACK2) and self:GetNWBool('IsReady') then
		self:SetReady(false)
	end

end

local n = 0
local d = 1.2
local u = .1
local p = 1.2
local r = false
local h = 0
local o = false
local function S()
    local e = LocalPlayer()
    local t = e:GetActiveWeapon()
    if dbgView.useSights and t.SightPos then return end
    if not IsValid(t) or not t:GetNWBool("IsReady") then
        r = false
        h = 0
        o = false
        n = 0
        return
    end

    if r then
        for t, n in pairs({"ValveBiped.Bip01_Spine", "ValveBiped.Bip01_Spine1", "ValveBiped.Bip01_Spine2", "ValveBiped.Bip01_Spine4"}) do
            e:ManipulateBoneAngles(e:LookupBone(n), Angle(0, 0, 0))
        end
    else
        if not o then
            n = 0
            o = true
        end

        n = n + d * FrameTime()
        local a = math.sin(n) * .3 + .3
        local t = math.sin(n * p) * u
        local t = {
            ["ValveBiped.Bip01_Spine"] = Angle(t, 0, a * -2),
            ["ValveBiped.Bip01_Spine1"] = Angle(t, 0, a * 1),
            ["ValveBiped.Bip01_Spine2"] = Angle(t, 0, a * -1),
            ["ValveBiped.Bip01_Spine4"] = Angle(t, 0, a * 1)
        }

        local o = math.min(n / 2, 1)
        for t, a in pairs(t) do
            local n = Angle(0, 0, 0)
            local a = a
            local n = LerpAngle(o, n, a)
            e:ManipulateBoneAngles(e:LookupBone(t), n)
        end
    end
end

function SWEP:CalcView(a, i, o, l)
    self:UpdateVisualRecoil(a)
    self:UpdateTriggerFinger(a)
    if not self.__RANDOMIZE_AimPos__ then return end
    local e = dbgView.useSights and self:GetHoldType() == self.ActiveHoldType and self:GetNWBool("IsReady")
    local n = math.Approach(self.aimProgress or 0, e and 1 or 0, FrameTime() * (e and 1 or 3))
    self.aimProgress = n
    if n <= 0 then return end
    local t = a:LookupAttachment("anim_attachment_rh")
    if not t then return end
    if e then n = math.Clamp(n - .4, 0, 1) / .6 end
    local e = dbgView.calcView(a, i, o, l)
    local a = a:GetAttachment(t)
    local t = Angle(self.VisualRecoilState.y, self.VisualRecoilState.x, 0)
    local t, a = LocalToWorld(self.__RANDOMIZE_AimPos__, self.__RANDOMIZE_AimAng__, a.Pos, a.Ang + t)
    local n = octolib.tween.easing.inOutQuad(n, 0, 1, 1)
    e.origin = LerpVector(n, e.origin, t)
    e.angles = LerpAngle(n, e.angles, a) + dbgView.lookOff
    e.znear = .5
    e.angles.r = 0
    return e
end

function SWEP:DrawWorldModel()
    self:DrawModel()
    if self.SightPos and self.aimProgress and self.aimProgress > 0 then
        local n = self:GetOwner()
        local o = n:LookupAttachment("anim_attachment_rh")
        if not o then return end
        local n = n:GetAttachment(o)
        local l, o = LocalToWorld(self.SightPos, self.SightAng, n.Pos, n.Ang)
        local n = e / -2
        cam.Start3D2D(l, o, self.SightSize / e)
        cam.IgnoreZ(true)
        render.ClearStencil()
        render.SetStencilEnable(true)
        render.SetStencilTestMask(255)
        render.SetStencilWriteMask(255)
        render.SetStencilReferenceValue(42)
        render.SetStencilCompareFunction(STENCIL_ALWAYS)
        render.SetStencilFailOperation(STENCIL_KEEP)
        render.SetStencilPassOperation(STENCIL_REPLACE)
        render.SetStencilZFailOperation(STENCIL_KEEP)
        surface.SetDrawColor(0, 0, 0, 1)
        draw.NoTexture()
        surface.DrawPoly(t)
        render.SetStencilCompareFunction(STENCIL_EQUAL)
        render.SetStencilFailOperation(STENCIL_ZERO)
        render.SetStencilZFailOperation(STENCIL_ZERO)
        a:SetTexture("$basetexture", i)
        a:SetFloat("$alpha", math.Clamp(math.Remap(self.aimProgress, .6, 1, 0, 1), 0, 1))
        surface.SetMaterial(a)
        surface.DrawTexturedRect(n, n, e, e)
        surface.SetDrawColor(255, 255, 255)
        surface.SetMaterial(s)
        surface.DrawTexturedRect(n, n, e, e)
        render.SetStencilEnable(false)
        cam.IgnoreZ(false)
        cam.End3D2D()
    end
end

function SWEP:DrawWorldModelTranslucent()
    local n = self:GetOwner()
    local e = self.csEnt
    local t = self:GetNetVar('bodygroups')
    if t and not IsValid(e) then
        e = ClientsideModel(self.WorldModel)
        e:SetNoDraw(true)
        e:SetupBones()
        e:SetParent(n)
        e:AddEffects(EF_BONEMERGE)
        for n, t in pairs(t) do
            e:SetBodygroup(e:FindBodygroupByName(n), t)
        end

        hook.Add('Think', e, function()
            if IsValid(self) and IsValid(n) and n:GetActiveWeapon() == self then
                if e:GetParent() ~= n then e:SetParent(n) end
                return
            end

            e:Remove()
        end)

        self.csEnt = e
    end

    if IsValid(e) then
        hook.Run('dbgWeapons.preDrawWeapon', self, e)
        e:DrawModel()
        if self.SightPos and self.SightAng and (self.aimProgress or 0) > 0 then dbgWeapons.renderScope(self) end
    end

    if n ~= LocalPlayer() and IsValid(n) then
        self:UpdateVisualRecoil(n)
        self:UpdateTriggerFinger(n)
    end
end

function octolib.math.lerpVector(src, tgt, fraction, min, max)
	if src == tgt then return src end
	local diff = tgt - src
	local len = diff:Length()
	local dist = len * fraction
	if min then dist = math.max(dist, min) end
	if max then dist = math.min(dist, max) end
	dist = math.min(len, dist)

	return src + diff:GetNormalized() * dist
end

function SWEP:UpdateVisualRecoil(e)
    local n = self:GetOwner()
    local e = self.VisualRecoilState:Length2D()
    if e == 0 then return end
    local e = FrameTime() * self.VisualRecoilRecoverRate * math.max(e * 2, .1)
    self.VisualRecoilState = octolib.math.lerpVector(self.VisualRecoilState, vector_origin, 1, nil, e)
    if self.VisualRecoilState:Length2D() < .01 then self.VisualRecoilState:SetUnpacked(0, 0, 0) end
    n:ManipulateBoneAngles(n:LookupBone("ValveBiped.Bip01_R_Hand"), Angle(self.VisualRecoilState.y, self.VisualRecoilState.x, 0), false)
	n:ManipulateBonePosition(n:LookupBone("ValveBiped.Bip01_R_Clavicle"), Vector(0, math.min(self.VisualRecoilState.y, 8) * -0.25, 0), false)
end

function SWEP:UpdateTriggerFinger(e)
    local e = self:GetOwner()
    if self.TriggerFingerAnimation == 0 then return end
    self.TriggerFingerAnimation = math.Approach(self.TriggerFingerAnimation, 0, FrameTime() / .2)
    local n = octolib.tween.easing.outQuad(self.TriggerFingerAnimation, 0, 1, 1)
    e:ManipulateBoneAngles(e:LookupBone("ValveBiped.Bip01_R_Finger11"), Angle(0, n * -40, 0), false)
end

function SWEP:ResetBones()
    local e = self:GetOwner()
    if not IsValid(e) then return end
    e:ManipulateBonePosition(e:LookupBone("ValveBiped.Bip01_R_Clavicle"), vector_origin)
    e:ManipulateBoneAngles(e:LookupBone("ValveBiped.Bip01_R_Hand"), angle_zero)
    e:ManipulateBoneAngles(e:LookupBone("ValveBiped.Bip01_R_Finger11"), angle_zero)
end

net.Receive('octoweapons.muzzleanimation', function()
	local wep = net.ReadEntity()
	if not IsValid(wep) then return end

	local dlight = DynamicLight(wep:EntIndex())
	if dlight then
		dlight.pos = wep:GetShootPos()
		dlight.r = 255
		dlight.g = 145
		dlight.b = 10
		dlight.brightness = 1
		dlight.decay = 5000
		dlight.size = 200
		dlight.dietime = CurTime() + 0.2
		dlight.nomodel = true
	end
end)

function SWEP:ShootEffects()
    self.VisualRecoilState.x = self.VisualRecoilState.x + self.VisualRecoilHorizontal * math.Rand(-1, 1)
    self.VisualRecoilState.y = self.VisualRecoilState.y + self.VisualRecoilVertical * math.Rand(.8, 1.2)
    self.TriggerFingerAnimation = 1
    local e = EffectData()
    e:SetEntity(self)
    e:SetAttachment(self:LookupAttachment("muzzle"))
    e:SetScale(.1)
    e:SetFlags(self.MuzzleflashFlag or 3)
    util.Effect("MuzzleFlash", e)
end

function SWEP:Reload()
end
net.Receive("octoweapons.recoil", function()
    local wep = net.ReadEntity()
    local ply = net.ReadEntity()
    if not IsValid(ply) or ply == LocalPlayer() then return end
    if not wep.VisualRecoilState then return end
        
    wep.VisualRecoilState.x = wep.VisualRecoilState.x + wep.VisualRecoilHorizontal * math.Rand(-1, 1)
    wep.VisualRecoilState.y = wep.VisualRecoilState.y + wep.VisualRecoilVertical * math.Rand(0.8, 1.2)
    wep.TriggerFingerAnimation = 1
        
    wep:UpdateVisualRecoil(ply)
    wep:UpdateTriggerFinger(ply)
        
    timer.Simple(0.04, function()
        if IsValid(wep) and IsValid(ply) then
            wep:ResetBones()
        end
    end)
end)

net.Receive("octoweapons.sound", function(e, e)
    local n = net.ReadUInt(5)
    local e = net.ReadVector()
    for n = 1, n do
        sound.Play(net.ReadString(), e)
    end
end)

hook.Add("CreateMove", "octoweapons", function(e)
    local n = LocalPlayer():GetActiveWeapon()
    if IsValid(n) and n:GetNWBool("IsReady") and bit.band(e:GetButtons(), IN_JUMP) > 0 then e:SetButtons(e:GetButtons() - IN_JUMP) end
end)

hook.Add("HUDPaint", "dbg-scare", function()
    local e = LocalPlayer()
    local e = e:GetNWInt("ScareState", 0)
    if e > 0 then draw.RoundedBox(0, -1, -1, ScrW() + 2, ScrH() + 2, Color(0, 0, 0, 180 * e)) end
end)

hook.Add("PreDrawEffects", "octoweapons", function()
    if l then return end
    local e = LocalPlayer():GetActiveWeapon()
    if IsValid(e) and e.SightPos and (e.aimProgress or 0) > 0 then c(e) end
end)

hook.Add("dbg-view.chTraceOverride", "octoweapons", function()
    local e = LocalPlayer():GetActiveWeapon()
    if not IsValid(e) or not e.IsOctoWeapon then return end
    local e, n = e:GetShootPosAndDir()
    return util.TraceLine({
        start = e,
        endpos = e + n * 2e3,
        filter = function(e) return e ~= ply and e:GetRenderMode() ~= RENDERMODE_TRANSALPHA end
    })
end)

hook.Add("dbg-view.chShouldDraw", "octoweapons", function(e)
    local e = LocalPlayer():GetActiveWeapon()
    if IsValid(e) and e.__RANDOMIZE_AimPos__ then return false end
end)


local function requestBend(doBend)
	local wep = LocalPlayer():GetActiveWeapon()
	if not IsValid(wep) or not wep.CanBend or not wep:GetNWBool('IsReady') then return end

	net.Start('octoweapons.bend')
		net.WriteBool(doBend)
	net.SendToServer()
end

local e = 0
timer.Simple(0, function() e = KEY_B end)
cvars.AddChangeCallback("cl_dbg_key_bend", function(t, t, n) e = tonumber(n) end, "octoweapons")
hook.Add("PlayerButtonDown", "octoweapons", function(a, t) if t == e then requestBend(true) end end)
hook.Add("PlayerButtonUp", "octoweapons", function(a, t) if t == e then requestBend(nil) end end)
-- local n = octolib.array.toKeys({"+menu_context"})
local n = KEY_C
-- hook.Add("PlayerBindPress", "octoweapons", function(e, t, a)
--     if not a or not n[t] then return end
--     local e = e:GetActiveWeapon()
--     if not IsValid(e) or not e.CanBend or not e:GetNWBool("IsReady") then return end
--     return true
-- end)

-- net.Receive("octoweapons.bend", function()
--     local n, t = net.ReadEntity(), net.ReadInt(8)
--     local e = n:GetActiveWeapon()
--     local e = octolib.table.map(IsValid(e) and (e.BendAngles[e:GetHoldType()] or e.BendAngles._default) or {}, function(e) return e * t end)
--     octolib.manipulateBones(n, e, .3)
-- end)

local timerguns = false

hook.Add("PlayerButtonDown", "octoweapons", function(ply, key)
    -- if key == GetConVar('cl_dbg_key_firemode'):GetInt() and not timerguns then
    if key == KEY_B and not timerguns then
        -- netstream.Start('octoweapons.firemode')
        net.Start('octoweapons.firemode')
        net.SendToServer()
        timerguns = true

        timer.Create("removetimerguns", 1, 1, function()
            timerguns = false 
        end)
    end
end)

