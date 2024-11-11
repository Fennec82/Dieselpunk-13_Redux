/datum/job/assistant
	title = "Civilian"
	flag = ASSISTANT
	department = DEPARTMENT_CIVILIAN
	department_flag = CIVILIAN
	faction = MAP_FACTION
	total_positions = -1
	spawn_positions = -1
	supervisors = "anyone who pays you"
	difficulty = "Very Easy."
	selection_color = "#dddddd"
	initial_balance	= 800
	wage = WAGE_NONE //Get a job ya lazy bum
	alt_titles = list("Visitor", "Refugee","Guild Novice","State Research Academy Intern","Lonestar Intern")

	outfit_type = /decl/hierarchy/outfit/job/assistant

	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_BIO = 8,
		STAT_MEC = 8,
		STAT_VIG = 8,
		STAT_COG = 8
	)

	description = "The ideal newcomer role. You have no official position within the colony. You will not be paid a wage.<br>\
Where did you come from? Why are you here? These things are up to you.<br>\
<br>\
Perhaps you're a new arrival, who paid for transit. What are you seeking, or what are you running from?<br>\
Perhaps you're a young apprentice or intern. What new and exciting career are you pursuing?<br>\
Perhaps you're a friend, relative, spouse or lover of an existing colonist. How can you support them in their work?<br>\
Perhaps you're a former prisoner, ready to join the crew after your served time. What was your crime?<br>\
Perhaps you're a refugee, stranded in the wilderness and rescued by the colony. Why were you out there?<br>\
<br>\
Your story is yours to write. What matters is that you're here now - find some purpose.<br>\
To form connections, strive to help out anyone you can. Or at least, anyone who offers you a paying job.<br>\
Find a way to make money, stay out of trouble, and survive."

/obj/landmark/join/start/assistant
	name = "Colonist"
	icon_state = "player-grey"
	join_tag = /datum/job/assistant
