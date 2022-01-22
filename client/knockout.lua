KnockedOut = KnockedOut or {}
KnockedOut.ReviveInterval = 90
KnockedOut.MinimumRevive = 20
InKnockedOut = false
KnockedOutTime = 0
KnockedOutDict = "combat@damage@writhe"
KnockedOutAnim = "writhe_loop"
isEscorted = false
local isEscorting = false

-- Functions

local function GetClosestPlayer()
    local closestPlayers = QBCore.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(PlayerPedId())

    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = #(pos - coords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
	end

	return closestPlayer, closestDistance
end

local function LoadAnimation(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(100)
    end
end

function SetKnockedOut(bool, spawn)
    local ped = PlayerPedId()
    if bool then
        Wait(1000)
        local pos = GetEntityCoords(ped)
        local heading = GetEntityHeading(ped)

        while GetEntitySpeed(ped) > 0.5 or IsPedRagdoll(ped) do
            Wait(10)
        end

        TriggerServerEvent("InteractSound_SV:PlayOnSource", "demo", 0.1)

        KnockedOutTime = KnockedOut.ReviveInterval

        NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z + 0.5, heading, true, false)
        SetEntityHealth(ped, 150)
        

        if IsPedInAnyVehicle(ped, false) then
            LoadAnimation("veh@low@front_ps@idle_duck")
            TaskPlayAnim(ped, "veh@low@front_ps@idle_duck", "sit", 1.0, 8.0, -1, 1, -1, false, false, false)
        else
            LoadAnimation(KnockedOutDict)
            TaskPlayAnim(ped, KnockedOutDict, KnockedOutAnim, 1.0, 8.0, -1, 1, -1, false, false, false)
        end

        InKnockedOut = true

	TriggerServerEvent('hospital:server:ambulanceAlert', 'Civilian Down')

        CreateThread(function()
            while InKnockedOut do
                ped = PlayerPedId()
                player = PlayerId()
                if KnockedOutTime - 1 > KnockedOut.MinimumRevive then
                    KnockedOutTime = KnockedOutTime - 1
                    Config.DeathTime = KnockedOutTime
                elseif KnockedOutTime - 1 <= KnockedOut.MinimumRevive and KnockedOutTime - 1 ~= 0 then
                    KnockedOutTime = KnockedOutTime - 1
                    Config.DeathTime = KnockedOutTime
                elseif KnockedOutTime - 1 <= 0 then
                    QBCore.Functions.Notify("You have woken up", "error")
                    SetKnockedOut(false)
                    local killer_2, killerWeapon = NetworkGetEntityKillerOfPlayer(player)
                    local killer = GetPedSourceOfDeath(ped)

                    if killer_2 ~= 0 and killer_2 ~= -1 then
                        killer = killer_2
                    end

                    local killerId = NetworkGetPlayerIndexFromPed(killer)
                    local killerName = killerId ~= -1 and GetPlayerName(killerId) .. " " .. "("..GetPlayerServerId(killerId)..")" or "Himself or a NPC"
                    local weaponLabel = "Unknown"
                    local weaponName = "Unknown_Weapon"
                    local weaponItem = QBCore.Shared.Weapons[killerWeapon]
                    if weaponItem then
                        weaponLabel = weaponItem.label
                        weaponName = weaponItem.name
                    end
                    --TriggerServerEvent("qb-log:server:CreateLog", "death", GetPlayerName(player) .. " ("..GetPlayerServerId(player)..") is dead", "red", "**".. killerName .. "** has killed  ".. GetPlayerName(player) .." with a **".. weaponLabel .. "** (" .. weaponName .. ")")
                    --deathTime = 0
                    --OnDeath()
                    --DeathTimer()
                end
                Wait(1000)
            end
        end)
    else
        TaskPlayAnim(ped, KnockedOutDict, "exit", 1.0, 8.0, -1, 1, -1, false, false, false)
        InKnockedOut = false
        KnockedOutTime = 0
    end
    TriggerServerEvent("hospital:server:SetKnockedOutStatus", bool)
end

-- Events

RegisterNetEvent('hospital:client:SetEscortingState', function(bool)
    isEscorting = bool
end)

RegisterNetEvent('hospital:client:isEscorted', function(bool)
    isEscorted = bool
end)

RegisterNetEvent('hospital:client:UseFirstAid', function()
    if not isEscorting then
        local player, distance = GetClosestPlayer()
        if player ~= -1 and distance < 1.5 then
            local playerId = GetPlayerServerId(player)
            TriggerServerEvent('hospital:server:UseFirstAid', playerId)
        end
    else
        QBCore.Functions.Notify('Action impossible!', 'error')
    end
end)

RegisterNetEvent('hospital:client:CanHelp', function(helperId)
    if InKnockedOut then
        if KnockedOutTime <= 300 then
            TriggerServerEvent('hospital:server:CanHelp', helperId, true)
        else
            TriggerServerEvent('hospital:server:CanHelp', helperId, false)
        end
    else
        TriggerServerEvent('hospital:server:CanHelp', helperId, false)
    end
end)

RegisterNetEvent('hospital:client:HelpPerson', function(targetId)
    local ped = PlayerPedId()
    isHealingPerson = true
    QBCore.Functions.Progressbar("hospital_revive", "Reviving person..", math.random(30000, 60000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = healAnimDict,
        anim = healAnim,
        flags = 1,
    }, {}, {}, function() -- Done
        isHealingPerson = false
        ClearPedTasks(ped)
        QBCore.Functions.Notify("You revived a person.")
        TriggerServerEvent("hospital:server:RevivePlayer", targetId)
    end, function() -- Cancel
        isHealingPerson = false
        ClearPedTasks(ped)
        QBCore.Functions.Notify("Canceled!", "error")
    end)
end)
