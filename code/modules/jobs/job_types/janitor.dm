/datum/job/janitor
	title = JOB_JANITOR
	description = "Clean up trash and blood. Replace broken lights. Slip people over."
	department_head = list(JOB_HEAD_OF_PERSONNEL)
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 1
	supervisors = SUPERVISOR_HOP
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "JANITOR"

	outfit = /datum/outfit/job/janitor
	plasmaman_outfit = /datum/outfit/plasmaman/janitor

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_SRV

	display_order = JOB_DISPLAY_ORDER_JANITOR
	departments_list = list(
		/datum/job_department/service,
		)

	family_heirlooms = list(/obj/item/mop, /obj/item/clothing/suit/caution, /obj/item/reagent_containers/cup/bucket, /obj/item/paper/fluff/stations/soap)

	mail_goodies = list(
		/obj/item/grenade/chem_grenade/cleaner = 30,
		/obj/item/storage/box/lights/mixed = 20,
		/obj/item/lightreplacer = 10
	)
	rpg_title = "Groundskeeper"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN

	job_tone = "slip"

/datum/job/janitor/config_check()
	return CONFIG_GET(flag/allow_station_jobs)


/datum/outfit/job/janitor
	name = "Janitor"
	jobtype = /datum/job/janitor

	id_trim = /datum/id_trim/job/janitor
	uniform = /obj/item/clothing/under/rank/civilian/janitor
	belt = /obj/item/modular_computer/pda/janitor
	ears = /obj/item/radio/headset/headset_srv

/datum/outfit/job/janitor/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(check_holidays(GARBAGEDAY))
		backpack_contents += list(/obj/item/gun/ballistic/revolver)
		r_pocket = /obj/item/ammo_box/a357

/datum/outfit/job/janitor/get_types_to_preload()
	. = ..()
	if(check_holidays(GARBAGEDAY))
		. += /obj/item/gun/ballistic/revolver
		. += /obj/item/ammo_box/a357
