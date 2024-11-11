/decl/hierarchy/outfit/job/church
	l_ear = /obj/item/device/radio/headset/church
	id_type = /obj/item/weapon/card/id/church
	pda_type = /obj/item/modular_computer/pda/church
	hierarchy_type = /decl/hierarchy/outfit/job/church
	backpack_contents = list(/obj/item/weapon/book/ritual/cruciform = 1)

/decl/hierarchy/outfit/job/church/New()
	..()
	BACKPACK_OVERRIDE_NEOTHEOLOGY

/decl/hierarchy/outfit/job/church/confessor
	name = OUTFIT_JOB_NAME("Hospitaller - Confessor")
	l_ear = /obj/item/device/radio/headset/heads/preacher
	id_type = /obj/item/weapon/card/id/chaplain
	uniform = /obj/item/clothing/under/rank/preacher
	suit = /obj/item/clothing/suit/storage/chaplain
	shoes = /obj/item/clothing/shoes/reinforced
	gloves = /obj/item/clothing/gloves/thick
	backpack_contents = list(/obj/item/weapon/book/ritual/cruciform/priest = 1, /obj/item/weapon/storage/box/flashbangs = 1, /obj/item/weapon/melee/telebaton = 1)

/decl/hierarchy/outfit/job/church/broknight
	name = OUTFIT_JOB_NAME("Hospitaller - Brother-Knight")
	l_ear = /obj/item/device/radio/headset/church
	id_type = /obj/item/weapon/card/id/chaplain
	uniform = /obj/item/clothing/under/rank/acolyte
	suit = /obj/item/clothing/suit/space/void/knight
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/thick
	backpack_contents = list(/obj/item/weapon/book/ritual/cruciform/priest = 1, /obj/item/weapon/storage/box/flashbangs = 1)

/decl/hierarchy/outfit/job/church/brosarge
	name = OUTFIT_JOB_NAME("Hospitaller - Brother-Sergeant")
	l_ear = /obj/item/device/radio/headset/church
	id_type = /obj/item/weapon/card/id/chaplain
	uniform = /obj/item/clothing/under/rank/acolyte
	suit = /obj/item/clothing/suit/space/void/medarmor/sarge
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/thick
	backpack_contents = list(/obj/item/weapon/book/ritual/cruciform/priest = 1, /obj/item/weapon/storage/box/flashbangs = 1)

/decl/hierarchy/outfit/job/church/brocorp
	name = OUTFIT_JOB_NAME("Hospitaller - Brother-Corporal")
	l_ear = /obj/item/device/radio/headset/church
	id_type = /obj/item/weapon/card/id/chaplain
	uniform = /obj/item/clothing/under/rank/acolyte
	suit = /obj/item/clothing/suit/space/void/medarmor
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/thick
	backpack_contents = list(/obj/item/weapon/book/ritual/cruciform/priest = 1, /obj/item/weapon/storage/firstaid/combat = 1)

/decl/hierarchy/outfit/job/church/chaplain
	name = OUTFIT_JOB_NAME("Hospitaller - Chaplain")
	uniform = /obj/item/clothing/under/rank/preacher
	shoes = /obj/item/clothing/shoes/reinforced
	gloves = /obj/item/clothing/gloves/thick
