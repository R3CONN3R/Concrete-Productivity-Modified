local space_age_enabled = 	data.raw["recipe"]["concrete-from-molten-iron"] ~= nil
local dectorio_enabled = 	data.raw["recipe"]["dect-concrete-grid"] ~= nil

if dectorio_enabled and space_age_enabled then
	data:extend(
	{
		{
			-- Concrete grid
			type = "recipe",
			name = "dect-concrete-grid",
			energy_required = 10,
			enabled = false,
			category = "crafting-with-fluid-or-metallurgy",
			ingredients = {
				{type = "item", name = "stone-brick", amount = 5},
				{type = "item", name = "iron-ore", amount = 1},
				{type = "fluid", name = "water", amount = 100}
			},
			results = {
				{type = "item", name = "dect-concrete-grid", amount = 10},
			}
			
		},  
		-- {
		-- 	type = "recipe",
		-- 	name = "refined-concrete",
		-- 	energy_required = 15,
		-- 	enabled = false,
		-- 	category = "crafting-with-fluid",
		-- 	ingredients =
		-- 	{
		-- 	  {type = "item", name = "concrete", amount = 20},
		-- 	  {type = "item", name = "iron-stick", amount = 8},
		-- 	  {type = "item", name = "steel-plate", amount = 1},
		-- 	  {type = "fluid", name = "water", amount = 100}
		-- 	},
		-- 	results = {{type="item", name="refined-concrete", amount=10}}
		--   },
		-- {
		-- 	-- Refinde Concrete
		-- 	type = "recipe",
		-- 	name = "refined-concrete",
		-- 	energy_required = 15,
		-- 	enabled = false,
		-- 	category = "crafting-with-fluid-or-metallurgy",
		-- 	ingredients = {
		-- 		{type = "item", name = "stone-brick", amount = 5},
		-- 		{type = "item", name = "iron-ore", amount = 1},
		-- 		{type = "fluid", name = "water", amount = 100}
		-- 	},
		-- 	results = {
		-- 		{type = "item", name = "dect-concrete-grid", amount = 10},
		-- 	}
			
		-- }
	}
)
end