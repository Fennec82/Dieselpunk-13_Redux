// see /datum/interface/new_player/buildUI()
// NOTES:
// music files should be in ogg extention

/hook/startup/proc/initLobbyScreen()
	var/list/variations = subtypesof(/datum/lobbyscreen)
	var/datum/lobbyscreen/LS = pick(variations)
	GLOB.lobbyScreen = new LS()
	return 1

/datum/lobbyscreen
	var/image_file
	// insert songs in this list, not into var/musicTrack
	var/list/possibleMusic = list()
	// this var exist so all players will hear one song
	var/musicTrack

/datum/lobbyscreen/New()
	if(!length(possibleMusic) || !image_file)
		crash_with("Login screen setup is wrong.")
	musicTrack = pick(possibleMusic)
	return ..()

/datum/lobbyscreen/dieselpunk
	image_file = 'icons/title_screens/dieselpunk13.png'
	possibleMusic = list(
		'sound/music/lobby/Lobo_Loco-Arround_the_Village.ogg',
		'sound/music/lobby/Lobo_Loco-Loners_in_the_Night.ogg',
		'sound/music/lobby/Lobo_Loco-Nuclear_Fusion_Generator.ogg'
		)

/datum/lobbyscreen/proc/play_music(client/C)
	if(!musicTrack)
		return
	if(C.get_preference_value(/datum/client_preference/play_lobby_music) == GLOB.PREF_YES)
		sound_to(C, sound(musicTrack, repeat = 0, wait = 0, volume = 85, channel = GLOB.lobby_sound_channel))

/datum/lobbyscreen/proc/stop_music(client/C)
	if(!musicTrack)
		return
	sound_to(C, sound(null, repeat = 0, wait = 0, volume = 85, channel = GLOB.lobby_sound_channel))


/datum/lobbyscreen/proc/show_titlescreen(client/C)
	winset(C, "lobbybrowser", "is-disabled=false;is-visible=true")
	C << browse(image_file, "file=titlescreen.png;display=0")
	C << browse(file('html/lobby_titlescreen.html'), "window=lobbybrowser")

/datum/lobbyscreen/proc/hide_titlescreen(client/C)
	if(C.mob) // Check if the client is still connected to something
		// Hide title screen, allowing player to see the map
		winset(C, "lobbybrowser", "is-disabled=true;is-visible=false")

