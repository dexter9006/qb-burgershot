local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
local onDuty = false
PlayerJob = {}

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.onduty then
            if PlayerData.job.name == Config.Job then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
	onDuty = duty
end)

Citizen.CreateThread(function()
    BurgerShot = AddBlipForCoord(-1197.32, -897.655, 13.995)
    SetBlipSprite (BurgerShot, 106)
    SetBlipDisplay(BurgerShot, 4)
    SetBlipScale  (BurgerShot, 0.8)
    SetBlipAsShortRange(BurgerShot, true)
    SetBlipColour(BurgerShot, 75)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("BurgerShot")
    EndTextCommandSetBlipName(BurgerShot)
end) 

RegisterNetEvent("qb-burgershot:DutyB", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-burgershot:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "burgertray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgertray1", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-burgershot:Tray2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "burgertray2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgertray2", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-burgershot:Tray3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "burgertray3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgertray3", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-burgershot:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "burgerstorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgerstorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("qb-burgershot:Storage2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "burgerstorage2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgerstorage2", {
        maxweight = 250000,
        slots = 40,
    })
end)

--Meal Creations
RegisterNetEvent("qb-burgershot:MurderMeal", function()
		TriggerServerEvent('qb-burgershot:open:murdermeal')
end)

RegisterNetEvent("qb-burgershot:CreateMurderMeal", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientMurderMeal', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "En train de prépare un Murder Meal..", 4000, false, false, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function()
					TriggerServerEvent('qb-burgershot:create:murdermeal')
                    QBCore.Functions.Notify("Vous avez préparé A Murder Meal", "success")
				end, function()
					QBCore.Functions.Notify("Annulation..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else
		QBCore.Functions.Notify("Vous devez être en service", "error")
	end
end)

RegisterNetEvent("qb-burgershot:BleederBurger", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientBurger', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "En train de prépare un Bleeder Burgers..", 4000, false, false, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function()
					TriggerServerEvent('qb-burgershot:create:burgerbleeder')
                    QBCore.Functions.Notify("Vous avez préparé Bleeder Burger", "success")
				end, function()
					QBCore.Functions.Notify("Annulation..", "error")
				end)
			else
   				QBCore.Functions.Notify("tu n'as pas les ingrédients suffisants", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("Vous devez être en service", "error")
	end
end)

RegisterNetEvent("qb-burgershot:MoneyShot", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientBurger', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "En train de prépare un Moneyshot Burger..", 4000, false, false, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function()
					TriggerServerEvent('qb-burgershot:create:burgermoneyshot')
           			QBCore.Functions.Notify("Vous avez préparé MoneyShot Burger", "success")
				end, function()
					QBCore.Functions.Notify("Annulation..", "error")
				end)
			else
   				QBCore.Functions.Notify("tu n'as pas les ingrédients suffisants", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("Vous devez être en service", "error")
	end
end)

RegisterNetEvent("qb-burgershot:HeartStopper", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientBurger', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "En train de prépare un HeartStopper..", 4000, false, false, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function()
					TriggerServerEvent('qb-burgershot:create:burgerheartstopper')
           			QBCore.Functions.Notify("Vous avez préparé Heart Stopper", "success")
				end, function()
					QBCore.Functions.Notify("Annulation..", "error")
				end)
			else
   				QBCore.Functions.Notify("tu n'as pas les ingrédients suffisants", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("Vous devez être en service", "error")
	end
end)

RegisterNetEvent("qb-burgershot:Torpedo", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientTorpedo', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "En train de prépare un Torpedo Roll..", 4000, false, false, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function()
					TriggerServerEvent('qb-burgershot:create:torpedo')
           			QBCore.Functions.Notify("Vous avez préparé Torpedo Roll", "success")
				end, function()
					QBCore.Functions.Notify("Annulation..", "error")
				end)
			else
   				QBCore.Functions.Notify("tu n'as pas les ingrédients suffisants", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("Vous devez être en service", "error")
	end  
end)

RegisterNetEvent("qb-burgershot:MeatFree", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientMeatfree', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "En train de prépare un Meat Free Burger..", 4000, false, false, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function()
					TriggerServerEvent('qb-burgershot:create:burgermeatfree')
                   	QBCore.Functions.Notify("Vous avez préparé un Meat Free Burger", "success")
				end, function()
					QBCore.Functions.Notify("Annulation..", "error")
				end)
			else
   				QBCore.Functions.Notify("tu n'as pas les ingrédients suffisants", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("Vous devez être en service", "error")
	end  
end)

RegisterNetEvent("qb-burgershot:SoftDrink", function()
    if onDuty then
		local HasItem = QBCore.Functions.HasItem("burger-sodasyrup")
        if HasItem then
           MakeSoftDrink()
        else
            QBCore.Functions.Notify("Vous n'avez pas de Soda Concentré..", "error")
        end
    else
        QBCore.Functions.Notify("Vous devez être en service", "error")
    end
end)

RegisterNetEvent("qb-burgershot:mShake", function()
    if onDuty then
	local HasItem = QBCore.Functions.HasItem("burger-mshakeformula")
        if HasItem then
           MakeMShake()
        else
            QBCore.Functions.Notify("Vous n'avez pas de Milkshake Concentré..", "error")
        end
    else
        QBCore.Functions.Notify("Vous devez être en service", "error")
    end
end)

RegisterNetEvent("qb-burgershot:Fries", function()
    if onDuty then
		local HasItem = QBCore.Functions.HasItem("burger-potato")
        if HasItem then
           MakeFries()
        else
            QBCore.Functions.Notify("Vous n'avez pas de pommes de terre..", "error")
        end
    else
        QBCore.Functions.Notify("Vous devez être en service", "error")
    end
end)


RegisterNetEvent("qb-burgershot:PattyFry", function()
    if onDuty then
	local HasItem = QBCore.Functions.HasItem("burger-raw")
        if HasItem then
           MakePatty()
        else
            QBCore.Functions.Notify("Vous n'avez pas de viande hachée crue..", "error")
        end
    else
        QBCore.Functions.Notify("Vous devez être en service", "error")
    end
end)

-- Functions --
function MakeFries()
	TriggerServerEvent('qb-burgershot:remove:potato')
	QBCore.Functions.Progressbar("pickup", "En train de frire les frites..", 4000, false, false, {
	    disableMovement = true,
	    disableCarMovement = true,
	    disableMouse = false,
	    disableCombat = true,
	},{
	    animDict = "amb@prop_human_bbq@male@base",
	    anim = "base",
	    flags = 8,
	    }, {
		model = "prop_cs_fork",
		bone = 28422,
		coords = vector3(-0.005, 0.00, 0.00),
		rotation = vector3(175.0, 160.0, 0.0),
	    }
	)
	Citizen.Wait(4000)
	TriggerServerEvent('qb-burgershot:add:fries')
	QBCore.Functions.Notify("You made 4 fries", "success")
	StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end


function MakePatty()
	TriggerServerEvent('qb-burgershot:remove:rawpatty')
    QBCore.Functions.Progressbar("pickup", "En train de cuire la viande hachée..", 4000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    },{
        animDict = "amb@prop_human_bbq@male@base",
        anim = "base",
        flags = 8,
    }, {
        model = "prop_cs_fork",
        bone = 28422,
        coords = vector3(-0.005, 0.00, 0.00),
        rotation = vector3(175.0, 160.0, 0.0),
    }    
)
    Citizen.Wait(4000)
	TriggerServerEvent('qb-burgershot:add:burgermeat')
    QBCore.Functions.Notify("You cooked the meat", "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end

function MakeSoftDrink()
	TriggerServerEvent('qb-burgershot:remove:sodasyrup')
    QBCore.Functions.Progressbar("pickup", "En train de remplir le gobelet..", 4000, false, false, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
	TriggerServerEvent('qb-burgershot:add:softdrink')
    QBCore.Functions.Notify("Vous avez préparé Soda", "success")
end  


function MakeMShake()
	TriggerServerEvent('qb-burgershot:remove:mshakeformula')
    QBCore.Functions.Progressbar("pickup", "En train de remplir le gobelet..", 4000, false, false, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
	TriggerServerEvent('qb-burgershot:add:mshake')
    QBCore.Functions.Notify("Vous avez préparé Milkshake", "success")
end  
   
RegisterNetEvent("qb-burgershot:shop")
AddEventHandler("qb-burgershot:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", Config.Job, Config.Items)
end)
