local util = require('util')

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
local function update_ore_resource(resource_name, ore_name)
  local sheet = data.raw.resource[resource_name].stages.sheet

  sheet.filename = util.graphic("entity/" .. ore_name)
  sheet.hr_version.filename = util.graphic("entity/hr-" .. ore_name)
end

if (util.setting("change-iron-ore")) then
  require('prototypes.emoji-ore')
  update_ore_resource("iron-ore", "emoji-ore")
end

if (util.setting("change-copper-ore")) then
  update_ore_item('copper-ore', 'crab-ore')
  update_ore_resource("copper-ore", "crab-ore")
end

if (util.setting("change-coal")) then
  update_ore_item('coal', 'pile-of-poo')
  update_ore_resource("coal", "pile-of-poo")
end

if (util.setting("change-stone")) then
  update_ore_item('stone', 'cut-of-meat')
  update_ore_resource("stone", "meat-ore")
end

if (util.setting("change-uranium-ore")) then
  update_ore_item('uranium-ore', 'turtle-ore')
  update_ore_resource("uranium-ore", "turtle-ore")
end
