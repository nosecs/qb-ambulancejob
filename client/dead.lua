local deadAnimDict = "dead"
local deadAnim = "dead_a"
local hold = 5
deathTime = 0

-- Functions

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

function OnDeath()
    if not isDead then
        isDead = true
        TriggerServerEvent("hospital:server:SetDeathStatus", true)
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "demo", 0.1)
        local player = PlayerPedId()

        --[[while GetEntitySpeed(player) > 0.5 or IsPedRagdoll(player) do
            Wait(10)
        end]]

        if isDead then
            local pos = GetEntityCoords(player)
            local heading = GetEntityHeading(player)

            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped) then
                local veh = GetVehiclePedIsIn(ped)
                local vehseats = GetVehicleModelNumberOfSeats(GetHashKey(GetEntityModel(veh)))
                for i = -1, vehseats do
                    local occupant = GetPedInVehicleSeat(veh, i)
                    if occupant == ped then
                        NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z + 0.5, heading, true, false)
                        SetPedIntoVehicle(ped, veh, i)
                    end
                end
            else
                NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z + 0.5, heading, true, false)
            end
			
            SetEntityInvincible(player, true)
            SetEntityHealth(player, GetEntityMaxHealth(player))
            --[[if IsPedInAnyVehicle(player, false) then
                loadAnimDict("veh@low@front_ps@idle_duck")
                TaskPlayAnim(player, "veh@low@front_ps@idle_duck", "sit", 1.0, 1.0, -1, 1, 0, 0, 0, 0)
            else
                loadAnimDict(deadAnimDict)
                TaskPlayAnim(player, deadAnimDict, deadAnim, 1.0, 1.0, -1, 1, 0, 0, 0, 0)
            end]]
            TriggerServerEvent('hospital:server:ambulanceAlert', Lang:t('info.civ_died'))
        end
    end
end

function DeathTimer()
    hold = 5
    while isDead do
        Wait(1000)
        deathTime = deathTime - 1
        if deathTime <= 0 then
            if IsControlPressed(0, 38) and hold <= 0 and not isInHospitalBed then
                TriggerEvent("hospital:client:RespawnAtHospital")
                hold = 5
            end
            if IsControlPressed(0, 38) then
                if hold - 1 >= 0 then
                    hold = hold - 1
                else
                    hold = 0
                end
            end
            if IsControlReleased(0, 38) then
                hold = 5
            end
        end
    end
end

local function DrawTxt(x, y, width, height, scale, text, r, g, b, a, outline)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

-- Threads

CreateThread(function()
	while true do
		Wait(10)
		local player = PlayerId()
		if NetworkIsPlayerActive(player) then
            local playerPed = PlayerPedId()
            if IsEntityDead(playerPed) and not InLaststand and not InKnockedOut then
                print(GetPedCauseOfDeath(playerPed))
                local KnockedByKnockoutWeapon = false
                for k, v in pairs(Config.KnockoutWeapons) do
                    if GetPedCauseOfDeath(playerPed) == v then
                        SetKnockedOut(true)
                        KnockedByKnockoutWeapon = true
                    end
                end
                if KnockedByKnockoutWeapon == false then
                SetLaststand(true)
                SetKnockedOut(false)
                end
            elseif IsEntityDead(playerPed) and InKnockedOut and not InLaststand then
                print(GetPedCauseOfDeath(playerPed))
                SetLaststand(true)
                SetKnockedOut(false)
            elseif IsEntityDead(playerPed) and InLaststand and not isDead then
                print(GetPedCauseOfDeath(playerPed))
                SetLaststand(false)
                SetKnockedOut(false)
                local killer_2, killerWeapon = NetworkGetEntityKillerOfPlayer(player)
                local killer = GetPedSourceOfDeath(playerPed)

                if killer_2 ~= 0 and killer_2 ~= -1 then
                    killer = killer_2
                end

                local killerId = NetworkGetPlayerIndexFromPed(killer)
                local killerName = killerId ~= -1 and GetPlayerName(killerId) .. " " .. "("..GetPlayerServerId(killerId)..")" or Lang:t('info.self_death')
                local weaponLabel = Lang:t('info.wep_unknown')
                local weaponName = Lang:t('info.wep_unknown')
                local weaponItem = QBCore.Shared.Weapons[killerWeapon]
                if weaponItem then
                    weaponLabel = weaponItem.label
                    weaponName = weaponItem.name
                end
                TriggerServerEvent("qb-log:server:CreateLog", "death", Lang:t('logs.death_log_title', {playername = GetPlayerName(-1), playerid = GetPlayerServerId(player)}), "red", Lang:t('logs.death_log_message', {killername = killerName, playername = GetPlayerName(player), weaponlabel = weaponLabel, weaponname = weaponName}))
                deathTime = Config.DeathTime
                OnDeath()
                DeathTimer()
            end
		end
	end
end)

emsNotified = false

CreateThread(function ()
    while true do
        if isDead or InLaststand or InKnockedOut then
            local ped = PlayerPedId()
            for k, v in pairs(Config.DamageAnimations) do
                for kv, vv in pairs(v.anims) do
                    if IsEntityPlayingAnim(ped, vv, k) then
                        StopEntityAnim(ped, k, vv)
                    end
                end
            end
        end
        Citizen.Wait(100)
    end
end)

CreateThread(function()
	while true do
        sleep = 1000
		if isDead or InLaststand or InKnockedOut then
            sleep = 5
            local ped = PlayerPedId()
            DisableAllControlActions(0)
            EnableControlAction(0, 1, true)
			EnableControlAction(0, 2, true)
			EnableControlAction(0, 245, true)
            EnableControlAction(0, 38, true)
            EnableControlAction(0, 0, true)
            EnableControlAction(0, 322, true)
            EnableControlAction(0, 288, true)
            EnableControlAction(0, 213, true)
            EnableControlAction(0, 249, true)
            EnableControlAction(0, 46, true)
            --SetPedCanBeTargetted(ped, false)

            if isDead then
                if not isInHospitalBed then
                    if deathTime > 0 then
                        DrawTxt(0.93, 1.44, 1.0,1.0,0.6, Lang:t('info.respawn_txt', {deathtime = math.ceil(deathTime)}), 255, 255, 255, 255)
                    else
                        DrawTxt(0.865, 1.44, 1.0, 1.0, 0.6, Lang:t('info.respawn_revive', {holdtime = hold, cost = Config.BillCost}), 255, 255, 255, 255)
                    end
                end
                if GetEntitySpeed(ped) < 0.5 and not IsPedRagdoll(ped) then
                    if IsPedInAnyVehicle(ped, false) then
                        loadAnimDict("veh@low@front_ps@idle_duck")
                        if not IsEntityPlayingAnim(ped, "veh@low@front_ps@idle_duck", "sit", 3) then
                            TaskPlayAnim(ped, "veh@low@front_ps@idle_duck", "sit", 1.0, 1.0, -1, 1, 0, 0, 0, 0)
                        end
                    else
                        if isInHospitalBed then
                            if not IsEntityPlayingAnim(ped, inBedDict, inBedAnim, 3) then
                                loadAnimDict(inBedDict)
                                TaskPlayAnim(ped, inBedDict, inBedAnim, 10.0, 10.0, -1, 1, 0, 0, 0, 0)
                            end
                        else
                            if not IsEntityPlayingAnim(ped, deadAnimDict, deadAnim, 3) then
                                loadAnimDict(deadAnimDict)
                                TaskPlayAnim(ped, deadAnimDict, deadAnim, 10.0, 10.0, -1, 1, 0, 0, 0, 0)
                            end
                        end
                    end
                end

                SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
            elseif InLaststand then
                sleep = 5

                if LaststandTime > Laststand.MinimumRevive then
                    DrawTxt(0.94, 1.44, 1.0, 1.0, 0.6, Lang:t('info.bleed_out', {time = math.ceil(LaststandTime)}), 255, 255, 255, 255)
                else
                    DrawTxt(0.845, 1.44, 1.0, 1.0, 0.6, Lang:t('info.bleed_out_help', {time = math.ceil(LaststandTime)}), 255, 255, 255, 255)
                    if not emsNotified then
                        DrawTxt(0.91, 1.40, 1.0, 1.0, 0.6, Lang:t('info.request_help'), 255, 255, 255, 255)
                    else
                        DrawTxt(0.90, 1.40, 1.0, 1.0, 0.6, Lang:t('info.help_requested'), 255, 255, 255, 255)
                    end

                    if IsControlJustPressed(0, 47) and not emsNotified then
                        TriggerServerEvent('hospital:server:ambulanceAlert', Lang:t('info.civ_down'))
                        emsNotified = true
                    end
                end
                if GetEntitySpeed(ped) < 0.5 and not IsPedRagdoll(ped) then
                    if not isEscorted then
                        if IsPedInAnyVehicle(ped, false) then
                            loadAnimDict("veh@low@front_ps@idle_duck")
                            if not IsEntityPlayingAnim(ped, "veh@low@front_ps@idle_duck", "sit", 3) then
                                TaskPlayAnim(ped, "veh@low@front_ps@idle_duck", "sit", 1.0, 1.0, -1, 1, 0, 0, 0, 0)
                            end
                        else
                            loadAnimDict(lastStandDict)
                            if not IsEntityPlayingAnim(ped, lastStandDict, lastStandAnim, 3) then
                                TaskPlayAnim(ped, lastStandDict, lastStandAnim, 10.0, 10.0, -1, 1, 0, 0, 0, 0)
                            end
                        end
                    else
                        if IsPedInAnyVehicle(ped, false) then
                            loadAnimDict("veh@low@front_ps@idle_duck")
                            if IsEntityPlayingAnim(ped, "veh@low@front_ps@idle_duck", "sit", 3) then
                                StopAnimTask(ped, "veh@low@front_ps@idle_duck", "sit", 3)
                            end
                        else
                            loadAnimDict(lastStandDict)
                            if IsEntityPlayingAnim(ped, lastStandDict, lastStandAnim, 3) then
                                StopAnimTask(ped, lastStandDict, lastStandAnim, 3)
                            end
                        end
                    end
                elseif isEscorted then
                    if IsPedInAnyVehicle(ped, false) then
                        loadAnimDict("veh@low@front_ps@idle_duck")
                        if IsEntityPlayingAnim(ped, "veh@low@front_ps@idle_duck", "sit", 3) then
                            StopAnimTask(ped, "veh@low@front_ps@idle_duck", "sit", 3)
                        end
                    else
                        loadAnimDict(KnockedOutDict)
                        if IsEntityPlayingAnim(ped, KnockedOutDict, KnockedOutAnim, 3) then
                            StopAnimTask(ped, KnockedOutDict, KnockedOutAnim, 3)
                        end
                    end
                end
            elseif InKnockedOut then
                sleep = 5

                if KnockedOutTime > KnockedOut.MinimumRevive then
                    DrawTxt(0.94, 1.44, 1.0, 1.0, 0.6, "YOU WILL WAKE UP IN: ~r~" .. math.ceil(KnockedOutTime) .. "~w~ SECONDS", 255, 255, 255, 255)
                else
                    DrawTxt(0.845, 1.44, 1.0, 1.0, 0.6, "YOU WILL WAKE UP IN: ~r~" .. math.ceil(KnockedOutTime) .. "~w~ SECONDS, YOU CAN BE HELPED", 255, 255, 255, 255)
                end
                if GetEntitySpeed(ped) < 0.5 and not IsPedRagdoll(ped) then
                    if not isEscorted then
                        if IsPedInAnyVehicle(ped, false) then
                            loadAnimDict("veh@low@front_ps@idle_duck")
                            if not IsEntityPlayingAnim(ped, "veh@low@front_ps@idle_duck", "sit", 3) then
                                TaskPlayAnim(ped, "veh@low@front_ps@idle_duck", "sit", 0.1, 0.1, -1, 1, 0, 0, 0, 0)
                            end
                        else
                            loadAnimDict(KnockedOutDict)
                            if not IsEntityPlayingAnim(ped, KnockedOutDict, KnockedOutAnim, 3) then
                                TaskPlayAnim(ped, KnockedOutDict, KnockedOutAnim, 0.1, 0.1, -1, 1, 0, 0, 0, 0)
                            end
                        end
                    else
                        if IsPedInAnyVehicle(ped, false) then
                            loadAnimDict("veh@low@front_ps@idle_duck")
                            if IsEntityPlayingAnim(ped, "veh@low@front_ps@idle_duck", "sit", 3) then
                                StopAnimTask(ped, "veh@low@front_ps@idle_duck", "sit", 3)
                            end
                        else
                            loadAnimDict(KnockedOutDict)
                            if IsEntityPlayingAnim(ped, KnockedOutDict, KnockedOutAnim, 3) then
                                StopAnimTask(ped, KnockedOutDict, KnockedOutAnim, 3)
                            end
                        end
                    end
                elseif isEscorted then
                    if IsPedInAnyVehicle(ped, false) then
                        loadAnimDict("veh@low@front_ps@idle_duck")
                        if IsEntityPlayingAnim(ped, "veh@low@front_ps@idle_duck", "sit", 3) then
                            StopAnimTask(ped, "veh@low@front_ps@idle_duck", "sit", 3)
                        end
                    else
                        loadAnimDict(KnockedOutDict)
                        if IsEntityPlayingAnim(ped, KnockedOutDict, KnockedOutAnim, 3) then
                            StopAnimTask(ped, KnockedOutDict, KnockedOutAnim, 3)
                        end
                    end
                end
            end
		end
        Wait(sleep)
	end
end)