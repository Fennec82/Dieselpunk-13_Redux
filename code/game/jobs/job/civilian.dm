/datum/job/clubmanager
	title = "Bartender"
	flag = CLUBMANAGER
	department = DEPARTMENT_NSS
	department_flag = NSS
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Resource Officer"
	difficulty = "Easy."
	selection_color = "#dddddd"
	access = list(access_hydroponics, access_bar, access_kitchen)
	initial_balance = 3000
	wage = WAGE_LABOUR_DUMB // Makes his own money via tips and selling drinks
	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 15,
	)

	outfit_type = /decl/hierarchy/outfit/job/service/bartender //Re-using this.
	description = "The Bartender runs the city's bar, providing colonists with drinks and entertainment.<br>\
	Working with the Chef and Gardener, you make the big decisions. Run your business well - perhaps seek to maximise profits.<br>\
	Although tips are a good source of income, your wider business acumen will truly decide your prosperity here."

	duties = "Run the bar - provide a safe haven for food, drinks, and entertainment.<br>\
		Seek extra sources of income from the venue - perhaps run deals or trade secrets.<br>\
		Potentially take over cooking duties if a Chef is not present."

/obj/landmark/join/start/clubmanager
	name = "Bartender"
	icon_state = "player-grey"
	join_tag = /datum/job/clubmanager

/datum/job/clubworker
	title = "Chef"
	flag = CLUBWORKER
	department = DEPARTMENT_NSS
	department_flag = NSS
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Resource Officer"
	difficulty = "Easy."
	selection_color = "#dddddd"
	access = list(access_hydroponics, access_bar, access_kitchen)
	initial_balance = 750
	wage = WAGE_LABOUR_DUMB //They should get paid by making food.
	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_VIG = 5,
	)

	outfit_type = /decl/hierarchy/outfit/job/service/waiter
	description = "The Chef works in the kitchen, ensuring that the city remains well-fed and energetic.<br>\
	You will typically work closely with a Bartender while cooking, cleaning, serving, and perhaps entertaining.<br>\
	You are paid mainly through fulfilling requests for food. The successful Chef takes initiative by asking for customer orders."

	duties = "Provide enough meals to feed the city. Aim for a variety of interesting dishes.<br>\
		Ensure your customers are well-fed and looked after.<br>\
		Potentially take over bartending duties if a Bartender is not present."


/obj/landmark/join/start/clubworker
	name = "Chef"
	icon_state = "player-grey"
	join_tag = /datum/job/clubworker

/datum/job/hydro
	title = "Gardener"
	flag = BOTANIST
	department = DEPARTMENT_NSS
	department_flag = NSS
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Resource Officer"
	difficulty = "Easy."
	selection_color = "#dddddd"
	alt_titles = list("Hydroponicist")
	also_known_languages = list(LANGUAGE_CYRILLIC = 15, LANGUAGE_JIVE = 80)
	access = list(access_hydroponics, access_bar, access_kitchen)
	wage = WAGE_LABOUR_DUMB //The gardener can make money selling his fruits to the church or to the chef and bartender.

	outfit_type = /decl/hierarchy/outfit/job/service/gardener
	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_TGH = 15,
		STAT_ROB = 10,
	)

	description = "The Gardener toils in hydroponics - utilising seeds, tools, and fertilisers to grow bountiful crops.<br>\
	More talented gardeners may dip into ranching. Your paddocks contain a few chickens and a cow. More exotic animals can be acquired as cargo imports.<br>\
	You are the go-to expert for flora destruction - use shovels and hatchets, or seek more advanced equipment like flamethrowers and chainsaws.<br>\
	Remember that your goods come at a price, and more exotic crops can command a higher price."

	duties = "Grow food. Ensure a good supply of raw vegetables and core grains - rice and wheat.<br>\
		Raise animals for eggs, meat and recreation.<br>\
		Manage invasive flora around the colony and control fungal infestations."

/obj/landmark/join/start/hydro
	name = "Gardener"
	icon_state = "player-black"
	join_tag = /datum/job/hydro

/datum/job/actor
	title = "Actor"
	flag = ACTOR
	department = DEPARTMENT_NSS
	department_flag = NSS
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Resource Officer"
	difficulty = "Easy."
	selection_color = "#dddddd"
	access = list(access_theatre)
	outfit_type = /decl/hierarchy/outfit/job/service/actor
	wage = WAGE_LABOUR_DUMB	//Barely a retaining fee. Actor can busk for credits to keep themselves fed
	alt_titles = list("Artist","Clown","Entertainer","Mime")
	stat_modifiers = list(
		STAT_TGH = 30, //basically a punching bag, he can't robust anyone or shoot guns anyway
	)

	description = "The Actor serves as a versatile performance artist here to entertain the city.<br>\
	You may find your colleagues distracted by boring duties or senseless bickering, so work hard to bring them some real culture.<br>\
	The CEO pays you a terrible retaining fee, so use your wits to sustain yourself - perhaps ask your audience for donations."

	duties = "Provide (family-friendly) entertainment to the crew with your varied talents.<br>\
		Host shows, busk in the corridors, perform harmless pranks, or whatever else you think will be well-received.<br>\
		Try to be a successful rather than starving artist. The costume vendor and equipment in your cramped studio may prove useful."

/obj/landmark/join/start/actor
	name = "Actor"
	icon_state = "player-grey"
	join_tag = /datum/job/actor
