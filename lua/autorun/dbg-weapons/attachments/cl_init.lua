-- FindMetaTable('Player').getWeaponAttachments = function(self, class)
--     if not class then return end
    
--     if not self.weaponAttachments then
--         self.weaponAttachments = {}
--     end
    
--     if not self.weaponAttachments[class] then
--         local config = dbgWeapons.attachments.getWeaponConfig(class)
--         if config then
--             self.weaponAttachments[class] = {}
--             for id, data in pairs(config) do
--                 self.weaponAttachments[class][id] = data.default or false
--             end
--         end
--     end
    
--     return self.weaponAttachments[class]
-- end

-- FindMetaTable('Player').setWeaponAttachment = function(self, class, groupId, enabled)
--     if not class or not groupId then return end
    
--     local attachments = self:getWeaponAttachments(class)
--     if not attachments then return end
    
--     attachments[groupId] = enabled
-- end

-- netstream.Hook('octoweapons.attachment.sync', function(ply, class, groupId, enabled)
--     if not IsValid(ply) or not class or not groupId then return end
    
--     ply:setWeaponAttachment(class, groupId, enabled)
    
--     local wep = ply:GetActiveWeapon()
--     if not IsValid(wep) or wep:GetClass() ~= class then return end
    
--     local target = dbgWeapons.attachments.getTargetValue(wep, groupId, enabled)
--     wep:SetBodygroup(groupId, target)
    
--     if ply == LocalPlayer() then
--         local vm = ply:GetViewModel()
--         if IsValid(vm) then
--             vm:SetBodygroup(groupId, target)
--         end
--     end
-- end)

-- netstream.Hook('octoweapons.attachment.sounds', function(wep, enabled, groupId)
--     if not IsValid(wep) then return end
--     local config = dbgWeapons.attachments.getWeaponConfig(wep:GetClass())
--     if not config or not config[groupId] then return end
--     local typeName = config[groupId].type
--     local typeData = dbgWeapons.attachments.types and typeName and dbgWeapons.attachments.types[typeName]
--     if typeData and type(typeData.func) == "function" then
--         typeData.func(wep, enabled)
--     end
-- end)

-- function dbgWeapons.attachments.toggleAttachment(groupId)
--     if not groupId then return end
    
--     local ply = LocalPlayer()
--     local wep = ply:GetActiveWeapon()
    
--     if not IsValid(wep) or not dbgWeapons.attachments.hasAttachments(wep:GetClass()) then return end
    
--     local attachmentData = ply:getWeaponAttachments(wep:GetClass())
--     if not attachmentData then return end
    
--     local config = dbgWeapons.attachments.getWeaponConfig(wep:GetClass())
    
--     local new = not (attachmentData[groupId] or false)
    
--     if dbgWeapons.attachments.isModuleType(config, groupId, 'bipod') then
--         local bipodState = wep:GetNetVar('bipodState', 0)
--         new = bipodState < 2
--     elseif dbgWeapons.attachments.isModuleType(config, groupId, 'skin') then
--         new = wep:GetNetVar('skinState', 0) == 0
--     end
    
--     local sound = dbgWeapons.attachments.isModuleType(config, groupId, 'stock') and (new and 'octoweapons.stockOn' or 'octoweapons.stockOff') or (new and 'octoweapons.attachmentOn' or 'octoweapons.attachmentOff')
--     ply:EmitSound(sound)
    
--     ply:setWeaponAttachment(wep:GetClass(), groupId, new)
    
--     local target = dbgWeapons.attachments.getTargetValue(wep, groupId, new)
--     wep:SetBodygroup(groupId, target)
    
--     local vm = ply:GetViewModel()
--     if IsValid(vm) then
--         vm:SetBodygroup(groupId, target)
--     end
    
--     netstream.Start('octoweapons.attachment.set', wep:GetClass(), groupId, new)
-- end

-- local function updateAttachments()
--     local ply = LocalPlayer()
--     if IsValid(ply) then
--         local wep = ply:GetActiveWeapon()
--         if IsValid(wep) and dbgWeapons.attachments.hasAttachments(wep:GetClass()) then
--             local attachmentData = ply:getWeaponAttachments(wep:GetClass())
--             if attachmentData then
--                 for groupId, enabled in pairs(attachmentData) do
--                     local target = dbgWeapons.attachments.getTargetValue(wep, groupId, enabled)
--                     wep:SetBodygroup(groupId, target)
                    
--                     local vm = ply:GetViewModel()
--                     if IsValid(vm) then
--                         vm:SetBodygroup(groupId, target)
--                     end
--                 end
--             end
--         end
--     end
    
--     for _, otherPly in ipairs(player.GetAll()) do
--         if otherPly == LocalPlayer() or not IsValid(otherPly) then continue end
        
--         local wep = otherPly:GetActiveWeapon()
--         if IsValid(wep) and dbgWeapons.attachments.hasAttachments(wep:GetClass()) then
--             local attachmentData = otherPly:getWeaponAttachments(wep:GetClass())
--             if attachmentData then
--                 for groupId, enabled in pairs(attachmentData) do
--                     wep:SetBodygroup(groupId, dbgWeapons.attachments.getTargetValue(wep, groupId, enabled))
--                 end
--             end
--         end
--     end
-- end

-- hook.Add('PreDrawViewModel', 'octoweapons.attachments', updateAttachments)
-- hook.Add('PostDrawViewModel', 'octoweapons.attachments2', updateAttachments)
-- hook.Add('PreDrawOpaqueRenderables', 'octoweapons.attachments3', updateAttachments)
-- hook.Add('PostDrawOpaqueRenderables', 'octoweapons.attachments4', updateAttachments)
-- hook.Add('InitPostEntity', 'dbgWeapons.attachments.requestConfig', function()
--     dbgWeapons.attachments.requestConfig()
-- end)