local util = require('util')

local icon = "__Emojitorio__/graphics/icons/crab-ore.png"

util.update(
  data.raw.item['copper-ore'],
  {
    icon = icon,
    pictures = {
      { size = 64, filename = icon, scale = 0.25, mipmap_count = 4 },
    }
  }
)
