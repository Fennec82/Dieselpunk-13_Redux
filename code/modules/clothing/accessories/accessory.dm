/*Ties*/

/obj/item/clothing/accessory
	name = "blue tie"
	desc = "A neosilk clip-on tie with a blue design."
	icon = 'icons/inventory/accessory/icon.dmi'
	icon_state = "bluetie"
	item_state = ""	//no inhands
	slot_flags = SLOT_ACCESSORY_BUFFER
	w_class = ITEM_SIZE_SMALL
	var/slot = "decor"
	var/obj/item/clothing/has_suit = null		//the suit the tie may be attached to
	var/image/inv_overlay = null	//overlay used when attached to clothing.
	var/image/mob_overlay = null
	var/overlay_state = null

/obj/item/clothing/accessory/Destroy()
	if(has_suit)
		on_removed()
	return ..()

/obj/item/clothing/accessory/proc/get_inv_overlay()
	if(!inv_overlay)
		if(!mob_overlay)
			get_mob_overlay()

		var/tmp_icon_state = "[overlay_state? "[overlay_state]" : "[icon_state]"]"
		if(icon_override)
			if("[tmp_icon_state]_tie" in icon_states(icon_override))
				tmp_icon_state = "[tmp_icon_state]_tie"
		inv_overlay = image(icon = mob_overlay.icon, icon_state = tmp_icon_state, dir = SOUTH)
	return inv_overlay

/obj/item/clothing/accessory/proc/get_mob_overlay()
	if(!mob_overlay)
		var/tmp_icon_state = "[overlay_state? "[overlay_state]" : "[icon_state]"]"
		if(icon_override)
			if("[tmp_icon_state]_mob" in icon_states(icon_override))
				tmp_icon_state = "[tmp_icon_state]_mob"
			mob_overlay = image("icon" = icon_override, "icon_state" = "[tmp_icon_state]")
		else
			mob_overlay = image("icon" = INV_ACCESSORIES_DEF_ICON, "icon_state" = "[tmp_icon_state]")
	return mob_overlay

//when user attached an accessory to S
/obj/item/clothing/accessory/proc/on_attached(var/obj/item/clothing/S, var/mob/user)
	if(!istype(S))
		return
	has_suit = S
	loc = has_suit
	has_suit.add_overlay(get_inv_overlay())

	to_chat(user, SPAN_NOTICE("You attach \the [src] to \the [has_suit]."))
	src.add_fingerprint(user)

/obj/item/clothing/accessory/proc/on_removed(var/mob/user)
	if(!has_suit)
		return
	has_suit.cut_overlay(get_inv_overlay())
	has_suit = null
	if(user)
		usr.put_in_hands(src)
		src.add_fingerprint(user)
	else
		src.forceMove(get_turf(src))

//default attackby behaviour
/obj/item/clothing/accessory/attackby(obj/item/I, mob/user)
	..()

//default attack_hand behaviour
/obj/item/clothing/accessory/attack_hand(mob/user as mob)
	if(has_suit)
		return	//we aren't an object on the ground so don't call parent
	..()

/obj/item/clothing/accessory/tie/black
	name = "black tie"
	desc = "A neosilk clip-on tie with a black design."
	icon_state = "blacktie"

/obj/item/clothing/accessory/tie/blue
	name = "blue tie"
	desc = "A neosilk clip-on tie with a blue design."
	icon_state = "bluetie"

/obj/item/clothing/accessory/tie/blueclip
	name = "blue clip tie"
	desc = "A neosilk clip-on tie with a striped blue design and clip."
	icon_state = "bluecliptie"

/obj/item/clothing/accessory/tie/bluestriped
	name = "blue striped tie"
	desc = "A neosilk clip-on tie with a striped blue design."
	icon_state = "bluelongtie"

/obj/item/clothing/accessory/tie/darkgreen
	name = "dark green tie"
	desc = "A neosilk clip-on tie with a dark green design."
	icon_state = "dgreentie"

/obj/item/clothing/accessory/tie/navy
	name = "navy tie"
	desc = "A neosilk clip-on tie with a navy design."
	icon_state = "navytie"

/obj/item/clothing/accessory/tie/red
	name = "red tie"
	desc = "A neosilk clip-on tie with a red design."
	icon_state = "redtie"

/obj/item/clothing/accessory/tie/redclip
	name = "red clip tie"
	desc = "A neosilk clip-on tie with a striped red design and clip."
	icon_state = "redcliptie"

/obj/item/clothing/accessory/tie/redstriped
	name = "red striped tie"
	desc = "A neosilk clip-on tie with a striped red design."
	icon_state = "redlongtie"

/obj/item/clothing/accessory/tie/white
	name = "white tie"
	desc = "A neosilk clip-on tie with a white design."
	icon_state = "whitetie"

/obj/item/clothing/accessory/tie/yellow
	name = "yellow tie"
	desc = "A neosilk clip-on tie with a yellow design."
	icon_state = "yellowtie"

/obj/item/clothing/accessory/tie
	name = "yellow large tie"
	desc = "A neosilk clip-on tie with a gaudy yellow design."
	icon_state = "horribletie"

/*Stethoscope*/

/obj/item/clothing/accessory/stethoscope
	name = "stethoscope"
	desc = "An outdated medical apparatus for listening to the sounds of the human body. It also makes you look like you know what you're doing."
	icon_state = "stethoscope"

/obj/item/clothing/accessory/stethoscope/attack(mob/living/carbon/human/M, mob/living/user)
	// TODO: baymed, rework this to use something like get_heartbeat()
	if(ishuman(M) && isliving(user))
		if(user.a_intent == I_HELP)
			var/body_part = parse_zone(user.targeted_organ)
			if(body_part)
				var/their = "their"
				switch(M.gender)
					if(MALE)	their = "his"
					if(FEMALE)	their = "her"

				var/sound = "heartbeat"
				var/sound_strength = "cannot hear"
				var/heartbeat = 0
				if(M.species && M.species.has_organ[BP_HEART])
					var/obj/item/organ/internal/heart/heart = M.internal_organs_by_name[BP_HEART]
					if(heart && !BP_IS_ROBOTIC(heart))
						heartbeat = 1
				if(M.stat == DEAD || (M.status_flags&FAKEDEATH))
					sound_strength = "cannot hear"
					sound = "anything"
				else
					switch(body_part)
						if(BP_CHEST)
							sound_strength = "hear"
							sound = "no heartbeat"
							if(heartbeat)
								var/obj/item/organ/internal/heart/heart = M.internal_organs_by_name[BP_HEART]
								if(!heart)
									return
								if(heart.is_bruised() || M.getOxyLoss() > 50)
									sound = "[pick("odd noises in","weak")] heartbeat"
								else
									sound = "healthy heartbeat"

							var/obj/item/organ/internal/heart/L = M.internal_organs_by_name[BP_LUNGS]
							if(!L || M.losebreath)
								sound += " and no respiration"
							else if(M.is_lung_ruptured() || M.getOxyLoss() > 50)
								sound += " and [pick("wheezing","gurgling")] sounds"
							else
								sound += " and healthy respiration"
						if(BP_EYES, BP_MOUTH)
							sound_strength = "cannot hear"
							sound = "anything"
						else
							if(heartbeat)
								sound_strength = "hear a weak"
								sound = "pulse"

				user.visible_message("[user] places [src] against [M]'s [body_part] and listens attentively.", "You place [src] against [their] [body_part]. You [sound_strength] [sound].")
	return ..(M,user)

/*Medals*/

/obj/item/clothing/accessory/medal
	name = "bronze medal"
	desc = "A bronze medal."
	icon_state = "bronze"
	price_tag = 250

/obj/item/clothing/accessory/medal/conduct
	name = "distinguished conduct medal"
	desc = "A bronze medal awarded for distinguished conduct. Whilst a great honor, this is most basic award on offer. It is often awarded by the council to a member of their crew."

/obj/item/clothing/accessory/medal/bronze_heart
	name = "bronze heart medal"
	desc = "A bronze heart-shaped medal awarded for sacrifice. It is often awarded posthumously or for severe injury in the line of duty."
	icon_state = "bronze_heart"

/obj/item/clothing/accessory/medal/nobel_science
	name = "nobel sciences award"
	desc = "A bronze medal which represents significant contributions to the field of science or engineering."

/obj/item/clothing/accessory/medal/silver
	name = "silver medal"
	desc = "A silver medal."
	icon_state = "silver"
	price_tag = 250

/obj/item/clothing/accessory/medal/silver/valor
	name = "medal of valor"
	desc = "A silver medal awarded for acts of exceptional valor."

/obj/item/clothing/accessory/medal/silver/security
	name = "robust security award"
	desc = "An award for distinguished combat and sacrifice in defence of the colony. Often awarded to security staff."

/obj/item/clothing/accessory/medal/gold
	name = "gold medal"
	desc = "A prestigious golden medal."
	icon_state = "gold"
	price_tag = 500

/obj/item/clothing/accessory/medal/gold/captain
	name = "medal of exceptional statecraft"
	desc = "A golden medal awarded exclusively to those who show distinguished duty as a premier. It signifies the codified responsibilities of the position and their undisputable qualities within it."

/obj/item/clothing/accessory/medal/gold/heroism
	name = "medal of exceptional heroism"
	desc = "An extremely rare golden medal awarded only by faction woners. To recieve such a medal is the highest honor and as such, very few exist. This medal is almost never awarded to anybody but commanders."

/*Scarves*/

/obj/item/clothing/accessory/scarf/black
	name = "black scarf"
	desc = "A stylish black scarf."
	icon_state = "blackscarf"

/obj/item/clothing/accessory/scarf/christmas
	name = "christmas scarf"
	desc = "A stylish red and green scarf."
	icon_state = "christmasscarf"

/obj/item/clothing/accessory/scarf/darkblue
	name = "dark blue scarf"
	desc = "A stylish dark blue scarf."
	icon_state = "darkbluescarf"

obj/item/clothing/accessory/scarf/green
	name = "green scarf"
	desc = "A stylish green scarf."
	icon_state = "greenscarf"

/obj/item/clothing/accessory/scarf/lightblue
	name = "light blue scarf"
	desc = "A stylish light blue scarf."
	icon_state = "lightbluescarf"

/obj/item/clothing/accessory/scarf/orange
	name = "orange scarf"
	desc = "A stylish orange scarf."
	icon_state = "orangescarf"

/obj/item/clothing/accessory/scarf/purple
	name = "purple scarf"
	desc = "A stylish purple scarf."
	icon_state = "purplescarf"

/obj/item/clothing/accessory/scarf/red
	name = "red scarf"
	desc = "A stylish red scarf."
	icon_state = "redscarf"

/obj/item/clothing/accessory/scarf/white
	name = "white scarf"
	desc = "A stylish white scarf."
	icon_state = "whitescarf"

/obj/item/clothing/accessory/scarf/yellow
	name = "yellow scarf"
	desc = "A stylish yellow scarf."
	icon_state = "yellowscarf"

/obj/item/clothing/accessory/scarf/zebra
	name = "zebra scarf"
	desc = "A stylish black and white scarf."
	icon_state = "zebrascarf"

/obj/item/clothing/accessory/scarf/furblack
	name = "black fur scarf"
	desc = "A furred scarf in a black color."
	icon_state = "furscarf_black"
	item_state = "furscarf_black"

/obj/item/clothing/accessory/scarf/furblue
	name = "blue fur scarf"
	desc = "A furred scarf in a blue color."
	icon_state = "furscarf_blue"
	item_state = "furscarf_blue"

/obj/item/clothing/accessory/scarf/furbrown
	name = "brown fur scarf"
	desc = "A furred scarf in a brown color."
	icon_state = "furscarf_brown"
	item_state = "furscarf_brown"

/obj/item/clothing/accessory/scarf/furcinnamon
	name = "cinnamon fur scarf"
	desc = "A furred scarf in a cinnamon color."
	icon_state = "furscarf_cinnamon"
	item_state = "furscarf_cinnamon"

/obj/item/clothing/accessory/scarf/furcream
	name = "cream fur scarf"
	desc = "A furred scarf in a cream color."
	icon_state = "furscarf_cream"
	item_state = "furscarf_cream"

/obj/item/clothing/accessory/scarf/furlbrown
	name = "light brown fur scarf"
	desc = "A furred scarf in a light brown color."
	icon_state = "furscarf_lbrown"
	item_state = "furscarf_lbrown"

/obj/item/clothing/accessory/scarf/furorange
	name = "orange fur scarf"
	desc = "A furred scarf in a orange color."
	icon_state = "furscarf_lasaga"
	item_state = "furscarf_lasaga"

/obj/item/clothing/accessory/scarf/furruddy
	name = "ruddy fur scarf"
	desc = "A furred scarf in a ruddy color."
	icon_state = "furscarf_ruddy"
	item_state = "furscarf_ruddy"

/obj/item/clothing/accessory/scarf/fursilver
	name = "silver fur scarf"
	desc = "A furred scarf in a silver color."
	icon_state = "furscarf_silver"
	item_state = "furscarf_silver"

/obj/item/clothing/accessory/scarf/neckblue
	name = "blue neck scarf"
	desc = "A blue neck scarf."
	icon_state = "blue_scarf"
	item_state = "blue_scarf"
	body_parts_covered = FACE
	item_flags = FLEXIBLEMATERIAL
	w_class = ITEM_SIZE_SMALL
	gas_transfer_coefficient = 0.90
	price_tag = 50

/obj/item/clothing/accessory/scarf/checkered
	name = "checkered neck scarf"
	desc = "A red and white checkered neck scarf."
	icon_state = "redwhite_scarf"
	item_state = "redwhite_scarf"

/obj/item/clothing/accessory/scarf/neckgreen
	name = "green neck scarf"
	desc = "A green neck scarf."
	icon_state = "green_scarf"
	item_state = "green_scarf"

/obj/item/clothing/accessory/scarf/neckred
	name = "red neck scarf"
	desc = "A red neck scarf."
	icon_state = "red_scarf"
	item_state = "red_scarf"

/obj/item/clothing/accessory/scarf/stripedblue
	name = "striped blue scarf"
	desc = "A striped blue scarf."
	icon_state = "stripedbluescarf"
	item_state = "stripedbluescarf"

/obj/item/clothing/accessory/scarf/stripedgreen
	name = "striped green scarf"
	desc = "A striped green scarf."
	icon_state = "stripedgreenscarf"
	item_state = "stripedgreenscarf"

/obj/item/clothing/accessory/scarf/stripedpurple
	name = "striped green scarf"
	desc = "A striped purple scarf."
	icon_state = "stripedpurplescarf"
	item_state = "stripedpurplescarf"

/obj/item/clothing/accessory/scarf
	name = "striped red scarf"
	desc = "A striped red scarf."
	icon_state = "stripedredscarf"
	item_state = "stripedredscarf"

/obj/item/clothing/accessory/ninjascarf /*Omitted from scarf selection because it's more of a costume piece.*/
	name = "ninja scarf"
	desc = "A stealthy, ominous scarf."
	icon_state = "ninja_scarf"
	item_state = "ninja_scarf"
	siemens_coefficient = 0

/*One-Off Stuff*/
/obj/item/clothing/accessory/necklace
	name = "metal necklace"
	desc = "A shiny steel chain with a vague metallic object dangling off it."
	icon_state = "tronket"
	item_state = "tronket"

/obj/item/clothing/accessory/dropstraps
	name = "drop straps"
	desc = "White suspenders worn over the shoulders."
	icon_state = "flops"
	item_state = "flops"

/obj/item/clothing/accessory/dogtags
	name = "dog tags"
	desc = "A pair of engraved metal identification tags."
	icon_state = "tags"
	item_state = "tags"

/obj/item/clothing/accessory/legbrace
	name = "leg brace"
	desc = "A lightweight polymer frame designed to hold legs upright comfortably."
	icon_state = "legbrace"
	item_state = "legbrace"

/obj/item/clothing/accessory/neckbrace
	name = "neck brace"
	desc = "A lightweight polymer frame designed to hold a neck upright comfortably."
	icon_state = "neckbrace"
	item_state = "neckbrace"

/*Ranks*/

/obj/item/clothing/accessory/ranks/blank
	name = "Shoulderboards (Blank)"
	desc = "Blank red shoulderboards denoting a Blackshield cadet, or, rarely, an emergency volunteer or an off-duty Blackshield Trooper given provisional duty in an emergency."
	icon_state = "blank_tabs"
	item_state = "blank_tabs"

/obj/item/clothing/accessory/ranks/trooper
	name = "Shoulderboards (Trooper)"
	desc = "Red and silver shoulderboards denoting a Blackshield soldier with the rank of Trooper."
	icon_state = "trooper_tabs"
	item_state = "trooper_tabs"

/obj/item/clothing/accessory/ranks/corpsman
	name = "Shoulderboards (Corpsman)"
	desc = "Red and silver shoulderboards denoting a Blackshield soldier with the rank of Corpsman."
	icon_state = "corps_tabs"
	item_state = "corps_tabs"

/obj/item/clothing/accessory/ranks/sergeant
	name = "Shoulderboards (Sergeant)"
	desc = "Red and silver shoulderboards denoting a Blackshield soldier with the rank of Sergeant."
	icon_state = "sergeant_tabs"
	item_state = "sergeant_tabs"

/obj/item/clothing/accessory/ranks/sergeantmajor
	name = "Shoulderboards (Sergeant Major)"
	desc = "Red and silver shoulderboards denoting a Blackshield soldier with the rank of Sergeant Major."
	icon_state = "sergeantm_tabs"
	item_state = "sergeantm_tabs"

/obj/item/clothing/accessory/ranks/commander
	name = "Shoulderboards (Commander)"
	desc = "Red and gold shoulderboards denoting a Blackshield soldier with the rank of Commander."
	icon_state = "commander_tabs"
	item_state = "commander_tabs"

/obj/item/clothing/accessory/ranks/major
	name = "Shoulderboards (Major)"
	desc = "Red and gold shoulderboards denoting a Blackshield soldier with the rank of Major."
	icon_state = "major_tabs"
	item_state = "major_tabs"

/obj/item/clothing/accessory/ranks/brigadier
	name = "Shoulderboards (Brigadier)"
	desc = "Red, gold, and silver shoulderboards denoting the Brigadier."
	icon_state = "brigadier_tabs"
	item_state = "brigadier_tabs"

/obj/item/clothing/accessory/patches/blackshield
	name = "Blackshield Patch"
	desc = "A black, blue, and silver patch made to represent the Blackshield regiment. For use on uniforms when active, or other clothing in other positions."
	icon_state = "blackshieldpatch"
	item_state = "blackshieldpatch"

// Hank's shit starts here //

//
// Collars and such like that
//

/obj/item/clothing/accessory/choker //A colorable, tagless choker
	name = "plain choker"
	desc = "A simple, plain choker. Or maybe it's a collar? Use in-hand to customize it."
	icon = 'icons/inventory/accessory/mob.dmi'
	icon_override = 'icons/inventory/accessory/mob.dmi'
	icon_state = "choker_cst"
	item_state = "choker_cst"
	overlay_state = "choker_cst"
	var/customized = 0

/obj/item/clothing/accessory/choker/attack_self(mob/user as mob)
	if(!customized)
		var/design = input(user,"Descriptor?","Pick descriptor","") in list("plain","simple","ornate","elegant","opulent")
		var/material = input(user,"Material?","Pick material","") in list("leather","velvet","lace","fabric","latex","plastic","metal","chain","silver","gold","platinum","steel","bead","ruby","sapphire","emerald","diamond")
		var/type = input(user,"Type?","Pick type","") in list("choker","collar","necklace")
		name = "[design] [material] [type]"
		desc = "A [type], made of [material]. It's rather [design]."
		customized = 1
		to_chat(usr,"<span class='notice'>[src] has now been customized.</span>")
	else
		to_chat(usr,"<span class='notice'>[src] has already been customized!</span>")

/obj/item/clothing/accessory/collar
	icon = 'icons/inventory/accessory/mob.dmi'
	icon_override = 'icons/inventory/accessory/mob.dmi'
	icon_state = "collar_blk"
	var/writtenon = 0

/obj/item/clothing/accessory/collar/silver
	name = "Silver tag collar"
	desc = "A collar for your little pets... or the big ones."
	icon_state = "collar_blk"
	item_state = "collar_blk"
	overlay_state = "collar_blk"

/obj/item/clothing/accessory/collar/gold
	name = "Golden tag collar"
	desc = "A collar for your little pets... or the big ones."
	icon_state = "collar_gld"
	item_state = "collar_gld"
	overlay_state = "collar_gld"

/obj/item/clothing/accessory/collar/bell
	name = "Bell collar"
	desc = "A collar with a tiny bell hanging from it, purrfect furr kitties."
	icon_state = "collar_bell"
	item_state = "collar_bell"
	overlay_state = "collar_bell"
	var/jingled = 0

/obj/item/clothing/accessory/collar/bell/verb/jinglebell()
	set name = "Jingle Bell"
	set category = "Object"
	set src in usr
	if(!istype(usr, /mob/living)) return
	if(usr.stat) return

	if(!jingled)
		usr.audible_message("[usr] jingles the [src]'s bell.")
		playsound(src, 'sound/items/ring.ogg', 50, 1)
		jingled = 1
		addtimer(CALLBACK(src, .proc/jingledreset), 50)
	return

/obj/item/clothing/accessory/collar/bell/proc/jingledreset()
		jingled = 0

/obj/item/clothing/accessory/collar/spike
	name = "Spiked collar"
	desc = "A collar with spikes that look as sharp as your teeth."
	icon_state = "collar_spik"
	item_state = "collar_spik"
	overlay_state = "collar_spik"

/obj/item/clothing/accessory/collar/pink
	name = "Pink collar"
	desc = "This collar will make your pets look FA-BU-LOUS."
	icon_state = "collar_pnk"
	item_state = "collar_pnk"
	overlay_state = "collar_pnk"

/obj/item/clothing/accessory/collar/holo
	name = "Holo-collar"
	desc = "An expensive holo-collar for the modern day pet."
	icon_state = "collar_holo"
	item_state = "collar_holo"
	overlay_state = "collar_holo"
	matter = list(DEFAULT_WALL_MATERIAL = 50)

// /obj/item/clothing/accessory/collar/holo/indigestible
	//desc = "A special variety of the holo-collar that seems to be made of a very durable fabric that fits around the neck."//
//Make indigestible
// /obj/item/clothing/accessory/collar/holo/indigestible/digest_act(var/atom/movable/item_storage = null)
	//return FALSE //

/obj/item/clothing/accessory/collar/attack_self(mob/user as mob)
	if(istype(src,/obj/item/clothing/accessory/collar/holo))
		to_chat(user,"<span class='notice'>[name]'s interface is projected onto your hand.</span>")
	else
		if(writtenon)
			to_chat(user,"<span class='notice'>You need a pen or a screwdriver to edit the tag on this collar.</span>")
			return
		to_chat(user,"<span class='notice'>You adjust the [name]'s tag.</span>")

	var/str = copytext(reject_bad_text(input(user,"Tag text?","Set tag","")),1,MAX_NAME_LEN)

	if(!str || !length(str))
		to_chat(user,"<span class='notice'>[name]'s tag set to be blank.</span>")
		name = initial(name)
		desc = initial(desc)
	else
		to_chat(user,"<span class='notice'>You set the [name]'s tag to '[str]'.</span>")
		initialize_tag(str)

/obj/item/clothing/accessory/collar/proc/initialize_tag(var/tag)
		name = initial(name) + " ([tag])"
		desc = initial(desc) + " \"[tag]\" has been engraved on the tag."
		writtenon = 1

/obj/item/clothing/accessory/collar/holo/initialize_tag(var/tag)
		..()
		desc = initial(desc) + " The tag says \"[tag]\"."

/obj/item/clothing/accessory/collar/attackby(obj/item/I, mob/user)
	if(istype(src,/obj/item/clothing/accessory/collar/holo))
		return

	if(istype(I,/obj/item/weapon/tool/screwdriver))
		update_collartag(user, I, "scratched out", "scratch out", "engraved")
		return

	if(istype(I,/obj/item/weapon/pen))
		update_collartag(user, I, "crossed out", "cross out", "written")
		return

	to_chat(user,"<span class='notice'>You need a pen or a screwdriver to edit the tag on this collar.</span>")

/obj/item/clothing/accessory/collar/proc/update_collartag(mob/user, obj/item/I, var/erasemethod, var/erasing, var/writemethod)
	if(!(istype(user.get_active_hand(),I)) || !(istype(user.get_inactive_hand(),src)) || (user.stat))
		return

	var/str = copytext(reject_bad_text(input(user,"Tag text?","Set tag","")),1,MAX_NAME_LEN)

	if(!str || !length(str))
		if(!writtenon)
			to_chat(user,"<span class='notice'>You don't write anything.</span>")
		else
			to_chat(user,"<span class='notice'>You [erasing] the words with the [I].</span>")
			name = initial(name)
			desc = initial(desc) + " The tag has had the words [erasemethod]."
	else
		if(!writtenon)
			to_chat(user,"<span class='notice'>You write '[str]' on the tag with the [I].</span>")
			name = initial(name) + " ([str])"
			desc = initial(desc) + " \"[str]\" has been [writemethod] on the tag."
			writtenon = 1
		else
			to_chat(user,"<span class='notice'>You [erasing] the words on the tag with the [I], and write '[str]'.</span>")
			name = initial(name) + " ([str])"
			desc = initial(desc) + " Something has been [erasemethod] on the tag, and it now has \"[str]\" [writemethod] on it."