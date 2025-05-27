ESX = exports['es_extended']:getSharedObject()
local IsDead = false

AddEventHandler('esx:onPlayerDeath', function(data)
    IsDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
    IsDead = false
end)

local lib, anim = 'anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01'
local isUsing = false

RegisterNetEvent("policebulletproof")
AddEventHandler("policebulletproof", function()
	Citizen.CreateThread(function()
		if IsPedInAnyVehicle(PlayerPedId(), false) then return end
		if isUsing then return end
        if IsDead then return end

		-- Server check if player has vest AND is police
		ESX.TriggerServerCallback('policebulletproof', function(valid, isPolice)
			if not isPolice then
				TriggerEvent('notifications', '#ff0000', "Error", "You are not a police officer!")
				return
			end

			if valid then
				local playerPed = PlayerPedId()
				isUsing = true

				exports['progressBars']:startUI(5000, "Putting on police vest...")

				ESX.Streaming.RequestAnimDict(lib, function()
					TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)

					Citizen.Wait(0)

					Citizen.CreateThread(function()
						while isUsing do
							Citizen.Wait(0)
							DisableAllControlActions(0)
							EnableControlAction(0, 1, true)
							EnableControlAction(0, 2, true)
						end
					end)

					Citizen.Wait(5000)
					ClearPedTasks(playerPed)
					SetPedArmour(playerPed, 100)
					isUsing = false
				end)
			else
				TriggerEvent('notifications', '#ffa200', "Inventory", "You don't have a police vest!")
			end
		end)
	end)
end)

RegisterCommand('policewesten', function()
	TriggerEvent('policebulletproof')
end)

RegisterKeyMapping('policewesten', 'Use Police Bulletproof Vest', 'keyboard', '')
