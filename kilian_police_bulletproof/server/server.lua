ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback('policebulletproof', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= 'police' then
        cb(false, false) -- Not a police officer
        return
    end

    if xPlayer.getInventoryItem("policebulletproof").count >= 1 then
        xPlayer.removeInventoryItem("policebulletproof", 1)
        cb(true, true) -- Has vest and is police
    else
        cb(false, true) -- Is police, but no vest
    end
end)

ESX.RegisterUsableItem('policebulletproof', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= 'police' then
        TriggerClientEvent('notifications', source, '#ff0000', "Error", "You are not a police officer!")
        return
    end

    TriggerClientEvent('policebulletproof', source)
end)
