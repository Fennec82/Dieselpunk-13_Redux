#define OBELISK_UPDATE_TIME 5 SECONDS

var/list/disciples = list()

/obj/item/weapon/implant/core_implant/cruciform
	name = "vinculum cruciform"
	icon_state = "cruciform_green"
	desc = "A symbol and power core of every disciple. With the proper rituals, this can be implanted to accept a new Novice into the Orden Hospitaller."
	allowed_organs = list(BP_CHEST)
	implant_type = /obj/item/weapon/implant/core_implant/cruciform
	layer = ABOVE_MOB_LAYER
	access = list(access_morgue, access_crematorium, access_maint_tunnels, access_hydroponics, access_nt_disciple)
	power = 75
	max_power = 75
	power_regen = 0.5
	price_tag = 10000

/obj/item/weapon/implant/core_implant/cruciform/install(mob/living/target, organ, mob/user)
	. = ..()
	if(.)
		target.stats.addPerk(/datum/perk/sanityboost)
		target.stats.addPerk(/datum/perk/unfinished_delivery)

/obj/item/weapon/implant/core_implant/cruciform/uninstall()
	wearer.stats.removePerk(/datum/perk/sanityboost)
	wearer.stats.addPerk(/datum/perk/unfinished_delivery)
	return ..()

/obj/item/weapon/implant/core_implant/cruciform/get_mob_overlay(gender, form)
	gender = (gender == MALE) ? "m" : "f"
	return image('icons/mob/human_races/cyberlimbs/neotheology.dmi', "[icon_state]_[gender]")

/obj/item/weapon/implant/core_implant/cruciform/hard_eject()
	if(!ishuman(wearer))
		return
	var/mob/living/carbon/human/H = wearer
	name = "[H]'s Cruciform" //This is included here to make it obvious who a cruciform belonged to if it was surgically removed
	if(H.stat == DEAD || H.stat == UNCONSCIOUS)
		return
	if(!active)
		return
	H.adjustBrainLoss(55+rand(5))
	H.adjustOxyLoss(100+rand(50))
	if(part)
		H.apply_damage(100+rand(75), BURN, part)
	var/datum/effect/effect/system/spark_spread/s = new
	s.set_up(3, 1, src)
	s.start()

/obj/item/weapon/implant/core_implant/cruciform/activate()
	if(!wearer || active)
		return

	if(is_carrion(wearer))
		playsound(wearer.loc, 'sound/hallucinations/wail.ogg', 55, 1)
		wearer.gib()
		return
	..()
	add_module(new CRUCIFORM_COMMON)
	if(path == "tess")
		add_module(new CRUCIFORM_TESS)
	if(path == "lemn")
		add_module(new CRUCIFORM_LEMN)
	if(path == "mono")
		add_module(new CRUCIFORM_MONO)
	if(path == "divi")
		add_module(new CRUCIFORM_DIVI)
	update_data()
	disciples |= wearer
	return TRUE


/obj/item/weapon/implant/core_implant/cruciform/deactivate()
	if(!active || !wearer)
		return
	make_common()
	disciples.Remove(wearer)
	..()

/obj/item/weapon/implant/core_implant/cruciform/Process()
	..()
	if(active && round(world.time) % 5 == 0)
		remove_cyber()
	if(wearer && wearer.stat == DEAD)
		deactivate()


/obj/item/weapon/implant/core_implant/cruciform/proc/transfer_soul()
	if(!wearer || !activated)
		return FALSE
	var/datum/core_module/cruciform/cloning/data = get_module(CRUCIFORM_CLONING)
	if(wearer.dna.unique_enzymes == data.dna.unique_enzymes)
		for(var/mob/M in GLOB.player_list)
			if(M.ckey == data.ckey)
				if(M.stat != DEAD)
					return FALSE
		var/datum/mind/MN = data.mind
		if(!istype(MN, /datum/mind))
			return
		MN.transfer_to(wearer)
		wearer.ckey = data.ckey
		for(var/datum/language/L in data.languages)
			wearer.add_language(L.name)
		update_data()
		if (activate())
			return TRUE


/obj/item/weapon/implant/core_implant/cruciform/proc/remove_cyber()
	if(!wearer)
		return
	for(var/obj/O in wearer)
/* //Our lore allows for church members to have synthetics so this area is commented out. -Kazkin
		if(istype(O, /obj/item/organ/external))
			var/obj/item/organ/external/R = O
			if(!BP_IS_ROBOTIC(R))
				continue

			if(R.owner != wearer)
				continue
			wearer.visible_message(SPAN_DANGER("[wearer]'s [R.name] tears off."),
			SPAN_DANGER("Your [R.name] tears off."))
			R.droplimb()
*/
//This is the function to remove excelsior implants for cruciform bearers. Should only make cruciform bearers react badly to excelsior implants. -Kaz
		if(istype(O, /obj/item/weapon/implant/excelsior))
			if(O == src)
				continue
			var/obj/item/weapon/implant/excelsior/R = O
			if(R.wearer != wearer)
				continue
			if(R.cruciform_resist)
				continue
			wearer.visible_message(SPAN_DANGER("[R.name] rips through [wearer]'s [R.part]."),\
			SPAN_DANGER("[R.name] rips through your [R.part]."))
			R.part.take_damage(rand(20,40))
			R.uninstall()
			R.malfunction = MALFUNCTION_PERMANENT
	if(ishuman(wearer))
		var/mob/living/carbon/human/H = wearer
		H.update_implants()


/obj/item/weapon/implant/core_implant/cruciform/proc/update_data()
	if(!wearer)
		return

	add_module(new CRUCIFORM_CLONING)


//////////////////////////
//////////////////////////

/obj/item/weapon/implant/core_implant/cruciform/proc/make_common()
	remove_modules(CRUCIFORM_PRIEST)
	remove_modules(CRUCIFORM_SQUIRE)
	remove_modules(CRUCIFORM_SERGEANT)
	remove_modules(CRUCIFORM_KNIGHT)
	remove_modules(CRUCIFORM_INQUISITOR)
	remove_modules(/datum/core_module/cruciform/red_light)

/obj/item/weapon/implant/core_implant/cruciform/proc/make_priest()
	add_module(new CRUCIFORM_PRIEST)
	add_module(new CRUCIFORM_REDLIGHT)

/obj/item/weapon/implant/core_implant/cruciform/proc/make_squire()
	remove_modules(CRUCIFORM_PRIEST)
	add_module(new CRUCIFORM_PRIEST)
	add_module(new CRUCIFORM_SQUIRE)
	add_module(new CRUCIFORM_REDLIGHT)

/obj/item/weapon/implant/core_implant/cruciform/proc/make_sergeant()
	remove_modules(CRUCIFORM_PRIEST)
	remove_modules(CRUCIFORM_SQUIRE)
	add_module(new CRUCIFORM_PRIEST)
	add_module(new CRUCIFORM_SQUIRE)
	add_module(new CRUCIFORM_SERGEANT)
	add_module(new CRUCIFORM_REDLIGHT)

/obj/item/weapon/implant/core_implant/cruciform/proc/make_knight()
	remove_modules(CRUCIFORM_PRIEST)
	remove_modules(CRUCIFORM_SQUIRE)
	remove_modules(CRUCIFORM_SERGEANT)
	add_module(new CRUCIFORM_PRIEST)
	add_module(new CRUCIFORM_SQUIRE)
	add_module(new CRUCIFORM_SERGEANT)
	add_module(new CRUCIFORM_KNIGHT)
	add_module(new CRUCIFORM_REDLIGHT)

/obj/item/weapon/implant/core_implant/cruciform/proc/make_inquisitor()
	remove_modules(CRUCIFORM_PRIEST)
	remove_modules(CRUCIFORM_SQUIRE)
	remove_modules(CRUCIFORM_SERGEANT)
	remove_modules(CRUCIFORM_KNIGHT)
	add_module(new CRUCIFORM_PRIEST)
	add_module(new CRUCIFORM_SQUIRE)
	add_module(new CRUCIFORM_SERGEANT)
	add_module(new CRUCIFORM_KNIGHT)
	add_module(new CRUCIFORM_INQUISITOR)
	add_module(new /datum/core_module/cruciform/uplink())
	remove_modules(/datum/core_module/cruciform/red_light)

//Path based cruciforms, these grant additional powers based on what path a cultist walks
/obj/item/weapon/implant/core_implant/cruciform/tessellate
	name = "cleric cruciform"
	icon_state = "cruciform_blue"
	desc = "A symbol and power core of every disciple. With the proper rituals, this can be implanted to accept a new Novice into the Orden Hospitaller."
	implant_type = /obj/item/weapon/implant/core_implant/cruciform/tessellate
	power = 60
	max_power = 60
	power_regen = 1
	path = "tess"

/obj/item/weapon/implant/core_implant/cruciform/lemniscate
	name = "cantor cruciform"
	icon_state = "cruciform_red"
	desc = "A symbol and power core of every disciple. With the proper rituals, this can be implanted to accept a new Novice into the Orden Hospitaller."
	implant_type = /obj/item/weapon/implant/core_implant/cruciform/lemniscate
	power = 50
	max_power = 50
	power_regen = 1.5
	path = "lemn"

/obj/item/weapon/implant/core_implant/cruciform/monomial
	name = "paladin cruciform"
	icon_state = "cruciform_yellow"
	desc = "A symbol and power core of every disciple. With the proper rituals, this can be implanted to accept a new Novice into the Orden Hospitaller."
	implant_type = /obj/item/weapon/implant/core_implant/cruciform/monomial
	power = 100
	max_power = 100
	power_regen = 0.25
	path = "mono"

/obj/item/weapon/implant/core_implant/cruciform/divisor
	name = "templar cruciform"
	icon_state = "cruciform_orange"
	desc = "A symbol and power core of every disciple. With the proper rituals, this can be implanted to accept a new Novice into the Orden Hospitaller."
	implant_type = /obj/item/weapon/implant/core_implant/cruciform/divisor
	power = 50
	max_power = 50
	power_regen = 0.75
	path = "divi"
