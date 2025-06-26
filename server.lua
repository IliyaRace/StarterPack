ESX = exports['es_extended']:getSharedObject()

local playerUsedKits = {}

RegisterCommand("kits", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then
        return
    end

    local kitName = args[1]
    if not kitName or not Config.Kits[kitName] then
        TriggerClientEvent('chat:addMessage', source, {
            args = {"System", "کیتی با این نام یافت نشد!"}
        })
        return
    end

    local kit = Config.Kits[kitName]
    local playerId = xPlayer.identifier

    -- بررسی دسترسی به کیت VIP
    if kitName == "vip" then
        local hasAccess = false
        for _, identifier in ipairs(kit.requiredIdentifiers) do
            if playerId == identifier then
                hasAccess = true
                break
            end
        end

        if not hasAccess then
            TriggerClientEvent('chat:addMessage', source, {
                args = {"System", "شما به کیت VIP دسترسی ندارید!"}
            })
            return
        end
    end

    -- بررسی استفاده یکبار از کیت
    if playerUsedKits[playerId] and playerUsedKits[playerId][kitName] then
        TriggerClientEvent('chat:addMessage', source, {
            args = {"System", "شما قبلاً از این کیت استفاده کرده‌اید!"}
        })
        return
    end

    -- اعطای آیتم‌ها
    for _, item in ipairs(kit.items) do
        xPlayer.addInventoryItem(item.name, item.count)
    end

    -- ثبت اینکه بازیکن از کیت استفاده کرده است
    if not playerUsedKits[playerId] then
        playerUsedKits[playerId] = {}
    end
    playerUsedKits[playerId][kitName] = true

    -- پیام موفقیت
    TriggerClientEvent('chat:addMessage', xPlayer.source, {
        args = {"System", "کیت " .. kitName .. " دریافت شد!"}
    })
end, false)
