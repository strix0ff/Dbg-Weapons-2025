hook.Add('KeyPress', 'dbg.weapons', function(ply, key)
	local attack1 = key == IN_ATTACK
	local attack2 = key == IN_ATTACK2
	if not attack1 and not attack2 then return end

	local wep = ply:GetActiveWeapon()
	if not IsValid(wep) then return end

	-- called before PrimaryAttack / SecondaryAttack
	if attack1 and wep.PrimaryAttackPressed then wep:PrimaryAttackPressed() end
	if attack2 and wep.SecondaryAttackPressed then wep:SecondaryAttackPressed() end
end)

hook.Add('KeyRelease', 'dbg.weapons', function(ply, key)
	local attack1 = key == IN_ATTACK
	local attack2 = key == IN_ATTACK2
	if not attack1 and not attack2 then return end

	local wep = ply:GetActiveWeapon()
	if not IsValid(wep) then return end

	if attack1 and wep.PrimaryAttackReleased then wep:PrimaryAttackReleased() end
	if attack2 and wep.SecondaryAttackReleased then wep:SecondaryAttackReleased() end
end)

local function addWeaponSound(soundName, path, distantPath, silenced)
	sound.Add({
		name = soundName,
		channel = CHAN_USER_BASE + 10,
		volume = 1,
		sound = path,
		pitch = {95, 105},
		level = 75,
	})

	if distantPath then
		sound.Add({
			name = soundName .. '-distant',
			channel = CHAN_USER_BASE + 11,
			volume = silenced and 0.05 or 1,
			sound = distantPath,
			pitch = {95, 105},
			level = silenced and 85 or 95,
		})
	end
end

addWeaponSound('beretta.fire','weapons-new/pistols/beretta_92/beretta_92_shot.wav','weapons-new/pistols/beretta_92/beretta_92_shot_distant.wav')
addWeaponSound('taurus_judge.fire','weapons-new/pistols/taurus_judge/taurus_judge_shot.wav','weapons-new/pistols/taurus_judge/taurus_judge_shot_distant.wav')
addWeaponSound('cobra.fire','weapons-new/pistols/colt_cobra/colt_cobra_shot.wav','weapons-new/pistols/colt_cobra/colt_cobra_shot_distant.wav')
addWeaponSound('python.fire','weapons-new/pistols/colt_python/colt_python_shot.wav','weapons-new/pistols/colt_python/colt_python_shot_distant.wav')
addWeaponSound('cz75.fire','weapons-new/pistols/cz-75/cz-75_shot.wav','weapons-new/pistols/cz-75/cz-75_shot_distant.wav')
addWeaponSound('deagle.fire','weapons-new/pistols/desert_eagle/desert_eagle_shot.wav','weapons-new/pistols/desert_eagle/desert_eagle_shot_distant.wav')
addWeaponSound('fiveseven.fire','weapons-new/pistols/five-seven/five-seven_shot.wav','weapons-new/pistols/five-seven/five-seven_shot_distant.wav')
addWeaponSound('glock-17.fire','weapons-new/pistols/glock-17/glock_17_shot.wav','weapons-new/pistols/glock-17/glock_17_shot_distant.wav')
addWeaponSound('hi-point_c-9.fire','weapons-new/pistols/hi-point_c-9/hi-point_c-9_shot.wav','weapons-new/pistols/hi-point_c-9/hi-point_c-9_shot_distant.wav')
addWeaponSound('hk_usp.fire','weapons-new/pistols/hk_usp/hk_usp_shot.wav','weapons-new/pistols/hk_usp/hk_usp_shot_distant.wav')
addWeaponSound('p226.fire','weapons-new/pistols/p226/p226_shot.wav','weapons-new/pistols/p226/p226_shot_distant.wav')
addWeaponSound('waltherp38.fire','weapons-new/pistols/waltherp38/waltherp38_shot.wav','weapons-new/pistols/waltherp38/waltherp38_shot_distant.wav')
addWeaponSound('pm.fire','weapons-new/pistols/makarov/makarov_shot.wav','weapons-new/pistols/makarov/makarov_shot_distant.wav')
addWeaponSound('1911.fire','weapons-new/pistols/M1911/1911_shot.wav','weapons-new/pistols/M1911/1911_shot_distant.wav')
addWeaponSound('spectre_m4.fire','weapons-new/smg/spectre_m4/spectre_m4_shot.wav','weapons-new/smg/spectre_m4/spectre_m4_shot_distant.wav')
addWeaponSound('thompson.fire','weapons-new/smg/thompson/thompson_shot.wav','weapons-new/smg/thompson/thompson_shot_distant.wav')
addWeaponSound('pp19_bizon.fire','weapons-new/smg/pp19_bizon/pp19_bizon_shot.wav','weapons-new/smg/pp19_bizon/pp19_bizon_shot_distant.wav')
addWeaponSound('mac10.fire','weapons-new/smg/mac10/mac10_shot.wav','weapons-new/smg/mac10/mac10_shot_distant.wav')
addWeaponSound('tec9.fire','weapons-new/smg/tec9/tec9_shot.wav','weapons-new/smg/tec9/tec9_shot_distant.wav')
addWeaponSound('ar15_pistol.fire','weapons-new/smg/ar15_pistol/ar15_pistol_shot.wav','weapons-new/smg/ar15_pistol/ar15_pistol_shot_distant.wav')
addWeaponSound('smg919.fire','weapons-new/smg/smg919/smg919_shot.wav','weapons-new/smg/smg919/smg919_shot_distant.wav')
addWeaponSound('mp7.fire','weapons-new/smg/mp7/mp7_shot.wav','weapons-new/smg/mp7/mp7_shot_distant.wav')
addWeaponSound('mp5.fire','weapons-new/smg/mp5/mp5_shot.wav','weapons-new/smg/mp5/mp5_shot_distant.wav')
addWeaponSound('p90.fire','weapons-new/smg/p90/p90_shot.wav','weapons-new/smg/p90/p90_shot_distant.wav')
addWeaponSound('tmp.fire','weapons-new/smg/tmp/tmp_shot.wav','weapons-new/smg/tmp/tmp_shot_distant.wav',true)
addWeaponSound('ump45.fire','weapons-new/smg/ump45/ump45_shot.wav','weapons-new/smg/ump45/ump45_shot_distant.wav')
addWeaponSound('tar21.fire','weapons-new/assault_rifles/tar_21/tar_21_shot.wav','weapons-new/assault_rifles/tar_21/tar_21_shot_distant.wav')
addWeaponSound('ak74.fire','weapons-new/assault_rifles/ak_74/ak_74_shot.wav','weapons-new/assault_rifles/ak_74/ak_74_shot_distant.wav')
addWeaponSound('ak105.fire','weapons-new/assault_rifles/ak_105/ak_105_shot.wav','weapons-new/assault_rifles/ak_105/ak_105_shot_distant.wav')
addWeaponSound('ak74u.fire','weapons-new/assault_rifles/ak_74u/ak_74u_shot.wav','weapons-new/assault_rifles/ak_74u/ak_74u_shot_distant.wav')
addWeaponSound('aug.fire','weapons-new/assault_rifles/steyr_aug/steyr_aug_shot.wav','weapons-new/assault_rifles/steyr_aug/steyr_aug_shot_distant.wav')
addWeaponSound('g36.fire','weapons-new/assault_rifles/hk_g36/hk_g36_shot.wav','weapons-new/assault_rifles/hk_g36/hk_g36_shot_distant.wav')
addWeaponSound('galil.fire','weapons-new/assault_rifles/galil/galil_shot.wav','weapons-new/assault_rifles/galil/galil_shot_distant.wav')
addWeaponSound('m4a1.fire','weapons-new/assault_rifles/m4a1/m4a1_shot.wav','weapons-new/assault_rifles/m4a1/m4a1_shot_distant.wav')
addWeaponSound('sg552.fire','weapons-new/assault_rifles/sg552_acog/sg552_acog_shot.wav','weapons-new/assault_rifles/sg552_acog/sg552_acog_shot_distant.wav')
addWeaponSound('hk416.fire','weapons-new/assault_rifles/hk416/hk416_shot.wav','weapons-new/assault_rifles/hk416/hk416_shot_distant.wav')
addWeaponSound('ar15.fire','weapons-new/assault_rifles/ar_15/ar_15_shot.wav','weapons-new/assault_rifles/ar_15/ar_15_shot_distant.wav')
addWeaponSound('famas.fire','weapons-new/assault_rifles/famas/famas_shot.wav','weapons-new/assault_rifles/famas/famas_shot_distant.wav')
addWeaponSound('db.fire','weapons-new/shotguns/double_barrel/double_barrel_shot.wav','weapons-new/shotguns/double_barrel/double_barrel_shot_distant.wav')
addWeaponSound('dbs.fire','weapons-new/shotguns/double_barrel_so/double_barrel_so_shot.wav','weapons-new/shotguns/double_barrel_so/double_barrel_so_shot_distant.wav')
addWeaponSound('m3.fire','weapons-new/shotguns/m3/m3_super_90_shot.wav','weapons-new/shotguns/m3/m3_super_90_shot_distant.wav')
addWeaponSound('rem870.fire','weapons-new/shotguns/remington870/remington_870_shot.wav','weapons-new/shotguns/remington870/remington_870_shot_distant.wav')
addWeaponSound('xm1014.fire','weapons-new/shotguns/xm1014/xm_1014_shot.wav','weapons-new/shotguns/xm1014/xm_1014_shot_distant.wav')
addWeaponSound('browning.fire','weapons-new/shotguns/browning_a5/browning_a5_shot.wav','weapons-new/shotguns/browning_a5/browning_a5_shot_distant.wav')
addWeaponSound('awm.fire','weapons-new/sniper_rifles/awm/awm_shot.wav','weapons-new/sniper_rifles/awm/awm_shot_distant.wav')
addWeaponSound('remsr.fire','weapons-new/sniper_rifles/remington_msr/remington_msr_shot.wav','weapons-new/sniper_rifles/remington_msr/remington_msr_shot_distant.wav')
addWeaponSound('scout.fire','weapons-new/sniper_rifles/scout/scout_shot.wav','weapons-new/sniper_rifles/scout/scout_shot_distant.wav')
addWeaponSound('sg550.fire','weapons-new/sniper_rifles/sg550/sg550_shot.wav','weapons-new/sniper_rifles/sg550/sg550_shot_distant.wav')
addWeaponSound('rem700.fire','weapons-new/sniper_rifles/remington_700/remington_700_shot.wav','weapons-new/sniper_rifles/remington_700/remington_700_shot_distant.wav')
addWeaponSound('svd.fire','weapons-new/sniper_rifles/svd/svd_shot.wav','weapons-new/sniper_rifles/svd/svd_shot_distant.wav')
addWeaponSound('m249.fire','dbg/weapons/m249/m249-1.wav','dbg/weapons/m249/m249-1-distant.wav')
addWeaponSound('beanbag.fire','weapons/beanbag/beanbagfire.wav','weapons/beanbag/beanbagfire.wav',true)
addWeaponSound('1911.fire_s','weapons-new/pistols/M1911/1911_shot_s.wav','weapons-new/pistols/M1911/1911_shot_s_distant.wav',true)
addWeaponSound('pm.fire_s','weapons-new/pistols/makarov/makarov_shot_s.wav','weapons-new/pistols/makarov/makarov_shot_s_distant.wav')
addWeaponSound('hk_usp.fire_s','weapons-new/pistols/hk_usp/hk_usp_shot_s.wav','weapons-new/pistols/hk_usp/hk_usp_shot_s_distant.wav')
addWeaponSound('mp7.fire_s','weapons-new/smg/mp7/mp7_shot_s.wav','weapons-new/smg/mp7/mp7_shot_s_distant.wav')
addWeaponSound('mp5.fire_s','weapons-new/smg/mp5/mp5_shot_s.wav','weapons-new/smg/mp5/mp5_shot_s_distant.wav')
addWeaponSound('p90.fire_s','weapons-new/smg/p90/p90_shot_s.wav','weapons-new/smg/p90/p90_shot_s_distant.wav')
addWeaponSound('tmp.fire_s','weapons-new/smg/tmp/tmp_shot_s.wav','weapons-new/smg/tmp/tmp_shot_s_distant.wav',true)
addWeaponSound('ump45.fire_s','weapons-new/smg/ump45/ump45_shot_s.wav','weapons-new/smg/ump45/ump45_shot_s_distant.wav')
addWeaponSound('ak74.fire_s','weapons-new/assault_rifles/ak_74/ak_74_shot_s.wav','weapons-new/assault_rifles/ak_74/ak_74_shot_s_distant.wav')
addWeaponSound('ak105.fire_s','weapons-new/assault_rifles/ak_105/ak_105_shot_s.wav','weapons-new/assault_rifles/ak_105/ak_105_shot_s_distant.wav')
addWeaponSound('hk416.fire_s','weapons-new/assault_rifles/hk416/hk416_shot_s.wav','weapons-new/assault_rifles/hk416/hk416_shot_s_distant.wav')
addWeaponSound('ar15.fire_s','weapons-new/assault_rifles/ar_15/ar_15_shot_s.wav','weapons-new/assault_rifles/ar_15/ar_15_shot_s_distant.wav')
addWeaponSound('rem700.fire_s','weapons-new/sniper_rifles/remington_700/remington_700_shot_s.wav','weapons-new/sniper_rifles/remington_700/remington_700_shot_s_distant.wav') 


-- octolib.include.prefixed('/dbg-weapons')
-- octolib.include.prefixed('/dbg-weapons/airguns')
-- octolib.include.prefixed('/dbg-weapons/scare')
-- octolib.include.prefixed('/dbg-weapons/suppression')
-- octolib.include.prefixed('/dbg-weapons/bend')
-- octolib.include.prefixed('/dbg-weapons/firemodes')
-- octolib.include.prefixed('/dbg-weapons/attachments')

suppression_vignette_size = CreateConVar("suppression_vignette_size", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_viewpunch = CreateConVar("suppression_viewpunch", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_viewpunch_explosion = CreateConVar("suppression_viewpunch_explosion", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_viewpunch_intensity = CreateConVar("suppression_viewpunch_intensity", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_buildupspeed = CreateConVar("suppression_buildupspeed", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_sharpen = CreateConVar("suppression_sharpen", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_muffle = CreateConVar("suppression_muffle", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_sharpen_intensity = CreateConVar("suppression_sharpen_intensity", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_sound_volume = CreateConVar("suppression_sound_volume", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_bloom = CreateConVar("suppression_bloom", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_blur = CreateConVar("suppression_blur", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_blur_intensity = CreateConVar("supression_blur_intensity", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_bloom_intensity = CreateConVar("suppression_bloom_intensity", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_enabled = CreateConVar("suppression_enabled", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_gasp_enabled = CreateConVar("suppression_gasp_enabled", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_enable_vehicle = CreateConVar("suppression_enable_vehicle", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED)
local suppression_enable_cover = CreateConVar("suppression_enable_cover", 0, FCVAR_ARCHIVE + FCVAR_REPLICATED)

if SERVER then
	util.AddNetworkString( "viewpunch_punch" )
end
function ApplySuppressionEffect(at, hit, start, mult)
	bruh = start or at:EyePos()
	bruhh = hit
	for _,v in pairs(player.GetAll()) do
		local distance, sup_point = util.DistanceToLine( bruh, bruhh, v:GetPos() )
		if v:IsPlayer() and v:Alive() and (suppression_enabled:GetBool()) and distance < 100 and !(v == at) then
			local tr = util.TraceLine( {
				start = sup_point,
				endpos = v:EyePos(),
				filter = v
			} )
			if !suppression_enable_cover:GetBool() and tr.Hit then return end
			if (v:InVehicle() and !suppression_enable_vehicle:GetBool()) then return end
			v:SetNWInt("EffectAMT", math.Clamp(v:GetNWInt("EffectAMT"), 0, 1) + 0.05 * mult * (suppression_buildupspeed:GetFloat()))
			timer.Remove(v:Name() .. "blurreset")
			timer.Create(v:Name() .. "blurreset", 4, 1, function()
				for i=1,(v:GetNWInt("EffectAMT") / 0.05) + 1 do
					timer.Simple(0.1 * i, function()
						v:SetNWInt("EffectAMT", math.Clamp(v:GetNWInt("EffectAMT") - 0.1, 0, 100000))
						if suppression_muffle:GetBool() then
							v:SetDSP( 1, false )
						end
					end)
				end 
			end) --end timer function
		end --end alive test
	end --end for
end -- end function
hook.Add("EntityFireBullets", "SupperssionFunc", function(at, bul)
	local oldcb = bul.Callback
	bul.Callback = function( at, tr, dm)
		if oldcb then 
			oldcb( at, tr, dm ) 
		end
		if SERVER then 
			ApplySuppressionEffect(at, tr.HitPos, tr.StartPos, 1)
		end
	end
	return true
end)

hook.Add( "OnDamagedByExplosion", "SuppressExplosion", function(ply, dmginfo)
	if !suppression_viewpunch_explosion:GetBool() then return end
	if dmginfo:GetDamage() < 30 and !ply:Alive() then return end
	if SERVER then
		ApplySuppressionEffect(nil, ply:GetPos(), ply:GetPos(), 20 )
	end
end )

local sharpen_lerp = 0
local bloom_lerp = 0
local effect_lerp = 0
hook.Add("RenderScreenspaceEffects", "ApplySuppression", function()
	if LocalPlayer():GetNWInt("EffectAMT") == 0 then return end
	if LocalPlayer():GetNWInt("EffectAMT") >= 0.7 and LocalPlayer():Alive() and suppression_muffle:GetBool() then
		LocalPlayer():SetDSP( 14, false )
	end
end)
hook.Add("PlayerInitialSpawn", "Initialize", function(ply)
	ply:SetNWInt("EffectAMT", 0)

end)

hook.Add("PlayerDeath", "ClearDeath", function(ply, i, a)
	ply:SetNWInt("EffectAMT", 0)

end)

local mat, val = Material('overlays/vignette01'), 0
-- hook.Add('HUDPaint', 'dbgWeapons.suppression', function()
--     val = LocalPlayer():GetNWInt("EffectAMT")
--     if val < 0.05 then return end

--     mat:SetFloat('$alpha', val)

--     render.SetMaterial(mat)
--     render.DrawScreenQuad()

--     surface.SetDrawColor(0, 0, 0, 150 * val)
--     surface.DrawRect(0, 0, ScrW(), ScrH())
-- end)
