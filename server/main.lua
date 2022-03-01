local QBCore = exports['qb-core']:GetCoreObject()

-- Functions

local function IsWeaponBlocked(WeaponName)
    local retval = false
    for _, name in pairs(Config.DurabilityBlockedWeapons) do
        if name == WeaponName then
            retval = true
            break
        end 
    end
    return retval
end

local function HasAttachment(component, attachments)
    local retval = false
    local key = nil
    for k, v in pairs(attachments) do
        if v.component == component then
            key = k
            retval = true
        end
    end
    return retval, key
end

local function GetAttachmentType(attachments)
    local attype = nil
    for k,v in pairs(attachments) do
        attype = v.type
    end
    return attype
end

-- Callback

QBCore.Functions.CreateCallback("weapons:server:GetConfig", function(source, cb)
    cb(Config.WeaponRepairPoints)
end)

QBCore.Functions.CreateCallback("weapon:server:GetWeaponAmmo", function(source, cb, WeaponData)
    local Player = QBCore.Functions.GetPlayer(source)
    local retval = 0
    if WeaponData then
        if Player then
            local ItemData = Player.Functions.GetItemBySlot(WeaponData.slot)
            if ItemData then
                retval = ItemData.info.ammo and ItemData.info.ammo or 0
            end
        end
    end
    cb(retval)
end)

QBCore.Functions.CreateCallback('weapons:server:RemoveAttachment', function(source, cb, AttachmentData, ItemData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Inventory = Player.PlayerData.items
    local AttachmentComponent = WeaponAttachments[ItemData.name:upper()][AttachmentData.attachment]
    if Inventory[ItemData.slot] then
        if Inventory[ItemData.slot].info.attachments and next(Inventory[ItemData.slot].info.attachments) then
            local HasAttach, key = HasAttachment(AttachmentComponent.component, Inventory[ItemData.slot].info.attachments)
            if HasAttach then
                table.remove(Inventory[ItemData.slot].info.attachments, key)
                Player.Functions.SetInventory(Player.PlayerData.items, true)
                Player.Functions.AddItem(AttachmentComponent.item, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[AttachmentComponent.item], "add")
                TriggerClientEvent("QBCore:Notify", src, Lang:t('info.removed_attachment', { value = QBCore.Shared.Items[AttachmentComponent.item].label }), "error")
                cb(Inventory[ItemData.slot].info.attachments)
            else
                cb(false)
            end
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback("weapons:server:RepairWeapon", function(source, cb, RepairPoint, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local minute = 60 * 1000
    local Timeout = math.random(5 * minute, 10 * minute)
    local WeaponData = QBCore.Shared.Weapons[GetHashKey(data.name)]
    local WeaponClass = (QBCore.Shared.SplitStr(WeaponData.ammotype, "_")[2]):lower()

    if Player.PlayerData.items[data.slot] then
        if Player.PlayerData.items[data.slot].info.quality then
            if Player.PlayerData.items[data.slot].info.quality ~= 100 then
                if Player.Functions.RemoveMoney('cash', Config.WeaponRepairCosts[WeaponClass]) then
                    Config.WeaponRepairPoints[RepairPoint].IsRepairing = true
                    Config.WeaponRepairPoints[RepairPoint].RepairingData = {
                        CitizenId = Player.PlayerData.citizenid,
                        WeaponData = Player.PlayerData.items[data.slot],
                        Ready = false,
                    }
                    Player.Functions.RemoveItem(data.name, 1, data.slot)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[data.name], "remove")
                    TriggerClientEvent("inventory:client:CheckWeapon", src, data.name)
                    TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[RepairPoint], RepairPoint)

                    SetTimeout(Timeout, function()
                        Config.WeaponRepairPoints[RepairPoint].IsRepairing = false
                        Config.WeaponRepairPoints[RepairPoint].RepairingData.Ready = true
                        TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[RepairPoint], RepairPoint)
                        TriggerEvent('qb-phone:server:sendNewMailToOffline', Player.PlayerData.citizenid, {
                            sender = Lang:t('mail.sender'),
                            subject = Lang:t('mail.subject'),
                            message = Lang:t('mail.message', { value = WeaponData.label })
                        })
                        SetTimeout(7 * 60000, function()
                            if Config.WeaponRepairPoints[RepairPoint].RepairingData.Ready then
                                Config.WeaponRepairPoints[RepairPoint].IsRepairing = false
                                Config.WeaponRepairPoints[RepairPoint].RepairingData = {}
                                TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[RepairPoint], RepairPoint)
                            end
                        end)
                    end)
                    cb(true)
                else
                    cb(false)
                end
            else
                TriggerClientEvent("QBCore:Notify", src, Lang:t('error.no_damage_on_weapon'), "error")
                cb(false)
            end
        else
            TriggerClientEvent("QBCore:Notify", src, Lang:t('error.no_damage_on_weapon'), "error")
            cb(false)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.no_weapon_in_hand'), "error")
        TriggerClientEvent('weapons:client:SetCurrentWeapon', src, {}, false)
        cb(false)
    end
end)

-- Events

RegisterNetEvent("weapons:server:AddWeaponAmmo", function(CurrentWeaponData, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = tonumber(amount)
    if CurrentWeaponData then
        if Player.PlayerData.items[CurrentWeaponData.slot] then
            Player.PlayerData.items[CurrentWeaponData.slot].info.ammo = amount
        end
        Player.Functions.SetInventory(Player.PlayerData.items, true)
    end
end)

RegisterNetEvent("weapons:server:UpdateWeaponAmmo", function(CurrentWeaponData, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = tonumber(amount)
    if CurrentWeaponData then
        if Player.PlayerData.items[CurrentWeaponData.slot] then
            Player.PlayerData.items[CurrentWeaponData.slot].info.ammo = amount
        end
        Player.Functions.SetInventory(Player.PlayerData.items, true)
    end
end)

RegisterNetEvent("weapons:server:TakeBackWeapon", function(k, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local itemdata = Config.WeaponRepairPoints[k].RepairingData.WeaponData
    itemdata.info.quality = 100
    Player.Functions.AddItem(itemdata.name, 1, false, itemdata.info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemdata.name], "add")
    Config.WeaponRepairPoints[k].IsRepairing = false
    Config.WeaponRepairPoints[k].RepairingData = {}
    TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[k], k)
end)

RegisterNetEvent("weapons:server:SetWeaponQuality", function(data, hp)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local WeaponSlot = Player.PlayerData.items[data.slot]
    WeaponSlot.info.quality = hp
    Player.Functions.SetInventory(Player.PlayerData.items, true)
end)

RegisterNetEvent('weapons:server:UpdateWeaponQuality', function(data, RepeatAmount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local WeaponData = QBCore.Shared.Weapons[GetHashKey(data.name)]
    local WeaponSlot = Player.PlayerData.items[data.slot]
    local DecreaseAmount = Config.DurabilityMultiplier[data.name]
    if WeaponSlot then
        if not IsWeaponBlocked(WeaponData.name) then
            if WeaponSlot.info.quality then
                for i = 1, RepeatAmount, 1 do
                    if WeaponSlot.info.quality - DecreaseAmount > 0 then
                        WeaponSlot.info.quality = WeaponSlot.info.quality - DecreaseAmount
                    else
                        WeaponSlot.info.quality = 0
                        TriggerClientEvent('inventory:client:UseWeapon', src, data)
                        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.weapon_broken_need_repair'), "error")
                        break
                    end
                end
            else
                WeaponSlot.info.quality = 100
                for i = 1, RepeatAmount, 1 do
                    if WeaponSlot.info.quality - DecreaseAmount > 0 then
                        WeaponSlot.info.quality = WeaponSlot.info.quality - DecreaseAmount
                    else
                        WeaponSlot.info.quality = 0
                        TriggerClientEvent('inventory:client:UseWeapon', src, data)
                        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.weapon_broken_need_repair'), "error")
                        break
                    end
                end
            end
        end
    end
    Player.Functions.SetInventory(Player.PlayerData.items, true)
end)

RegisterNetEvent("weapons:server:EquipAttachment", function(ItemData, CurrentWeaponData, AttachmentData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Inventory = Player.PlayerData.items
    local GiveBackItem = nil
    if Inventory[CurrentWeaponData.slot] then
        if Inventory[CurrentWeaponData.slot].info.attachments and next(Inventory[CurrentWeaponData.slot].info.attachments) then
            local currenttype = GetAttachmentType(Inventory[CurrentWeaponData.slot].info.attachments)
            local HasAttach, key = HasAttachment(AttachmentData.component, Inventory[CurrentWeaponData.slot].info.attachments)
            if not HasAttach then
                if AttachmentData.type ~=nil and currenttype == AttachmentData.type then
                    for k, v in pairs(Inventory[CurrentWeaponData.slot].info.attachments) do
                        if v.type and v.type == currenttype then
                            GiveBackItem = tostring(v.item):lower()
                            table.remove(Inventory[CurrentWeaponData.slot].info.attachments, key)
                            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[GiveBackItem], "add")
                        end
                    end
                end
                Inventory[CurrentWeaponData.slot].info.attachments[#Inventory[CurrentWeaponData.slot].info.attachments+1] = {
                    component = AttachmentData.component,
                    label = QBCore.Shared.Items[AttachmentData.item].label,
                    item = AttachmentData.item,
                    type = AttachmentData.type,
                }
                TriggerClientEvent("addAttachment", src, AttachmentData.component)
                Player.Functions.SetInventory(Player.PlayerData.items, true)
                Player.Functions.RemoveItem(ItemData.name, 1)
                SetTimeout(1000, function()
                    TriggerClientEvent('inventory:client:ItemBox', src, ItemData, "remove")
                end)
            else
                TriggerClientEvent("QBCore:Notify", src, Lang:t('error.attachment_already_on_weapon' , { value = QBCore.Shared.Items[AttachmentData.item].label }), "error", 3500)
            end
        else
            Inventory[CurrentWeaponData.slot].info.attachments = {}
            Inventory[CurrentWeaponData.slot].info.attachments[#Inventory[CurrentWeaponData.slot].info.attachments+1] = {
                component = AttachmentData.component,
                label = QBCore.Shared.Items[AttachmentData.item].label,
                item = AttachmentData.item,
                type = AttachmentData.type,
            }
            TriggerClientEvent("addAttachment", src, AttachmentData.component)
            Player.Functions.SetInventory(Player.PlayerData.items, true)
            Player.Functions.RemoveItem(ItemData.name, 1)
            SetTimeout(1000, function()
                TriggerClientEvent('inventory:client:ItemBox', src, ItemData, "remove")
            end)
        end
    end
    if GiveBackItem then
        Player.Functions.AddItem(GiveBackItem, 1, false)
        GiveBackItem = nil
    end
end)

-- Commands

QBCore.Commands.Add("repairweapon", "Repair Weapon (God Only)", {{name="hp", help=Lang:t('info.hp_of_weapon')}}, true, function(source, args)
    TriggerClientEvent('weapons:client:SetWeaponQuality', source, tonumber(args[1]))
end, "god")

-- Items

-- AMMO
QBCore.Functions.CreateUseableItem('pistol_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_PISTOL', 12, item)
end)

QBCore.Functions.CreateUseableItem('rifle_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_RIFLE', 30, item)
end)

QBCore.Functions.CreateUseableItem('smg_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_SMG', 20, item)
end)

QBCore.Functions.CreateUseableItem('shotgun_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_SHOTGUN', 10, item)
end)

QBCore.Functions.CreateUseableItem('mg_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_MG', 30, item)
end)

QBCore.Functions.CreateUseableItem('snp_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_SNIPER', 10, item)
end)

QBCore.Functions.CreateUseableItem('emp_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_EMPLAUNCHER', 10, item)
end)

QBCore.Functions.CreateUseableItem('beanbag_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_BEANBAG', 10, item)
end)

QBCore.Functions.CreateUseableItem('rpg_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_RPG', 5, item)
end)

QBCore.Functions.CreateUseableItem('taser_ammo', function (source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_TASER', 3, item)
end)

QBCore.Functions.CreateUseableItem('grenadelauncher_ammo', function (source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_GRENADELAUNCHER', 5, item)
end)

QBCore.Functions.CreateUseableItem('minigun_ammo', function (source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_MINIGUN', 100, item)
end)

QBCore.Functions.CreateUseableItem('firework_ammo', function (source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_STINGER', 5, item)
end)

-- TINTS
QBCore.Functions.CreateUseableItem('weapontint_black', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 0)
end)

QBCore.Functions.CreateUseableItem('weapontint_green', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 1)
end)

QBCore.Functions.CreateUseableItem('weapontint_gold', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 2)
end)

QBCore.Functions.CreateUseableItem('weapontint_pink', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 3)
end)

QBCore.Functions.CreateUseableItem('weapontint_army', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 4)
end)

QBCore.Functions.CreateUseableItem('weapontint_lspd', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 5)
end)

QBCore.Functions.CreateUseableItem('weapontint_orange', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 6)
end)

QBCore.Functions.CreateUseableItem('weapontint_plat', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 7)
end)

-- ATTACHMENTS
QBCore.Functions.CreateUseableItem('pistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('pistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('pistol_flashlight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flashlight')
end)

QBCore.Functions.CreateUseableItem('pistol_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)

QBCore.Functions.CreateUseableItem('pistol_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

QBCore.Functions.CreateUseableItem('combatpistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('combatpistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('combatpistol_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

QBCore.Functions.CreateUseableItem('appistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('appistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('appistol_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

QBCore.Functions.CreateUseableItem('pistol50_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('pistol50_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('pistol50_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

QBCore.Functions.CreateUseableItem('heavypistol_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

QBCore.Functions.CreateUseableItem('revolver_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('doubleaction_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('revolver_vipvariant', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'vipvariant')
end)

QBCore.Functions.CreateUseableItem('revolver_bodyguardvariant', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'bodyguardvariant')
end)

QBCore.Functions.CreateUseableItem('snspistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('snspistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('snspistol_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('heavypistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('heavypistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('heavypistol_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('vintagepistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('vintagepistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('combatpistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('microsmg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('microsmg_scope', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

QBCore.Functions.CreateUseableItem('microsmg_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

QBCore.Functions.CreateUseableItem('smg_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('smg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('smg_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

QBCore.Functions.CreateUseableItem('smg_scope', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

QBCore.Functions.CreateUseableItem('smg_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

QBCore.Functions.CreateUseableItem('assaultsmg_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('assaultsmg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('pumpshotgun_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('sawnoffshotgun_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('assaultsmg_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

QBCore.Functions.CreateUseableItem('minismg_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('minismg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('machinepistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('machinepistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('machinepistol_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

QBCore.Functions.CreateUseableItem('combatpdw_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('combatpdw_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('combatpistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('emplauncher_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('combatpdw_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

QBCore.Functions.CreateUseableItem('combatpdw_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('combatpdw_scope', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

QBCore.Functions.CreateUseableItem('shotgun_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)

QBCore.Functions.CreateUseableItem('pumpshotgun_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

QBCore.Functions.CreateUseableItem('sawnoffshotgun_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

QBCore.Functions.CreateUseableItem('sniper_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

QBCore.Functions.CreateUseableItem('assaultshotgun_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('assaultshotgun_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('heavyshotgun_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('heavyshotgun_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('heavyshotgun_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

QBCore.Functions.CreateUseableItem('rifle_flashlight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flashlight')
end)

QBCore.Functions.CreateUseableItem('rifle_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('rifle_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)

QBCore.Functions.CreateUseableItem('sniperrifle_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

QBCore.Functions.CreateUseableItem('combatpdw_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_scope', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

QBCore.Functions.CreateUseableItem('advancedrifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('advancedrifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('advancedrifle_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('bullpupshotgun_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

QBCore.Functions.CreateUseableItem('compactrifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('compactrifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('compactrifle_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

QBCore.Functions.CreateUseableItem('gusenberg_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('gusenberg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('microsmg_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('microsmg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('sniperrifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('sniper_scope', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

QBCore.Functions.CreateUseableItem('snipermax_scope', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

QBCore.Functions.CreateUseableItem('sniper_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('heavysniper_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('heavysniper_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_scope', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

QBCore.Functions.CreateUseableItem('snspistol_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

QBCore.Functions.CreateUseableItem('smg_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)



--GLOCK17 ATTACHMENTS
QBCore.Functions.CreateUseableItem('g17_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, '17rnddefaultclip')
end)

QBCore.Functions.CreateUseableItem('g17_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, '17rndextendedclip')
end)

QBCore.Functions.CreateUseableItem('g17_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, '21rndclip')
end)

QBCore.Functions.CreateUseableItem('g17_feed', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, '33rndclip')
end)

QBCore.Functions.CreateUseableItem('g17_drumfed', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, '50rnddrum')
end)

QBCore.Functions.CreateUseableItem('g17_flashlight1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flashlight1')
end)

QBCore.Functions.CreateUseableItem('g17_flashlight2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flashlight2')
end)

QBCore.Functions.CreateUseableItem('g17_flashlight3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flashlight3')
end)

QBCore.Functions.CreateUseableItem('g17_flashlight4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flashlight4')
end)

QBCore.Functions.CreateUseableItem('g17_suppressor1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor1')
end)

QBCore.Functions.CreateUseableItem('g17_suppressor2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor2')
end)

QBCore.Functions.CreateUseableItem('g17_suppressor3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor3')
end)

QBCore.Functions.CreateUseableItem('g17_suppressor4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor4')
end)

QBCore.Functions.CreateUseableItem('g17_suppressor5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor5')
end)

QBCore.Functions.CreateUseableItem('g17_suppressor6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor6')
end)

QBCore.Functions.CreateUseableItem('g17_suppressor7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor7')
end)

QBCore.Functions.CreateUseableItem('g17_suppressor8', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor8')
end)

QBCore.Functions.CreateUseableItem('g17_suppressor9', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor9')
end)

QBCore.Functions.CreateUseableItem('g17_barrel1', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel1')
end)

QBCore.Functions.CreateUseableItem('g17_barrel2', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel2')
end)

QBCore.Functions.CreateUseableItem('g17_barrel3', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel3')
end)

QBCore.Functions.CreateUseableItem('g17_barrel4', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel4')
end)

QBCore.Functions.CreateUseableItem('g17_barrel5', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel5')
end)

QBCore.Functions.CreateUseableItem('g17_barrel6', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel6')
end)

QBCore.Functions.CreateUseableItem('g17_barrel7', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel7')
end)

QBCore.Functions.CreateUseableItem('g17_frame1', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'frame1')
end)

QBCore.Functions.CreateUseableItem('g17_frame2', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'frame2')
end)

QBCore.Functions.CreateUseableItem('g17_frame3', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'frame3')
end)

QBCore.Functions.CreateUseableItem('g17_frame4', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'frame4')
end)

QBCore.Functions.CreateUseableItem('g17_frame5', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'frame5')
end)

QBCore.Functions.CreateUseableItem('g17_slide1', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'slide1')
end)

QBCore.Functions.CreateUseableItem('g17_slide2', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'slide2')
end)

QBCore.Functions.CreateUseableItem('g17_slide3', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'slide3')
end)

QBCore.Functions.CreateUseableItem('g17_slide4', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'slide4')
end)

QBCore.Functions.CreateUseableItem('g17_slide5', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'slide5')
end)

QBCore.Functions.CreateUseableItem('g17_slide6', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'slide6')
end)

QBCore.Functions.CreateUseableItem('g17_slide7', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'slide7')
end)

QBCore.Functions.CreateUseableItem('g17_slide8', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'slide8')
end)

QBCore.Functions.CreateUseableItem('g17_slide9', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'slide9')
end)


--M870 ATTACHMENTS
QBCore.Functions.CreateUseableItem('m870_barrel1', function (source, item)
    TriggerClientEvent('weapopns:client:EquipAttachment', source, item, 'barrel1')
end)

QBCore.Functions.CreateUseableItem('m870_barrel2', function (source, item)
    TriggerClientEvent('weapopns:client:EquipAttachment', source, item, 'barrel2')
end)

QBCore.Functions.CreateUseableItem('m870_barrel3', function (source, item)
    TriggerClientEvent('weapopns:client:EquipAttachment', source, item, 'barrel3')
end)

QBCore.Functions.CreateUseableItem('m870_barrel4', function (source, item)
    TriggerClientEvent('weapopns:client:EquipAttachment', source, item, 'barrel4')
end)

QBCore.Functions.CreateUseableItem('m870_barrel5', function (source, item)
    TriggerClientEvent('weapopns:client:EquipAttachment', source, item, 'barrel5')
end)

QBCore.Functions.CreateUseableItem('m870_barrel6', function (source, item)
    TriggerClientEvent('weapopns:client:EquipAttachment', source, item, 'barrel6')
end)

QBCore.Functions.CreateUseableItem('m870_barrel7', function (source, item)
    TriggerClientEvent('weapopns:client:EquipAttachment', source, item, 'barrel7')
end)

QBCore.Functions.CreateUseableItem('m870_4rndmag', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, '4rndmag')
end)

QBCore.Functions.CreateUseableItem('m870_7rndmag', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, '7rndmag')
end)

QBCore.Functions.CreateUseableItem('m870_12rndmag', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, '12rndmag')
end)

QBCore.Functions.CreateUseableItem('m870_handguard1', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'handguard1')
end)

QBCore.Functions.CreateUseableItem('m870_handguard2', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'handguard2')
end)

QBCore.Functions.CreateUseableItem('m870_handguard3', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'handguard3')
end)

QBCore.Functions.CreateUseableItem('m870_scope1', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope1')
end)

QBCore.Functions.CreateUseableItem('m870_scope2', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope2')
end)

QBCore.Functions.CreateUseableItem('m870_scope3', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope3')
end)

QBCore.Functions.CreateUseableItem('m870_scope4', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope4')
end)

QBCore.Functions.CreateUseableItem('m870_stock1', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock1')
end)

QBCore.Functions.CreateUseableItem('m870_stock2', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock2')
end)

QBCore.Functions.CreateUseableItem('m870_stock3', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock3')
end)

QBCore.Functions.CreateUseableItem('m870_stock4', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock4')
end)

QBCore.Functions.CreateUseableItem('m870_stock5', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock5')
end)

QBCore.Functions.CreateUseableItem('m870_stock6', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock6')
end)


--MK18 ATTACHMENTS
QBCore.Functions.CreateUseableItem('mk18_suppressor1', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor1')
end)

QBCore.Functions.CreateUseableItem('mk18_suppressor2', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor2')
end)

QBCore.Functions.CreateUseableItem('mk18_suppressor3', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor3')
end)

QBCore.Functions.CreateUseableItem('mk18_suppressor4', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor4')
end)

QBCore.Functions.CreateUseableItem('mk18_suppressor5', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor5')
end)

QBCore.Functions.CreateUseableItem('mk18_suppressor6', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor6')
end)

QBCore.Functions.CreateUseableItem('mk18_black30rndmag1', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source ,item ,'black30rndmag1')
end)

QBCore.Functions.CreateUseableItem('mk18_black30rndmag2', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source ,item ,'black30rndmag2')
end)

QBCore.Functions.CreateUseableItem('mk18_tan30rndmag1', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source ,item ,'tan30rndmag1')
end)

QBCore.Functions.CreateUseableItem('mk18_black30rndmag3', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source ,item ,'black30rndmag3')
end)

QBCore.Functions.CreateUseableItem('mk18_tam30rndmag2', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source ,item ,'tan30rndmag2')
end)

QBCore.Functions.CreateUseableItem('mk18_black60rndmag', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source ,item ,'black60rndmag')
end)

QBCore.Functions.CreateUseableItem('mk18_black60rnddrum', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source ,item ,'black60rnddrum')
end)

QBCore.Functions.CreateUseableItem('mk18_tanflashlight1', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source ,item ,'tanflashlight1')
end)

QBCore.Functions.CreateUseableItem('mk18_tanflashlight2', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source ,item ,'tanflashlight2')
end)

QBCore.Functions.CreateUseableItem('mk18_tanflashlight3', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source ,item ,'tanflashlight3')
end)

QBCore.Functions.CreateUseableItem('mk18_blackflashlight1', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source ,item ,'blackflashlight1')
end)

QBCore.Functions.CreateUseableItem('mk18_blackflashlight2', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source ,item ,'blackflashlight2')
end)

QBCore.Functions.CreateUseableItem('mk18_tanflashlight4', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source ,item ,'tanflashlight4')
end)

QBCore.Functions.CreateUseableItem('mk18_tanflashlight5', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source ,item ,'tanflashlight5')
end)

QBCore.Functions.CreateUseableItem('mk18_frame1', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'frame1')
end)

QBCore.Functions.CreateUseableItem('mk18_frame2', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'frame2')
end)

QBCore.Functions.CreateUseableItem('mk18_frame3', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'frame3')
end)

QBCore.Functions.CreateUseableItem('mk18_scope1', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope1')
end)

QBCore.Functions.CreateUseableItem('mk18_scope2', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope2')
end)

QBCore.Functions.CreateUseableItem('mk18_scope3', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope3')
end)

QBCore.Functions.CreateUseableItem('mk18_scope4', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope4')
end)

QBCore.Functions.CreateUseableItem('mk18_scope5', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope5')
end)

QBCore.Functions.CreateUseableItem('mk18_scope6', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope6')
end)

QBCore.Functions.CreateUseableItem('mk18_scope7', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope7')
end)

QBCore.Functions.CreateUseableItem('mk18_scope8', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope8')
end)

QBCore.Functions.CreateUseableItem('mk18_scope9', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope9')
end)

QBCore.Functions.CreateUseableItem('mk18_stock1', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock1')
end)

QBCore.Functions.CreateUseableItem('mk18_stock2', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock2')
end)

QBCore.Functions.CreateUseableItem('mk18_stock3', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock3')
end)

QBCore.Functions.CreateUseableItem('mk18_stock4', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock4')
end)

QBCore.Functions.CreateUseableItem('mk18_stock5', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock5')
end)

QBCore.Functions.CreateUseableItem('mk18_stock6', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock6')
end)

QBCore.Functions.CreateUseableItem('mk18_stock7', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock7')
end)

QBCore.Functions.CreateUseableItem('mk18_grip1', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip1')
end)

QBCore.Functions.CreateUseableItem('mk18_grip2', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip2')
end)

QBCore.Functions.CreateUseableItem('mk18_grip3', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip3')
end)

QBCore.Functions.CreateUseableItem('mk18_grip4', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip4')
end)

QBCore.Functions.CreateUseableItem('mk18_grip5', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip5')
end)

--STAFF
QBCore.Functions.CreateUseableItem('staff_luxfinish1', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxfinish1')
end)

QBCore.Functions.CreateUseableItem('staff_luxfinish2', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxfinish2')
end)

QBCore.Functions.CreateUseableItem('staff_luxfinish3', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxfinish3')
end)

QBCore.Functions.CreateUseableItem('staff_luxfinish4', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxfinish4')
end)

QBCore.Functions.CreateUseableItem('staff_luxfinish5', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxfinish5')
end)

QBCore.Functions.CreateUseableItem('staff_luxfinish6', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxfinish6')
end)

QBCore.Functions.CreateUseableItem('staff_luxfinish7', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxfinish7')
end)

QBCore.Functions.CreateUseableItem('staff_luxfinish8', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxfinish8')
end)

QBCore.Functions.CreateUseableItem('staff_luxfinish9', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxfinish9')
end)

QBCore.Functions.CreateUseableItem('staff_luxfinish10', function (source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxfinish10')
end)































































































