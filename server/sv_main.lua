local doors = {}

RegisterServerEvent("k20-doors:request-lock-state")
AddEventHandler("k20-doors:request-lock-state",function()
    TriggerClientEvent("k20-doors:initial-lock-state", source, doors)
end)

RegisterServerEvent("k20-doors:change-lock-state")
AddEventHandler("k20-doors:change-lock-state",function(pDoorId,pDoorLockState)
    if doors[pDoorId] then
        doors[pDoorId].lock = pDoorLockState
        -- doors[pDoorId].forceUnlocked = pDoorLockState
        TriggerClientEvent("k20-doors:change-lock-state", -1, pDoorId,pDoorLockState,doors[pDoorId].forceUnlocked)
    end
end)

Citizen.CreateThread(function()
    for _,door in ipairs(DOOR_CONFIG) do
        doors[#doors + 1] = door
    end
end)

RegisterServerEvent("k20-door:add")
AddEventHandler("k20-door:add",function(pDoorCoords,pDoorModel)
    file = io.open("doorConfig.log","a")
    io.output(file)
    io.write(("\n vector3(%s , %s, %s)\t %s"):format(pDoorCoords.x, pDoorCoords.y, pDoorCoords.z, pDoorModel))
    io.close(file)
end)