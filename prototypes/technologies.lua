
local space_age_enabled = 	data.raw["recipe"]["concrete-from-molten-iron"] ~= nil
local dectorio_enabled = 	data.raw["recipe"]["dect-concrete-grid"] ~= nil

local effects_with_concrete = {
	{
		type = "change-recipe-productivity",
		recipe = "concrete",
		change = 0.25
	},
	{
		type = "change-recipe-productivity",
		recipe = "refined-concrete",
		change = 0.25
	}
}

if space_age_enabled then
	table.insert(effects_with_concrete, {
		type = "change-recipe-productivity",
		recipe = "concrete-from-molten-iron",
		change = 0.25
	}
	)
end

if dectorio_enabled then
	table.insert(effects_with_concrete, {
		type = "change-recipe-productivity",
		recipe = "dect-concrete-grid",
		change = 0.25
	}
	)
end

data:extend({
    {
		type = "technology",
		name = myTechName .. "1",
		icons = {
			{
				icon = myModName .. "/graphics/technologies/concrete-productivity-modified.png",
				icon_size = 256
			},
			{
				icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png",
				icon_size = 128,
				scale = 0.5,
				shift = {50, 50}
			}
		},
		effects = effects_with_concrete,
		prerequisites = {
			"concrete",
			"chemical-science-pack"
		},
		unit = {
			count = 500,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1}
			},
			time = 30
		},
		upgrade = true
	},
    {
		type = "technology",
		name = myTechName .. "2",
		icons = {
			{
				icon = myModName .. "/graphics/technologies/concrete-productivity-modified.png",
				icon_size = 256
			},
			{
				icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png",
				icon_size = 128,
				scale = 0.5,
				shift = {50, 50}
			}
		},
		effects = effects_with_concrete,
		prerequisites = {
			myTechName .. "1",
			"production-science-pack"
		},
		unit = {
			count = 500,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"production-science-pack", 1}
			},
			time = 60
		},
		upgrade = true
	},
    {
		type = "technology",
		name = myTechName .. "3",
		icons = {
			{
				icon = myModName .. "/graphics/technologies/concrete-productivity-modified.png",
				icon_size = 256
			},
			{
				icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png",
				icon_size = 128,
				scale = 0.5,
				shift = {50, 50}
			}
		},
		effects = effects_with_concrete,
		prerequisites = {
			myTechName .. "2",
			"utility-science-pack"
		},
		unit = {
			count = 500,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"utility-science-pack",1}
			},
			time = 60
		},
		upgrade = true
	},    
    {
		type = "technology",
		name = myTechName .. "4",
		icon_size = 256,
		icons = {
			{
				icon = myModName .. "/graphics/technologies/concrete-productivity-modified.png",
				icon_size = 256
			},
			{
				icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png",
				icon_size = 128,
				scale = 0.5,
				shift = {50, 50}
			}
		},
		effects = effects_with_concrete,
		prerequisites = {
			myTechName .. "3",
			myTechName .. "2",
			"space-science-pack"
		},
		unit = {
			count_formula = "(L-3)*1000",
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"utility-science-pack", 1},
				{"production-science-pack", 1},
				{"space-science-pack", 1}
			},
			time = 60
		},
		max_level = "infinite",
		upgrade = true
	}
})