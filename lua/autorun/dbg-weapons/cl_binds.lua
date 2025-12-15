net.Receive("octoweapons.anim", function()
    local ply, fraction = net.ReadEntity(), net.ReadInt(8)
    if not IsValid(ply) then return end

    local wep = ply:GetActiveWeapon()
    -- local targetAngles = octolib.table.map(
    --     (IsValid(wep) and wep.BendAngles)
    --     and (wep.BendAngles[wep:GetHoldType()] or wep.BendAngles._default)
    --     or {},
    --     function(ang)
    --         return ang * fraction
    --     end
    -- )

    -- octolib.manipulateBones(ply, targetAngles, 0.1)

    -- timer.Simple(0.1, function()
    --     if IsValid(ply) then
    --         octolib.manipulateBones(ply, {}, 0.3)
    --     end
    -- end)
end)


local function t(n)
    local e = LocalPlayer():GetActiveWeapon()
    if not IsValid(e) or not e.CanBend or not e:GetNWBool("IsReady") then
        return
    end
    net.Start("octoweapons.bend")
    net.WriteBool(n)
    net.SendToServer()
end
local e, n = 0, 0
timer.Simple(
    0,
    function()
        e = GetConVar("cl_dbg_key_bend"):GetInt()
        n = GetConVar("cl_dbg_key_firemode"):GetInt()
    end
)
cvars.AddChangeCallback( "cl_dbg_key_firemode", function(t, t, e) n = tonumber(e) end, "octoweapons" )
cvars.AddChangeCallback( "cl_dbg_key_bend", function(t, t, n) e = tonumber(n) end, "octoweapons" )
hook.Add( "PlayerButtonDown", "octoweapons", function(d, o)
    if not IsFirstTimePredicted() then return end
    if o == e then
        t(true)
    end
    if o == n then
        netstream.Start("octoweapons-changeFiremode")
    end
end)
hook.Add( "PlayerButtonUp", "octoweapons", function(o, n)
    if not IsFirstTimePredicted() then return end
    if n == e then
        t(nil)
    end
end)
