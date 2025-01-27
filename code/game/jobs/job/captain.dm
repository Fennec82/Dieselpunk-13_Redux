var/datum/announcement/minor/captain_announcement = new(do_newscast = 1)

/datum/job/premier
	title = "Mayor"
	flag = PREMIER
	department = DEPARTMENT_COMMAND
	head_position = 1
	department_flag = COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Zai'khet Confederacy Government"
	difficulty = "Very Hard."
	selection_color = "#ccccff"
	req_admin_notify = 1
	alt_titles = list("Governor")
	wage = WAGE_NONE //The captain doesn't get paid, he's the one who does the paying
	//The colony account is his, and he's free to draw as much salary as he likes


	ideal_character_age = 50 // Old geezer captains ftw
	minimum_character_age = 35
	outfit_type = /decl/hierarchy/outfit/job/captain

	perks = list(/datum/perk/sommelier)

	description = "The mayor is the prime mediator of the city itself, acting as a trusted advisor amongst their peers.<br>\
You are trusted with control of the city's primary accounts, and are also able to control access within the city.<br>\
Your primary objective is to oversee council decisions, change access levels, and act as both lawyer and consultant in various decisions.<br>\
You are not the supreme leader of the city and your word is only an advisement. The only person you can give legal orders to is the Steward.<br>\
The heads of the factions which make up the council each have their own agendas. Their interests must be served to avoid issues.<br>\
Treat your command officers with respect, and listen to their council. Try not to micromanage their departments or interfere in their affairs."

	duties = "Work between the varying interests of council members to achieve stability.<br>\
	Offer advise and counsel when approached, particularly during important decisions.<br>\
	Manage the city's primary accounts and access levels accordingly."

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_BIO = 15,
		STAT_MEC = 15,
		STAT_VIG = 25,
		STAT_COG = 15
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)


	equip(var/mob/living/carbon/human/H)
		if(!..())	return 0
		if(H.age>49)
			var/obj/item/clothing/under/U = H.w_uniform
			if(istype(U)) U.accessories += new /obj/item/clothing/accessory/medal/gold/captain(U)
		return 1

	get_access()
		return get_all_station_access()

/obj/landmark/join/start/premier
	name = "Mayor"
	icon_state = "player-gold-officer"
	join_tag = /datum/job/premier

/datum/job/pg
	title = "Steward"
	flag = STEWARD
	department = DEPARTMENT_COMMAND
	head_position = 1
	department_flag = COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Mayor"
	difficulty = "Hard."
	selection_color = "#ddddff"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	ideal_character_age = 35
	minimum_character_age = 30

	description = "The Steward is the loyal right-hand of the mayor. Serving as a personal guard, follow him wherever he goes.<br>\
	Your primary, and perhaps only, responsibility is to ensure the safety of the mayor at all costs - even your own life if necessary.<br>\
	However, you are an advisor as well as a bodyguard. Discreetly inform him of mistakes. Make sure he follows the law and remains popular.<br>\
	You may be assigned special tasks by the mayor for whatever reason. Ensure these orders are fulfilled.<br>\
	Do not embarass him, and especially do not harm his relations with faction leaders. You may not do much talking, but you have great impact."

	duties = "Act as a bodyguard, advisor, and confidant to the mayor.<br>\
	Remain conscious of any potential threats to the safety of the mayor.<br>\
	Perform tasks as assigned by the mayor - such as filling paperwork or reassigning roles.<br>\
	Demonstrate true loyalty and do not let your superior down."

	outfit_type = /decl/hierarchy/outfit/job/hop

	perks = list(/datum/perk/sommelier)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)


	get_access()
		return get_all_station_access()

	stat_modifiers = list(
		STAT_VIG = 35,
		STAT_TGH = 30,
		STAT_ROB = 25,
		STAT_BIO = 25,
		STAT_MEC = 25,
		STAT_COG = 25
	)

/obj/landmark/join/start/pg
	name = "Steward"
	icon_state = "player-gold"
	join_tag = /datum/job/pg
