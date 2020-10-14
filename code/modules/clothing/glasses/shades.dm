/obj/item/clothing/glasses/hud/health/shades
	name = "Augmented Health Scanner Shades"
	desc = "A heads-up display that scans the humanoids in view and provides accurate data about their health status."
	icon_state = "medshades"
	item_state = "medshades"
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1)

/obj/item/clothing/glasses/hud/security/shades
	name = "Augmented Security Shades"
	desc = "A heads-up display that scans the humanoids in view and provides accurate data about their ID status and security records."
	icon_state = "secshades"
	item_state = "secshades"
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1)

/obj/item/clothing/glasses/shades/night
	name = "Augmented Night Vision Shades"
	desc = "You can totally see in the dark now!"
	icon_state = "nightshades"
	item_state = "nightshades"
	darkness_view = 7
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	origin_tech = list(TECH_MAGNET = 3)
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1, MATERIAL_SILVER = 0.5)

/obj/item/clothing/glasses/shades/night/Initialize()
	. = ..()
	screenOverlay = global_hud.nvg

/obj/item/clothing/glasses/shades/thermal
	name = "Augmented Thermal Shades"
	desc = "Thermals in the shape of glasses."
	icon_state = "thermalshades"
	item_state = "thermalshades"
	vision_flags = SEE_MOBS
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	flash_protection = FLASH_PROTECTION_REDUCED
	origin_tech = list(TECH_MAGNET = 3, TECH_COVERT = 4)
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1, MATERIAL_DIAMOND = 1)

/obj/item/clothing/glasses/shades/thermal/Initialize()
	. = ..()
	screenOverlay = global_hud.thermal