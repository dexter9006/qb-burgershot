A Burgershot for QBCore Framework

Preview : https://www.youtube.com/watch?v=9sLa6d6hUXY&t=42s

Please Note this is a Work in Progress , Code won't be 100% optimized. 
I used qTarget as Bt-target didn't work, might work now havn't tested.
Only Problem with qTarget is, it doesn't have any QBCore job functionality so the job = "burgershot" 
doesn't work, use Bt-target to resolve and change qtarget to bt-target in all the exports.




Please feel free to contribute or improve code will be much appreciated.
Join https://discord.gg/UsJecaukXa for support.



Requirements :

QB Framework - https://github.com/qbcore-framework/qb-core

PolyZone - https://github.com/mkafrin/PolyZone

bt-target - https://github.com/BerkieBb/bt-target

qtarget - https://github.com/QuantusRP/qtarget


Credits : 

Decisive Burgershot Job  - https://github.com/decisiveE/BurgerShotJob-for-qb/tree/main/decisive-job


To Do 
- Change Back to Bt-target


Insert into #qb-smallresources --> config.lua
```
Consumeables = {

--Food 

["burger-bleeder"] = math.random(35, 54),
["burger-moneyshot"] = math.random(35, 54),
["burger-torpedo"] = math.random(35, 54),
["burger-heartstopper"] = math.random(35, 54),
["burger-meatfree"] = math.random(35, 54),
["burger-fries"] = math.random(35, 54),


--Drinks
["burger-softdrink"] = math.random(40, 50),
["burger-mshake"] = math.random(40, 50),

} 
```

Insert into #QBCore - Shared.lua

Change icons for items and change description
```
QBShared.Items = {
-- Burger Shot
-- Food
	["burger-bleeder"] 				 = {["name"] = "burger-bleeder", 			 	["label"] = "Bleeder", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "bs_the-bleeder.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
	["burger-moneyshot"] 			 = {["name"] = "burger-moneyshot", 			 	["label"] = "Moneyshot", 				["weight"] = 300, 		["type"] = "item", 		["image"] = "bs_money-shot.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
	["burger-torpedo"] 				 = {["name"] = "burger-torpedo", 			 	["label"] = "Torpedo", 					["weight"] = 310, 		["type"] = "item", 		["image"] = "bs_torpedo.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
	["burger-heartstopper"] 		 = {["name"] = "burger-heartstopper", 			["label"] = "Heartstopper", 			["weight"] = 2500, 		["type"] = "item", 		["image"] = "bs_the-heart-stopper.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
	["burger-meatfree"] 		 	 = {["name"] = "burger-meatfree", 				["label"] = "MeatFree", 			["weight"] = 125, 		["type"] = "item", 			["image"] = "bs_meat-free.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
	["burger-fries"] 				 = {["name"] = "burger-fries", 			 	  	["label"] = "Fries", 				["weight"] = 125, 		["type"] = "item", 			["image"] = "bs_fries.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
		-- Drinks
	
	["burger-softdrink"] 			 = {["name"] = "burger-softdrink", 				["label"] = "Soft Drink", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_softdrink.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ice Cold Drink."},
	["burger-mshake"] 			     = {["name"] = "burger-mshake", 				["label"] = "Milkshake", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_milkshake.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Hand-scooped for you!"},
	
--Ingredients
	["burger-bun"] 				 	 = {["name"] = "burger-bun", 			 	  	["label"] = "Bun", 			["weight"] = 125, 		["type"] = "item", 					["image"] = "bs_bun.png", 		    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["burger-meat"] 				 = {["name"] = "burger-meat", 			 	  	["label"] = "Cooked Patty", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_patty.png", 		    	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["burger-lettuce"] 				 = {["name"] = "burger-lettuce", 			 	["label"] = "Lettuce", 				["weight"] = 125, 		["type"] = "item", 			["image"] = "bs_lettuce.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["burger-tomato"] 				 = {["name"] = "burger-tomato", 			 	["label"] = "Tomato", 				["weight"] = 125, 		["type"] = "item", 			["image"] = "bs_tomato.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["burger-raw"] 				 	 = {["name"] = "burger-raw", 			 		["label"] = "Raw Patty", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_patty_raw.png", 	        ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["burger-potato"] 				 = {["name"] = "burger-potato", 			 	["label"] = "Bag of Potatoes", 		["weight"] = 1500, 		["type"] = "item", 			["image"] = "bs_potato.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["burger-mshakeformula"] 		 = {["name"] = "burger-mshakeformula", 			["label"] = "Milkshake Formula", 		["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_ingredients_icecream.png", ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["burger-sodasyrup"] 		 	 = {["name"] = "burger-sodasyrup", 				["label"] = "Soda Syrup", 		["weight"] = 125, 		["type"] = "item", 				["image"] = "bs_ingredients_hfcs.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
}

```

```
QBShared.Jobs = {
    ["burgershot"] = {
		label = "Burgershot Employee",
		defaultDuty = true,
		bossmenu = vector3(0, 0, 0),
		grades = {
            ['0'] = {
                name = "Trainee",
                payment = 50
            },
			['1'] = {
                name = "Employee",
                payment = 75
            },
			['2'] = {
                name = "Burger Flipper",
                payment = 100
            },
			['3'] = {
                name = "Manager",
                payment = 125
            },
			['4'] = {
                name = "CEO",
				isboss = true,
                payment = 150
            },
        },
	},
}		
```



