ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('FiveMScript:pay')
AddEventHandler('FiveMScript:pay', function(targetId, amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local targetPlayer = ESX.GetPlayerFromId(targetId)
    
    if xPlayer == nil or targetPlayer == nil then
        TriggerClientEvent('chat:addMessage', _source, {
            color = {255, 0, 0},
            multiline = true,
            args = {'Player not found'}
        })
        return
    end
    
    if xPlayer.getAccount('bank').money < amount then
        TriggerClientEvent('chat:addMessage', _source, {
            color = {255, 0, 0},
            multiline = true,
            args = {'Insufficient funds'}
        })
        return
    end
    
    xPlayer.removeAccountMoney('bank', amount)
    targetPlayer.addAccountMoney('bank', amount)
    
    MySQL.Async.execute('INSERT INTO transactions (sender_id, receiver_id, amount) VALUES (@sender_id, @receiver_id, @amount)', {
        ['@sender_id'] = _source,
        ['@receiver_id'] = targetId,
        ['@amount'] = amount
    }, function(rowsChanged)
        if rowsChanged == 0 then
            print('Failed to log transaction')
        end
    end)
    
    TriggerClientEvent('chat:addMessage', _source, {
        color = {0, 255, 0},
        multiline = true,
        args = {'You paid ' .. GetPlayerName(targetId) .. ' $' .. amount}
    })
    
    TriggerClientEvent('chat:addMessage', targetId, {
        color = {0, 255, 0},
        multiline = true,
        args = {GetPlayerName(_source) .. ' paid you $' .. amount}
    })
end)