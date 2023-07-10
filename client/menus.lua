local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = true
PlayerJob = {}

local onDuty = false

-- target

Citizen.CreateThread(function()

    exports['qb-target']:AddTargetModel(`ig_floyd`, {
        options = {
            {
                type = "client",
                event = "garage:BurgerShotGarage",
                icon = "fas fa-car",
                label = "BurgerShot Garage",
                job = Config.Job,
            },
        },
        distance = 2.5
    })

	exports['qb-target']:AddBoxZone("BurgerShotDuty", vector3(-1196.95, -902.69, 14.0), 1, 1.2, {
		name = "BurgerShotDuty",
		heading = 32,
		debugPoly = false,
		minZ=14.0,
		maxZ=18.0,
	}, {
		options = {
		    {  
			event = "qb-burgershot:DutyB",
			icon = "far fa-clipboard",
			label = "Clock On/Off",
			job = Config.Job,
		    },
		},
		distance = 1.5
	})

		exports['qb-target']:AddBoxZone("burger_tray_1", vector3(-1195.29, -892.31, 14.0), 1.05, 1.0, {
			name = "burger_tray_1",
			heading = 35.0,
			debugPoly = false,
			minZ=13.8,
			maxZ=14.3,
		}, {
			options = {
			    {
				event = "qb-burgershot:Tray1",
				icon = "far fa-clipboard",
				label = "Tray 1",
			    },
			},
			distance = 1.5
		})

	exports['qb-target']:AddBoxZone("burger_tray_2", vector3(-1193.87, -894.38, 14.0), 0.5, 0.7, {
		name="burger_tray_2",
		heading=318,
		debugPoly=false,
		minZ=14.0,
		maxZ=14.4,
	}, {
		options = {
		    {
			event = "qb-burgershot:Tray2",
			icon = "far fa-clipboard",
			label = "Tray 2",
		    },
		},
		distance = 1.5
	})

	exports['qb-target']:AddBoxZone("burger_tray_3", vector3(-1193.88, -906.98, 14.0), 1, 1, {
		name="burger_tray_3",
		heading=350,
		debugPoly=false,
		minZ=13.2,
		maxZ=14.2,
	}, {
		options = {
		    {
			event = "qb-burgershot:Tray3",
			icon = "far fa-clipboard",
			label = "Tray 3",
		    },
		},
		distance = 3.5
	})


	exports['qb-target']:AddBoxZone("burgershotcooker", vector3(-1200.54, -900.92, 13.5), 1.8, 1.0, {
		name="burgershotcooker",
		heading=34,
		debugPoly=false,
		minZ=13.0,
		maxZ=14.4,
	}, {
		options = {
			{
				event = "qb-burgershot:PattyFry",
				icon = "fas fa-hamburger",
				label = "Burger Cook Station",
				job = Config.Job,
			},
		},
		distance = 1.5
	})

	exports['qb-target']:AddBoxZone("burgershotcooker2 ", vector3(-1202.94, -897.38, 13.5), 1.7, 1, {
		name="burgershotcooker2 ",
		heading=34,
		debugPoly=false,
		minZ=13.0,
		maxZ=14.3,
	}, {
		options = {
			{
				event = "qb-burgershot:PattyFry",
				icon = "fas fa-hamburger",
				label = "Burger Cook Station 2",
				job = Config.Job,
			},
		},
		distance = 1.5
	})

		exports['qb-target']:AddBoxZone("burgershotfryer", vector3(-1202.01, -899.27, 13.5), 2.5, 1.5, {
		name="burgershotfryer",
		heading=35,
		debugPoly=false,
		minZ=13.0,
		maxZ=14.4,
		}, {
		    options = {
			{
			    event = "qb-burgershot:Fries",
			    icon = "fas fa-box",
			    label = "Make Fries",
			    job = Config.Job,
			},
		    },
		    distance = 1.5
		})


	exports['qb-target']:AddBoxZone("burgershotdrinks", vector3(-1199.54, -895.52, 14.0), 2.2, 0.6, {
	    name="burgershotdrinks",
	    heading=34,
	    debugPoly=false,
	    minZ=13.8,
	    maxZ=14.8,
	    }, {
		options = {
		    {
			event = "qb-burgershot-menu:DrinkMenu",
			icon = "fas fa-filter",
			label = "Make Some Drinks",
			job = Config.Job,
		    },
		},
		distance = 1.5
	    })

        exports['qb-target']:AddBoxZone("burgershotdrinks2", vector3(-1189.08, -905.28, 14.0), 1.15, 0.7, {
            name="burgershotdrinks2",
            heading=33,
            debugPoly=false,
            minZ=13.8,
            maxZ=14.8,
            }, {
                options = {
                    {
                        event = "qb-burgershot-menu:DrinkMenu",
                        icon = "fas fa-filter",
                        label = "Make Some Drinks",
                        job = Config.Job,
                    },
                },
                distance = 1.5
            })


         exports['qb-target']:AddBoxZone("burgerfridge", vector3(-1203.71, -895.86, 13.0), 1.6, 1, {
            name="burgerfridge",
            heading=35,
            debugPoly=false,
            minZ=13.0,
            maxZ=15.6,
        }, {
                options = {
                    {
                        event = "qb-burgershot-menu:OrderMenu",
                        icon = "fas fa-laptop",
                        label = "Order Ingredients!",
                        job = Config.Job,
                    },
                },
                distance = 1.5
            })

        exports['qb-target']:AddBoxZone("burgershotdisplay", vector3(-1197.78, -894.45, 14.0), 4.6, 1.2, {
            name="burgershotdisplay",
            heading=34,
            debugPoly=false,
            minZ=13.0,
            maxZ=14.8,
        }, {
                options = {
                    {
                        event = "qb-burgershot:Storage",
                        icon = "fas fa-box",
                        label = "Storage",
                        job = Config.Job,
                    },
                },
                distance = 1.5
            })


        exports['qb-target']:AddBoxZone("craftburger", vector3(-1197.57, -899.41, 13.7), 1.8, 0.7, {
            name="craftburger",
            heading=304,
            debugPoly=false,
            minZ=13.0,
            maxZ=14.4,
        }, {
                options = {
                    {
                        event = "qb-burgershot-menu:Burgers",
                        icon = "fas fa-cheeseburger",
                        label = "Burger Work Station",
                        job = Config.Job,
                    },
                },
                distance = 1.5
            })


        exports['qb-target']:AddBoxZone("BurgerShot_register_1", vector3(-1196.01, -891.34, 14.0), 0.5, 0.4, {
            name="BurgerShot_register_1",
            debugPoly=false,
            heading=125,
            minZ=14.0,
            maxZ=14.5,
        }, {
                options = {
                    {
                        event = "qb-burgershot:bill",
                        parms = "1",
                        icon = "fas fa-credit-card",
                        label = "Facturer le Client",
                        job = Config.Job,
                    },
                },
                distance = 1.5
            })

        exports['qb-target']:AddBoxZone("BurgerShot_register_2", vector3(-1194.65, -893.3, 14.0), 0.6, 0.5, {
            name="BurgerShot_register_2",
            debugPoly=false,
            heading=302,
            minZ=14.1,
            maxZ=14.5,
            }, {
                    options = {
                        {
                            event = "qb-burgershot:bill",
                            parms = "2",
                            icon = "fas fa-credit-card",
                            label = "Facturer le Client",
                            job = Config.Job,
                        },
                    },
                    distance = 1.5
                })  


        exports['qb-target']:AddBoxZone("BurgerShot_register_3", vector3(-1193.39, -895.22, 14.0), 0.6, 0.4, {
            name="BurgerShot_register_3",
            debugPoly=false,
            heading=125,
            minZ=14.0,
            maxZ=14.4,
                    }, {
                            options = {
                                {
                                    event = "qb-burgershot:bill",
                                    parms = "3",
                                    icon = "fas fa-credit-card",
                                    label = "Facturer le Client",
                                    job = Config.Job,
                                },
                            },
                            distance = 1.5
                        })  




        exports['qb-target']:AddBoxZone("BurgerShot_register_4", vector3(-1192.52, -906.65, 14.0), 0.5, 0.5, {
            name="BurgerShot_register_4",
            heading=0,
            debugPoly=false,
            minZ=13.8,
            maxZ=14.2,
                }, {
                        options = {
                            {
                                event = "qb-burgershot:bill",
                                parms = "4",
                                icon = "fas fa-credit-card",
                                label = "Facturer le Client",
                                job = Config.Job,
                            },
                        },
                        distance = 1.5
            })

end)


-- QB-MENU --

RegisterNetEvent('qb-burgershot-menu:Burgers', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Burgers Disponibles |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Moneyshot Burger",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:MoneyShot"
            }
        },
        {
            
            header = "• Meat Free Burger",
            txt = "Bun , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:MeatFree"
            }
        },
        {
            
            header = "• Bleeder Burger",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:BleederBurger"
            }
        },
        {
            
            header = "• The Heart Stopper",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:HeartStopper"
            }
        },
        {
            
            header = "• Torpedo Roll",
            txt = "Bun , Cooked Meat",
            params = {
                event = "qb-burgershot:Torpedo"
            }
        },
        {
            
            header = "• Murder Meal",
            txt = "The Heart Stopper, Fries and SoftDrink",
            params = {
                event = "qb-burgershot:CreateMurderMeal"
            }
        },
        {
            id = 7,
            header = "Fermer (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)


RegisterNetEvent('qb-burgershot-menu:OrderMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Frigo |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Acheter Ingrédients",
            txt = "Order New Ingredients!",
            params = {
                event = "qb-burgershot:shop"
            }
        },
        {
           
            header = "• Ouvrir Frigo",
            txt = "See what you have in storage",
            params = {
                event = "qb-burgershot:Storage2"
            }
        },
        {
            header = "Fermer (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)

RegisterNetEvent('qb-burgershot-menu:DrinkMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            id = 0,
            header = "| Menu Boissons |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Soft Drinks",
            txt = "Soda Syrup",
            params = {
                event = "qb-burgershot:SoftDrink"
            }
        },
        {
            
            header = "• Milkshakes",
            txt = "Milkshake Formula",
            params = {
                event = "qb-burgershot:mShake"
            }
        },
        {
           
            header = "Fermer (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)


-- Till Stuff --
RegisterNetEvent("qb-burgershot:bill")
AddEventHandler("qb-burgershot:bill", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Create Receipt",
		submitText = "Bill",
        inputs = {
            {
                text = "ID(#)",
				name = "citizenid", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "Montant Facture ($)", -- text you want to be displayed as a place holder
                name = "billprice", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                isRequired = false -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
			
        }
    })
    if bill ~= nil then
        if bill.citizenid == nil or bill.billprice == nil then 
            return 
        end
        TriggerServerEvent("qb-burgershot:bill:player", bill.citizenid, bill.billprice)
    end
end)

