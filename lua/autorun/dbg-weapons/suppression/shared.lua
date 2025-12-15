-- suppression_vignette_size = CreateConVar("suppression_vignette_size", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
-- local suppression_viewpunch = CreateConVar("suppression_viewpunch", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
-- local suppression_viewpunch_explosion = CreateConVar("suppression_viewpunch_explosion", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
-- local suppression_viewpunch_intensity = CreateConVar("suppression_viewpunch_intensity", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
-- local suppression_buildupspeed = CreateConVar("suppression_buildupspeed", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
-- local suppression_sharpen = CreateConVar("suppression_sharpen", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
-- local suppression_muffle = CreateConVar("suppression_muffle", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
-- local suppression_sharpen_intensity = CreateConVar("suppression_sharpen_intensity", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
-- local suppression_sound_volume = CreateConVar("suppression_sound_volume", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
-- local suppression_bloom = CreateConVar("suppression_bloom", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
-- local suppression_blur = CreateConVar("suppression_blur", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
-- local suppression_blur_intensity = CreateConVar("supression_blur_intensity", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
-- local suppression_bloom_intensity = CreateConVar("suppression_bloom_intensity", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
-- local suppression_enabled = CreateConVar("suppression_enabled", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
-- local suppression_gasp_enabled = CreateConVar("suppression_gasp_enabled", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
-- local suppression_enable_vehicle = CreateConVar("suppression_enable_vehicle", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
-- local suppression_enable_cover = CreateConVar("suppression_enable_cover", 0, FCVAR_ARCHIVE + FCVAR_REPLICATED)

-- if SERVER then
-- 	util.AddNetworkString( "viewpunch_punch" )
-- end
-- function ApplySuppressionEffect(at, hit, start, mult)
-- 	bruh = start or at:EyePos()
-- 	bruhh = hit
-- 	for _,v in pairs(player.GetAll()) do
-- 		local distance, sup_point = util.DistanceToLine( bruh, bruhh, v:GetPos() )
-- 		if v:IsPlayer() and v:Alive() and (suppression_enabled:GetBool()) and distance < 100 and !(v == at) then
-- 			local tr = util.TraceLine( {
-- 				start = sup_point,
-- 				endpos = v:EyePos(),
-- 				filter = v
-- 			} )
-- 			if !suppression_enable_cover:GetBool() and tr.Hit then return end
-- 			if (v:InVehicle() and !suppression_enable_vehicle:GetBool()) then return end
-- 			v:SetNWInt("EffectAMT", math.Clamp(v:GetNWInt("EffectAMT"), 0, 1) + 0.05 * mult * (suppression_buildupspeed:GetFloat()))
-- 			timer.Remove(v:Name() .. "blurreset")
-- 			timer.Create(v:Name() .. "blurreset", 4, 1, function()
-- 				for i=1,(v:GetNWInt("EffectAMT") / 0.05) + 1 do
-- 					timer.Simple(0.1 * i, function()
-- 						v:SetNWInt("EffectAMT", math.Clamp(v:GetNWInt("EffectAMT") - 0.1, 0, 100000))
-- 						if suppression_muffle:GetBool() then
-- 							v:SetDSP( 1, false )
-- 						end
-- 					end)
-- 				end 
-- 			end) --end timer function
-- 		end --end alive test
-- 	end --end for
-- end -- end function
-- hook.Add("EntityFireBullets", "SupperssionFunc", function(at, bul)
-- 	local oldcb = bul.Callback
-- 	bul.Callback = function( at, tr, dm)
-- 		if oldcb then 
-- 			oldcb( at, tr, dm ) 
-- 		end
-- 		if SERVER then 
-- 			ApplySuppressionEffect(at, tr.HitPos, tr.StartPos, 1)
-- 		end
-- 	end
-- 	return true
-- end)

-- hook.Add( "OnDamagedByExplosion", "SuppressExplosion", function(ply, dmginfo)
-- 	if !suppression_viewpunch_explosion:GetBool() then return end
-- 	if dmginfo:GetDamage() < 30 and !ply:Alive() then return end
-- 	if SERVER then
-- 		ApplySuppressionEffect(nil, ply:GetPos(), ply:GetPos(), 20 )
-- 	end
-- end )

-- local sharpen_lerp = 0
-- local bloom_lerp = 0
-- local effect_lerp = 0
-- hook.Add("RenderScreenspaceEffects", "ApplySuppression", function()
-- 	if LocalPlayer():GetNWInt("EffectAMT") == 0 then return end
-- 	if LocalPlayer():GetNWInt("EffectAMT") >= 0.7 and LocalPlayer():Alive() and suppression_muffle:GetBool() then
-- 		LocalPlayer():SetDSP( 14, false )
-- 	end
-- end)
-- hook.Add("PlayerInitialSpawn", "Initialize", function(ply)
-- 	ply:SetNWInt("EffectAMT", 0)

-- end)

-- hook.Add("PlayerDeath", "ClearDeath", function(ply, i, a)
-- 	ply:SetNWInt("EffectAMT", 0)

-- end)

-- local mat, val = Material('overlays/vignette01'), 0
-- hook.Add('HUDPaint', 'dbgWeapons.suppression', function()
--     val = LocalPlayer():GetNWInt("EffectAMT")
--     if val < 0.05 then return end

--     mat:SetFloat('$alpha', val)

--     render.SetMaterial(mat)
--     render.DrawScreenQuad()

--     surface.SetDrawColor(0, 0, 0, 150 * val)
--     surface.DrawRect(0, 0, ScrW(), ScrH())
-- end)

-- local mat, val = Material('overlays/vignette01'), 0
-- hook.Add('HUDPaint', 'dbgWeapons.suppression', function()
--     val = LocalPlayer():GetNWInt("EffectAMT")
--     if val < 0.05 then return end

--     mat:SetFloat('$alpha', val)

--     render.SetMaterial(mat)
--     render.DrawScreenQuad()

--     surface.SetDrawColor(0, 0, 0, 150 * val)
--     surface.DrawRect(0, 0, ScrW(), ScrH())
-- end)