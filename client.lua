ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterCommand(Config.CommandName, function(source, args)
    local playerId = tonumber(args[1])
    local amount = tonumber(args[2])
    
    if playerId == nil or amount == nil then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {'Usage: /' .. Config.CommandName .. ' [playerId] [amount]'}
        })
        return
    end
    
    if amount < Config.MinimumAmount or amount > Config.MaximumAmount then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {'Amount must be between ' .. Config.MinimumAmount .. ' and ' .. Config.MaximumAmount}
        })
        return
    end
    
    TriggerServerEvent('FiveMScript:pay', playerId, amount)
end, false)