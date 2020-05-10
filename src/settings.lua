local util = require("util")

local setting_names = {
  "items",
  "iron-ore",
  "coal",
  "stone",
  "uranium-ore",
  "copper-ore",
  "armors",
  "weapons",
  "vehicles",
  "science",
  "other",
  "utility-sprites"
}

data:extend(util.map(function(name)
  return {
    type = "bool-setting",
    name = "emojitorio-change-" .. name,
    setting_type = "startup",
    default_value = true
  }
end, setting_names))
