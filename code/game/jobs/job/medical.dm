/datum/job/cmo
	title = "Surgeon General"
	flag = CBO
	head_position = 1
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the DSRA Headmaster"
	difficulty = "Hard."
	selection_color = "#94a87f"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	outfit_type = /decl/hierarchy/outfit/job/medical/cmo

	access = list(
		access_moebius, access_medical_equip, access_morgue, access_genetics, access_heads,
		access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
		access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels,
		access_external_airlocks, access_paramedic, access_research_equipment
	)

	ideal_character_age = 40
	minimum_character_age = 30

	stat_modifiers = list(
		STAT_BIO = 50,
		STAT_MEC = 10,
		STAT_COG = 25
	)

	perks = list(/datum/perk/selfmedicated)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/chem_catalog,
							 /datum/computer_file/program/reports)

	description = "The Surgeon General is the head of the State Hospital, preserving and improving lives.<br>\
	Your main responsibility is to keep everyone alive, as is the objective of your department. Prioritise health over most other concerns. <br>\
	A variety of medical staff work under your command. Although these roles are clear-cut compared to the research branch, direct them appropriately.<br>\
	Of course, remember that you are a doctor yourself - feel free to help with less specialised activities to ease the burden.<br>\
	The Medical wing also falls under the ownership of Darkwall State Research Academy. You may use their resources - and they may use yours - as needed."

	duties = "Direct the doctors under your command towards the bettering of all mankind.<br>\
	Dispatch your paramedics to distress calls, and corpse recoveries as needed.<br>\
	Use department funds to purchase medical supplies and equipment as needed.<br>\
	Advise the council on medical issues that concern the crew.<br>\
	Advise the crew on ethical issues.<br>\
	In times of crisis, lock down the medbay to protect those within, from outside threats."

/obj/landmark/join/start/cmo
	name = "Surgeon General"
	icon_state = "player-green-officer"
	join_tag = /datum/job/cmo

/datum/job/doctor
	title = "Medical Doctor"
	flag = DOCTOR
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = MAP_FACTION
	total_positions = 5
	spawn_positions = 5
	supervisors = "the Surgeon General"
	difficulty = "Medium."
	selection_color = "#a8b69a"
	wage = WAGE_PROFESSIONAL
	minimum_character_age = 25
	alt_titles = list("Emergency Physician", "Surgeon", "Field Surgeon", "Chemist", "Pharmacist", "Virologist")

	outfit_type = /decl/hierarchy/outfit/job/medical/doctor

	access = list(
		access_moebius, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology,
		access_genetics, access_external_airlocks, access_research_equipment
	)

	stat_modifiers = list(
		STAT_BIO = 40,
		STAT_COG = 10
	)

	perks = list(/datum/perk/selfmedicated)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/camera_monitor)

	description = "The Medical Doctor is a professional medic and surgeon dedicated to healing the sick and injured, at all costs.<br>\
	A broad range of medical procedures fall under your purview - diagnostics, general treatment, surgery, and virology.<br>\
	You are not expected to be an expert in all: specialising in an area is fine. Divide tasks amongst colleagues, with the guidance of the surgeon general.<br>\
	Remember that chemistry has a dedicated specialist. Avoid this department unless it is notably short-staffed.<br>\
	Due to the nature of your work, you may find yourself confined to the department for the shift majority. Don't abandon patients."

	duties = "Heal the sick and injured, whatever their complaint.<br>\
		Diagnose illnesses, offer general services, perform surgery, or even study viruses.<br>\
		Fill in at chemistry if a Chemist is unavailable."

/obj/landmark/join/start/doctor
	name = "Medical Doctor"
	icon_state = "player-green"
	join_tag = /datum/job/doctor

/datum/job/orderly
	title = "Orderly"
	flag = ORDERLY
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Surgeon General"
	difficulty = "Medium."
	selection_color = "#a8b69a"
	wage = WAGE_PROFESSIONAL

	outfit_type = /decl/hierarchy/outfit/job/medical/orderly

	access = list(
		access_moebius, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_orderly
	)

	perks = list(/datum/perk/selfmedicated)

	stat_modifiers = list(
		STAT_TGH = 20,
		STAT_ROB = 20,
		STAT_VIG = 10,
		STAT_BIO = 10
	)

	software_on_spawn = list(/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/scanner)

	description = "The Orderly is not a man of science nor medicine, they are strictly in charge of enforcing the surgeon general orders and sometimes the chief research overseer's orders.<br>\
	Your primary role is that of a thug for medical. You make sure that medical remains safe by ensuring people don't trespass or steal items and remove those who shouldn't be there, by force if necessary.<br>\
	Your secondary responsibility is that of an enforcer. Actions that require in house enforcement such as aiding doctors and security with violent patients in medical, securing the virology lab during an outbreak, and aiding in the destruction of escape slimes or kudzu from science.<br>\
	Your third duty is to aid medical doctors and paramedics in fixing patients, this can include retrieving chemicals, doing basic triage, and accompanying paramedics to aid them in getting injured patients.<br>\
	You are fully licensed to sell any and all chemicals to all citizens. If someone isn't an employee of the Darkwall State Research Academy, charge them for their chemicals.<br>\
	It's worth noting that you function heavily as a nurse when not acting as muscle and treatment of patients should be priority, in particular when assisting doctors."

	duties = "Act as a guard for medical, ensuring unneeded citizen leave and nothing is stolen.<br>\
		Aid medical doctors and paramedics in any way you can.<br>\
		Act as a nurse for minor injuries, treating patients that a doctor needn't bother with.<br>\
		Ensure that any outbreaks are contained, such as slimes, infected monkies, or kudzu."

/obj/landmark/join/start/chemist //This says chemist so I didn't have to edit the map shit when I changed this. Fix later.
	name = "Orderly"
	icon_state = "player-green"
	join_tag = /datum/job/orderly

/datum/job/psychiatrist
	title = "Psychiatrist"
	flag = PSYCHIATRIST
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	wage = WAGE_PROFESSIONAL
	supervisors = "the Surgeon General"
	difficulty = "Easy To Medium."
	selection_color = "#a8b69a"

	outfit_type = /decl/hierarchy/outfit/job/medical/psychiatrist

	access = list(
		access_moebius, access_medical_equip, access_morgue, access_psychiatrist, access_chemistry
	)

	stat_modifiers = list(
		STAT_BIO = 10,
		STAT_COG = 15,
		STAT_VIG = 5
	)

	perks = list(/datum/perk/selfmedicated)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/camera_monitor)

	description = "The Psychiatrist is a mental specialist that works to help citizens through their various issues and concerns.<br>\
	In some ways you are a professional conversationalist. Despite knowing advanced therapy techniques, sometimes a mere chat can work wonders.<br>\
	More eventful days may involve you having particularly unstable citizens sectioned, or interviewing criminals in coordination with Security.<br>\
	Remember that patient confidentiality is highly important in your profession. Keep sensitive information between you and the patient."

	duties = "Speak with anyone who desires help, no matter their rank or relation.<br>\
		Prescribe medicine and offer therapy courses for those who need it.<br>\
		Determine if individuals are fit for work or not. Help those who are proven unfit."

/obj/landmark/join/start/psychiatrist
	name = "Psychiatrist"
	icon_state = "player-green"
	join_tag = /datum/job/psychiatrist


/datum/job/paramedic
	title = "Paramedic"
	flag = PARAMEDIC
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = MAP_FACTION
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Surgeon General"
	difficulty = "Medium."
	selection_color = "#a8b69a"
	wage = WAGE_LABOUR_HAZARD

	outfit_type = /decl/hierarchy/outfit/job/medical/paramedic
	access = list(
		access_moebius, access_medical_equip, access_morgue, access_surgery, access_paramedic,
		access_eva, access_maint_tunnels, access_external_airlocks
	)

	stat_modifiers = list(
		STAT_BIO = 25,
		STAT_TGH = 10,
		STAT_VIG = 10,
	)

	perks = list(/datum/perk/timeismoney)

	perks = list(/datum/perk/selfmedicated)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							/datum/computer_file/program/chem_catalog,
							 /datum/computer_file/program/camera_monitor)

	description = "The Paramedic provides medical assistance on the field, while other doctors are busy in their department.<br>\
	You are highly trained but lack seniority. Follow the guidance of other doctors - and transport patients back for specialist treatments.<br>\
	Remember that you must often respond to emergencies. Pack your gear carefully and bring a breaching tool - be ready to run at short notice.<br>\
	Your other duties include transporting patients between rooms, running errands, and generally saving time for other doctors.<br>\
	Corpse recovery may also fall within your duties. If the body is in a dangerous location, enlist the help of the Blackshield or the Church."

	duties = "Respond to distress calls and extract wounded people from dangerous situations.<br>\
	Watch the crew monitor for signs of injuries or deaths and respond accordingly.<br>\
	Tour around departments checking up on the health of the crew. Administer first aid on scene as required.<br>\
	During quieter times, retrieve the corpses of the dead.<br>\
	Run errands for the medbay staff, act as their hands outside of the medbay."

/obj/landmark/join/start/paramedic
	name = "Paramedic"
	icon_state = "player-green"
	join_tag = /datum/job/paramedic

