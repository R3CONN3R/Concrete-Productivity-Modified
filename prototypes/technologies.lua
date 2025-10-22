function slog(text)
	log(serpent.block(text))
end

local effects_with_concrete = {}

slog("CONC_PROD CHECKING RECIPES")

for _, recipe in pairs(data.raw["recipe"]) do
	if recipe.results ~= nil then
		if #recipe.results == 1 then
			for _, result in pairs(recipe.results) do
				if (result.name == "concrete" or result.name == "refined-concrete") and recipe.category ~= "recycling" then
					table.insert(effects_with_concrete, {
						type = "change-recipe-productivity",
						recipe = recipe.name,
						change = 0.25
					})
					slog("CONC_PROD_FOUND_RECIPE = " .. recipe.name)
				end
			end
		end
	end
end

slog("CONC_PROD_DONE_ADDING_RECIPES")

if mods["dectorio"] then
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
				shift = { 50, 50 }
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
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack",   1 },
				{ "chemical-science-pack",   1 }
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
				shift = { 50, 50 }
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
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack",   1 },
				{ "chemical-science-pack",   1 },
				{ "production-science-pack", 1 }
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
				shift = { 50, 50 }
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
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack",   1 },
				{ "chemical-science-pack",   1 },
				{ "utility-science-pack",    1 }
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
				shift = { 50, 50 }
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
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack",   1 },
				{ "chemical-science-pack",   1 },
				{ "utility-science-pack",    1 },
				{ "production-science-pack", 1 },
				{ "space-science-pack",      1 }
			},
			time = 60
		},
		max_level = "infinite",
		upgrade = true
	}
})
