CreateClientConVar('octoweapons_sight_resolution', 512, true)
local r = {}
local t, e, o, n
local c = Material('octoteam/overlays/scope1')
local function l()
    e = GetConVar('octoweapons_sight_resolution'):GetInt()
    o = GetRenderTarget('weaponSight-' .. e, e, e)
    if not r[e] then r[e] = CreateMaterial('weaponSight-' .. e, 'UnlitGeneric', {}) end
    n = r[e]
    t = {}
    local a, n, r, e = 0, 0, e / 2 - 1, 24
    t[#t + 1] = {
        x = a,
        y = n,
        u = .5,
        v = .5
    }

    for o = 0, e do
        local e = math.rad((o / e) * -360)
        t[#t + 1] = {
            x = a + math.sin(e) * r,
            y = n + math.cos(e) * r,
            u = math.sin(e) / 2 + .5,
            v = math.cos(e) / 2 + .5
        }
    end
end

l()
cvars.AddChangeCallback('octoweapons_sight_resolution', l, 'octoweapons')
local r = false
local function a(e)
    r = true
    local n, t, a = e:GetShootPosAndDir()
    render.PushRenderTarget(o)
    if util.TraceLine({
        start = EyePos(),
        endpos = n + t * ((e.SightZNear or 5) + 7),
        filter = LocalPlayer(),
        mask = MASK_VISIBLE_AND_NPCS,
    }).Hit then
        render.Clear(0, 0, 0, 255)
    else
        local t = e.SightZoomLevels
        render.RenderView({
            origin = n,
            angles = a,
            fov = e.SightFOV / t[math.Clamp(e.currentZoomLevel, 1, #t)],
            znear = e.SightZNear,
        })
    end

    render.PopRenderTarget()
    r = false
end

hook.Add('RenderScene', 'octoweapons', function(e, t, r)
    local e = dbgView.calcWeaponView(LocalPlayer(), e, t, r)
    if not e then return end
    render.Clear(0, 0, 0, 255, true, true, true)
    render.RenderView({
        x = 0,
        y = 0,
        w = ScrW(),
        h = ScrH(),
        angles = e.angles,
        origin = e.origin,
        drawhud = true,
        drawviewmodel = false,
        dopostprocess = true,
        drawmonitors = true,
    })
    return true
end)

hook.Add('PreDrawEffects', 'octoweapons', function()
    if r then return end
    local e = LocalPlayer():GetActiveWeapon()
    if IsValid(e) and e.SightPos and e.aimProgress > 0 then a(e) end
end)

function dbgWeapons.renderScope(r)
    local l = r:GetOwner()
    local a = l:LookupAttachment('anim_attachment_rh')
    if not a then return end
    local a = l:GetAttachment(a)
    local i, l = LocalToWorld(r.SightPos, r.SightAng, a.Pos, a.Ang)
    local a = e / -2
    cam.Start3D2D(i, l, r.SightSize / e)
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
    n:SetTexture('$basetexture', o)
    n:SetFloat('$alpha', math.Clamp(math.Remap(r.aimProgress, .6, 1, 0, 1), 0, 1))
    surface.SetMaterial(n)
    surface.DrawTexturedRect(a, a, e, e)
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(c)
    surface.DrawTexturedRect(a, a, e, e)
    render.SetStencilEnable(false)
    cam.IgnoreZ(false)
    cam.End3D2D()
end

local i = Color(255, 50, 50)
local o = {}
-- hook.Add('dbgWeapons.preDrawWeapon', 'dbgWeapons.attachments.scope', function(a, t)
--     local e = t:FindBodygroupByName('scope')
--     if e == -1 then return end
--     local e = EyePos()
--     local c = -t:GetAngles().z
--     local r, n = a:GetShootPosAndDir()
--     local l = r + n * 1e3
--     local l = util.IntersectRayWithPlane(e, l - e, r, n)
--     if not l then return end
--     local r = a.ScopeReticleMaterial
--     if not r then return end
--     local e = o[r]
--     if not e then
--         e = Material(r)
--         o[r] = e
--     end

--     local r = a.ScopeReticleSize
--     local n = -n
--     octolib.render.drawMasked(function()
--         render.SetMaterial(e)
--         render.DrawQuadEasy(l, n, r, r, i, c)
--     end, function() t:DrawModel() end)
-- end)
--[[
hook.Add("PlayerBindPress", "octoweapons.zoom", function(ply, bind, pressed)
    if not pressed then return end

    if bind == "invnext" or bind == "invprev" then
        local wep = ply:GetActiveWeapon()
        if IsValid(wep) and string.StartWith(wep:GetClass(), "weapon_octo_sniper") then
            local delta = (bind == "invnext") and 1 or -1
            net.Start("octoweapons.zoom")
            net.WriteInt(delta, 8)
            net.SendToServer()
            return true
        end
    end
end)
]]--