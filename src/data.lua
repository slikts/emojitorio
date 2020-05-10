local util = require('util')

require("prototypes.resources")

local icon = util.icon
local raw = data.raw
local item = raw.item

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

raw["item-with-entity-data"]["car"].icon = icon("automobile")
raw["item-with-entity-data"]["tank"].icon = icon("tractor")

raw["repair-tool"]["repair-pack"].icon = icon("hammer-and-wrench")

raw.gun["pistol"].icon = icon("pistol")
raw.gun["submachine-gun"].icon = icon("banjo")
raw.gun["rocket-launcher"].icon = icon("bow-and-arrow")
raw.ammo["firearm-magazine"].icon = icon("pushpin")
raw.capsule["grenade"].icon = icon("bomb")

raw.armor["light-armor"].icon = icon("socks")
raw.armor["power-armor"].icon = icon("dress")
raw.armor["power-armor-mk2"].icon = icon("kimono")
raw.armor["heavy-armor"].icon = icon("briefs")
raw.armor["modular-armor"].icon = icon("t-shirt")

raw.fish.fish.icon = icon("fish")

raw.fluid.water.icon = icon("droplet")

raw.tool["automation-science-pack"].icon = icon("dollar")
raw.tool["logistic-science-pack"].icon = icon("euro")
raw.tool["chemical-science-pack"].icon = icon("pound")
raw.tool["production-science-pack"].icon = icon("yen")
raw.tool["military-science-pack"].icon = icon("safety-pin")
raw.tool["utility-science-pack"].icon = icon("crayon")

raw["night-vision-equipment"]["night-vision-equipment"].sprite.filename = icon("goggles")
raw["module"]["speed-module-3"].icon = icon("high-voltage-sign")

raw.beacon.beacon.icon = icon("bacon")

raw['utility-sprites'].default['electricity_icon_unplugged'].filename = icon('thinking-face')
