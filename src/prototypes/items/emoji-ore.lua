local util = require('util')

local icon_prefix = "__Emojitorio__/graphics/icons/emoji-ore"
local icon = icon_prefix .. ".png"
local _filenames = util.map(function(i)
  return icon_prefix .. '-' .. i .. '.png'
end, util.range(1, 20))
local filenames = util.concat({ icon }, _filenames)
local pictures = util.map(function(name)
  return {
    filename = name,
    size = 64,
    scale = 0.25,
    mipmap_count = 4
  }
end, filenames)

print(serpent.block(pictures))

util.update(
  data.raw.item["iron-ore"],
  {
    icon = icon,
    pictures = pictures
  }
)
