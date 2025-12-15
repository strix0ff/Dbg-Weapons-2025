-- dbgWeapons = dbgWeapons or {}
-- dbgWeapons.attachments = dbgWeapons.attachments or {}

-- dbgWeapons.attachments.data = dbgWeapons.attachments.data or {}

-- util.AddNetworkString('dbgWeapons.attachments.requestConfig')
-- util.AddNetworkString('dbgWeapons.attachments.sendConfig')

-- function dbgWeapons.attachments.getWeaponConfig(class)
--     return dbgWeapons.attachments.data[class]
-- end

-- function dbgWeapons.attachments.hasAttachments(class)
--     return dbgWeapons.attachments.data[class] ~= nil
-- end

-- netstream.Hook('dbgWeapons.attachments.requestConfig', function(ply)
--     if not IsValid(ply) then return end
--     netstream.Start(ply, 'dbgWeapons.attachments.sendConfig', dbgWeapons.attachments.data)
-- end)

-- local PLAYER = FindMetaTable('Player')

-- function PLAYER:getWeaponAttachments(class)
--     if not class then return end

--     self.weaponAttachments = self.weaponAttachments or {}

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

-- function PLAYER:setWeaponAttachment(class, groupId, enabled)
--     if not class or not groupId then return end

--     local attachments = self:getWeaponAttachments(class)
--     if not attachments then return end

--     attachments[groupId] = enabled
-- end

-- netstream.Hook('octoweapons.attachment.set', function(ply, class, groupId, enabled)
--     if not IsValid(ply) or not class or not groupId then return end

--     ply:setWeaponAttachment(class, groupId, enabled)

--     local wep = ply:GetActiveWeapon()
--     if not IsValid(wep) or wep:GetClass() ~= class then return end

--     local target = dbgWeapons.attachments.getTargetValue(wep, groupId, enabled)
--     wep:SetBodygroup(groupId, target)
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

-- hook.Add('dbgWeapons.attachments.bipods', 'dbgWeapons.kickMultiplier', function(ply, wep)
--     if wep:GetNetVar('isBipodsIntalled') and ply:Crouching() then
--         return 0.5
--     end
-- end)
