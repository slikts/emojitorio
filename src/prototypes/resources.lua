local util = require('util')

require('prototypes.emoji-ore')

local function update_ore(item_name, icon_name)
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

update_ore('copper-ore', 'crab-ore')
update_ore('coal', 'pile-of-poo')
update_ore('stone', 'cut-of-meat')
update_ore('uranium-ore', 'turtle-ore')

local resource = data.raw.resource

resource['copper-ore'].stages.sheet.filename = "__Emojitorio__/graphics/entity/crab-ore.png"
resource['copper-ore'].stages.sheet.hr_version.filename = "__Emojitorio__/graphics/entity/hr-crab-ore.png"

resource['iron-ore'].stages.sheet.filename = "__Emojitorio__/graphics/entity/emoji-ore.png"
resource['iron-ore'].stages.sheet.hr_version.filename = "__Emojitorio__/graphics/entity/hr-emoji-ore.png"

resource['stone'].stages.sheet.filename = "__Emojitorio__/graphics/entity/meat-ore.png"
resource['stone'].stages.sheet.hr_version.filename = "__Emojitorio__/graphics/entity/hr-meat-ore.png"

resource['coal'].stages.sheet.filename = "__Emojitorio__/graphics/entity/pile-of-poo.png"
resource['coal'].stages.sheet.hr_version.filename = "__Emojitorio__/graphics/entity/hr-pile-of-poo.png"

resource['uranium-ore'].stages.sheet.filename = "__Emojitorio__/graphics/entity/turtle-ore.png"
resource['uranium-ore'].stages.sheet.hr_version.filename = "__Emojitorio__/graphics/entity/hr-turtle-ore.png"
