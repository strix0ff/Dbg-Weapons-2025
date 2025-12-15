-- dbgWeapons = dbgWeapons or {}
-- dbgWeapons.attachments = dbgWeapons.attachments or {}

-- dbgWeapons.attachments.clientData = dbgWeapons.attachments.clientData or {}

-- function dbgWeapons.attachments.requestConfig()
--     netstream.Start('dbgWeapons.attachments.requestConfig')
-- end

-- netstream.Hook('dbgWeapons.attachments.sendConfig', function(data)
--     dbgWeapons.attachments.clientData = data or {}
-- end)

-- function dbgWeapons.attachments.getWeaponConfig(class)
--     if not class then return end
--     if CLIENT then
--         return dbgWeapons.attachments.clientData[class]
--     else
--         return dbgWeapons.attachments.data[class]
--     end
-- end

-- function dbgWeapons.attachments.hasAttachments(class)
--     if not class then return false end
--     if CLIENT then
--         return dbgWeapons.attachments.clientData[class] ~= nil
--     else
--         return dbgWeapons.attachments.data[class] ~= nil
--     end
-- end

-- function dbgWeapons.attachments.getTargetValue(wep, groupId, enabled)
--     if not IsValid(wep) or not groupId then return 0 end
    
--     local config = dbgWeapons.attachments.getWeaponConfig(wep:GetClass())
--     local typeData = config and config[groupId] and dbgWeapons.attachments.types[config[groupId].type]
    
--     if typeData then
--         if typeData.id == 'bipod' then
--             local bipodState = wep:GetNetVar('bipodState', 0)
--             return bipodState > 0 and bipodState or 0
--         elseif typeData.id == 'skin' then
--             return wep:GetNetVar('skinState', 0)
--         end
--     end
    
--     return enabled and 1 or 0
-- end

-- function dbgWeapons.attachments.setBodyGroup(wep, groupId, enabled)
--     if not IsValid(wep) or not groupId then return end
    
--     local owner = wep:GetOwner()
--     if not IsValid(owner) then return end
    
--     local value = enabled and 1 or 0
--     wep:SetBodygroup(groupId, value)
    
--     if CLIENT then
--         local vm = owner:GetViewModel()
--         if IsValid(vm) then
--             vm:SetBodygroup(groupId, value)
--         end
--     end
-- end

-- function dbgWeapons.attachments.createExtendedMagFunction(bonus)
--     return function(wep, enabled)
--         if not IsValid(wep) then return end
        
--         if not wep.originalClipSize then
--             wep.originalClipSize = wep.Primary.ClipSize
--         end
        
--         if enabled then
--             wep.Primary.ClipSize = wep.originalClipSize + bonus
--             wep:SetClip1(math.min(wep:Clip1(), wep.Primary.ClipSize))
--         else
--             wep.Primary.ClipSize = wep.originalClipSize
--             wep:SetClip1(math.min(wep:Clip1(), wep.Primary.ClipSize))
--         end
--     end
-- end

-- function dbgWeapons.attachments.createSuppressorFunction()
--     return function(wep, enabled)
--         if not IsValid(wep) then return end
        
--         if not wep.originalSounds then
--             wep.originalSounds = {
--                 primary = wep.Primary.Sound,
--                 distant = wep.Primary.DistantSound
--             }
--         end
        
--         if enabled then
--             local soundName = wep.Primary.Sound and string.match(tostring(wep.Primary.Sound), "([^.]+)%.fire") or nil
--             if soundName then
--                 wep.Primary.Sound = Sound(soundName .. ".fire_s")
--                 wep.Primary.DistantSound = Sound(soundName .. ".fire_s-distant")
--             end
--         else
--             if wep.originalSounds then
--                 wep.Primary.Sound = wep.originalSounds.primary
--                 wep.Primary.DistantSound = wep.originalSounds.distant
--             end
--         end
--     end
-- end

-- function dbgWeapons.attachments.createGripFunction()
--     return function(wep, enabled)
--         if not IsValid(wep) then return end
--         wep:SetNetVar("isGripInstalled", enabled)
--     end
-- end

-- function dbgWeapons.attachments.createBipodFunction()
--     return function(wep, enabled)
--         if not IsValid(wep) then return end
--         local currentState = wep:GetNetVar('bipodState', 0)
--         local newState = enabled and (currentState == 2 and 1 or currentState + 1) or 0
        
--         wep:SetNetVar("bipodState", newState)
--         wep:SetNetVar("isBipodsIntalled", newState == 2)
--     end
-- end

-- function dbgWeapons.attachments.createStockFunction()
--     return function(wep, enabled)
--         if not IsValid(wep) then return end
--         wep:SetNetVar("IsStockHidden", enabled and true or nil)
--     end
-- end

-- function dbgWeapons.attachments.createSkinFunction()
--     return function(wep, enabled)
--         if not IsValid(wep) then return end
--         local value = enabled and 1 or 0
--         wep:SetNetVar("skinState", value)
--         wep:SetSkin(value)
--     end
-- end

-- function dbgWeapons.attachments.getActiveState(wep, typeData, enabled)
--     return typeData and typeData.id == 'bipod' and wep:GetNetVar('bipodState', 0) == 2 or enabled
-- end

-- function dbgWeapons.attachments.setBodyGroupAndVM(wep, groupId, value)
--     wep:SetBodygroup(groupId, value)
--     if CLIENT then
--         local vm = wep:GetOwner():GetViewModel()
--         if IsValid(vm) then
--             vm:SetBodygroup(groupId, value)
--         end
--     end
-- end

-- function dbgWeapons.attachments.isModuleType(config, groupId, typeName)
--     return config and config[groupId] and config[groupId].type == typeName
-- end

-- function dbgWeapons.attachments.updateWeapon(wep)
--     if not IsValid(wep) or not dbgWeapons.attachments.hasAttachments(wep:GetClass()) then return end
    
--     local owner = wep:GetOwner()
--     if not IsValid(owner) then return end
    
--     local attachments = FindMetaTable('Player'):getWeaponAttachments(wep:GetClass())
--     if not attachments then return end
    
--     for groupId, enabled in pairs(attachments) do
--         dbgWeapons.attachments.setBodyGroup(wep, groupId, enabled)
--     end
-- end 

-- hook.Add('dbgWeapons.attachments.bipods', 'dbgWeapons.kickMultiplier', function(ply, wep)
-- 	if wep:GetNetVar('isBipodsIntalled') and ply:Crouching() then
-- 		return 0.5
-- 	end
-- end)

-- octolib.include.prefixed('config/')
