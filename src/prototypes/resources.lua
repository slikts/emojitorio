local util = require('util')

require('prototypes.emoji-ore')

local function update_ore_item(item_name, icon_name)
  local icon = util.icon(icon_name)

  util.update(
    data.raw.item[item_name],
    {
      icon = icon,
      pictures = {
        { size = 64, filename = icon, scale = 0.25, mipmap_count = 4 },
      }
    }
  )
end

update_ore_item('copper-ore', 'crab-ore')
update_ore_item('coal', 'pile-of-poo')
update_ore_item('stone', 'cut-of-meat')
update_ore_item('uranium-ore', 'turtle-ore')


local function update_ore_resource(resource_name, ore_name)
  local sheet = data.raw.resource[resource_name].stages.sheet
  
  sheet.filename = util.graphic("entity/" .. ore_name)
  sheet.hr_version.filename = util.graphic("entity/hr-" .. ore_name)
end

update_ore_resource("copper-ore", "crab-ore")
update_ore_resource("iron-ore", "emoji-ore")
update_ore_resource("stone", "meat-ore")
update_ore_resource("coal", "pile-of-poo")
update_ore_resource("uranium-ore", "turtle-ore")
