local util = require('util')

local icon = util.icon
local raw = data.raw
local item = raw.item

require("prototypes.resources")

if (util.setting("change-items")) then
  item["copper-plate"].icon = icon("crab-card")
  item["iron-plate"].icon = icon("floppy-disk")
  item["steel-plate"].icon = icon("e-mail-symbol")
  item["iron-stick"].icon = icon("spoon")
  item["iron-gear-wheel"].icon = icon("gear")
  item["electronic-circuit"].icon = icon("heavy-check-mark")
  item["advanced-circuit"].icon = icon("cross-mark")
  item["battery"].icon = icon("battery")
  item["satellite"].icon = icon("hundred-points-symbol")
  item["explosives"].icon = icon("firecracker")
  item["computer"].icon = icon("abacus")
  item["plastic-bar"].icon = icon("roll-of-paper")
  item["sulfur"].icon = icon("bar-of-soap")
  item["rocket-control-unit"].icon = icon("pager")
  item["processing-unit"].icon = icon("electric-light-bulb")
  item["low-density-structure"].icon = icon("scroll")
  item["night-vision-equipment"].icon = icon("goggles")
  item["copper-cable"].icon = icon("crab-cable")
  item["wood"].icon = icon("aubergine")
  item["beacon"].icon = icon("bacon")
end

if (util.setting("change-vehicles")) then
  raw["item-with-entity-data"]["car"].icon = icon("automobile")
  raw["item-with-entity-data"]["tank"].icon = icon("tractor")
end

if (util.setting("change-weapons")) then
  raw.gun["pistol"].icon = icon("pistol")
  raw.gun["submachine-gun"].icon = icon("banjo")
  raw.gun["rocket-launcher"].icon = icon("bow-and-arrow")
  raw.ammo["firearm-magazine"].icon = icon("pushpin")
  raw.capsule["grenade"].icon = icon("bomb")
end

if (util.setting("change-armors")) then
  raw.armor["light-armor"].icon = icon("socks")
  raw.armor["power-armor"].icon = icon("martial-arts-uniform")
  raw.armor["power-armor-mk2"].icon = icon("kimono")
  raw.armor["heavy-armor"].icon = icon("briefs")
  raw.armor["modular-armor"].icon = icon("dress")
end

if (util.setting("change-other")) then
  raw.fish.fish.icon = icon("fish")
  raw["repair-tool"]["repair-pack"].icon = icon("hammer-and-wrench")
  raw["night-vision-equipment"]["night-vision-equipment"].sprite.filename = icon("goggles")
  raw["module"]["speed-module-3"].icon = icon("high-voltage-sign")
  raw.beacon.beacon.icon = icon("bacon")
  raw.fluid.water.icon = icon("droplet")
end

if (util.setting("change-science")) then
  raw.tool["automation-science-pack"].icon = icon("dollar")
  raw.tool["logistic-science-pack"].icon = icon("euro")
  raw.tool["chemical-science-pack"].icon = icon("pound")
  raw.tool["production-science-pack"].icon = icon("yen")
  raw.tool["military-science-pack"].icon = icon("safety-pin")
  raw.tool["utility-science-pack"].icon = icon("crayon")
end

if (util.setting("change-utility-sprites")) then
  raw['utility-sprites'].default['electricity_icon_unplugged'].filename = icon('thank')
  raw['utility-sprites'].default['ammo_icon'].filename = icon('anger-symbol')
  raw['utility-sprites'].default['fuel_icon'].filename = icon('anger-symbol')
  raw['utility-sprites'].default['too_far_from_roboport_icon'].filename = icon('antenna-with-bars')
  local ghost_cursor = raw['utility-sprites'].default['ghost_cursor']
  ghost_cursor.filename = util.graphic('ghost')
  ghost_cursor.size = 64
  ghost_cursor.scale = 0.5
end
