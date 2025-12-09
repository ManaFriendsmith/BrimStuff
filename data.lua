if mods["space-age"] and not mods["pf-sa-compat"] then
    error("BrimStuff requires PF Space Age compatibility (pf-sa-compat) to work with Space Age. Please download and enable that mod to continue.")
end

require("prototypes.surface-property")
require("prototypes.ore")
require("prototypes.particle")
require("prototypes.burner-chemical-plant")
require("prototypes.greenhouse")
require("prototypes.items-fluids")
require("prototypes.technology")
require("prototypes.recipe")
require("prototypes.scrap-compat")
