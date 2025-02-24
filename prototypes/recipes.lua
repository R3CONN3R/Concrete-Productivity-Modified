-- local space_age_enabled = data.raw["recipe"]["concrete-from-molten-iron"] ~= nil
-- local dectorio_enabled = data.raw["recipe"]["dect-concrete-grid"] ~= nil
if mods["space-age"] and mods["dectorio"] then
	-- if dectorio_enabled and space_age_enabled then
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
					{ type = "item",  name = "stone-brick", amount = 5 },
					{ type = "item",  name = "iron-ore",    amount = 1 },
					{ type = "fluid", name = "water",       amount = 100 }
				},
				results = {
					{ type = "item", name = "dect-concrete-grid", amount = 10 },
				}

			}
		}
	)
end
