local util = require('util')

local filenames = util.concat({ util.icon('emoji-ore') }, util.map(function(i)
  return util.icon('emoji-ore-' .. i)
end, util.range(1, 15)))
local pictures = util.map(function(name)
  return {
    filename = name,
    size = 64,
    scale = 0.25,
    mipmap_count = 4
  }
end, filenames)

util.update(
  data.raw.item["iron-ore"],
  {
    icon = icon,
    pictures = pictures
  }
)
