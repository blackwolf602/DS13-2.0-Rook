/datum/job/chief_medical_officer
	title = JOB_MEDICAL_DIRECTOR
	description = "Coordinate doctors and other medbay employees, ensure they \
		know how to save lives, check for injuries on the crew monitor."
	department_head = list(JOB_CAPTAIN)
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	head_announce = list(RADIO_CHANNEL_MEDICAL)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#026865"
	req_admin_notify = 1
	minimal_player_age = 7
	exp_requirements = 180
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_MEDICAL
	exp_granted_type = EXP_TYPE_CREW

	employers = list(
		/datum/employer/cec,
		/datum/employer/eg,
		/datum/employer/uni,
		/datum/employer/none
	)

	outfits = list(
		"Default" = list(
			SPECIES_HUMAN = /datum/outfit/job/cmo,
		),
	)

	departments_list = list(
		/datum/job_department/medical,
		/datum/job_department/command,
	)

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_MED

	liver_traits = list(TRAIT_MEDICAL_METABOLISM, TRAIT_ROYAL_METABOLISM)

	mail_goodies = list(
		/obj/effect/spawner/random/medical/organs = 10,
		/obj/effect/spawner/random/medical/memeorgans = 8,
		/obj/effect/spawner/random/medical/surgery_tool_advanced = 4,
		/obj/effect/spawner/random/medical/surgery_tool_alien = 1
	)
	family_heirlooms = list(/obj/item/storage/medkit/ancient/heirloom)
	rpg_title = "High Cleric"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN

	voice_of_god_power = 1.4 //Command staff has authority


/datum/job/chief_medical_officer/get_captaincy_announcement(mob/living/captain)
	return "Due to staffing shortages, newly promoted Acting Captain [captain.real_name] on deck!"


/datum/outfit/job/cmo
	name = "Medical Director"
	jobtype = /datum/job/chief_medical_officer

	id = /obj/item/card/id/advanced/silver
	id_template = /datum/access_template/job/chief_medical_officer
	uniform = /obj/item/clothing/under/rank/medical/chief_medical_officer/ds_senior_med
	suit = /obj/item/clothing/suit/toggle/labcoat/cmo
	belt = /obj/item/modular_computer/tablet/pda/heads/cmo
	ears = /obj/item/radio/headset/heads/cmo
	shoes = /obj/item/clothing/shoes/sneakers/blue
	l_pocket = /obj/item/pinpointer/crew
	l_hand = /obj/item/storage/medkit/surgery

	box = /obj/item/storage/box/survival/medical
	chameleon_extras = list(
		/obj/item/gun/syringe,
		/obj/item/stamp/cmo,
		)

/datum/outfit/job/cmo/mod
	name = "Medical Director (MODsuit)"

	suit_store = /obj/item/tank/internals/oxygen
	back = /obj/item/mod/control/pre_equipped/rescue
	suit = null
	mask = /obj/item/clothing/mask/breath/medical
	internals_slot = ITEM_SLOT_SUITSTORE
	backpack_contents = null
	box = null
