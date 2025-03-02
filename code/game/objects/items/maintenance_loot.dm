//The items defined in this file are intended be scarce maintenance loot items some of these items are used as a non-renewable resource in crafting or ghetto chem.
//Exercise good judgement and don't add these to a lathe willy nilly.

//Saw-tier bulky & blunt weapon. A decent bone breaker. Source of lead reagent.
//Add lead material to this once implemented.
/obj/item/lead_pipe
	name = "lead pipe"
	icon = 'icons/obj/maintenance_loot.dmi'
	icon_state = "lead_pipe"
	inhand_icon_state = "lead_pipe"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	//wow, lore
	desc = "A hefty lead pipe.\nLead in an uncommon sight in this sector after being phased out due to employee health concerns. \
	\nThose of a more cynical disposition assume that the NT lead ban is a scheme to prevent divertion to Syndicate ammunition factories."
	force = 15
	throwforce = 12
	throw_range = 4
	w_class = WEIGHT_CLASS_BULKY
	wound_bonus = 20
	demolition_mod = 1.25
	grind_results = list(/datum/reagent/lead = 20)

//A good battery early in the shift. Source of lead & sulfuric acid reagents.
//Add lead material to this once implemented.
/obj/item/stock_parts/cell/lead
	name = "lead-acid battery"
	desc = "A type of primitive battery. It's absurdly large, and absurdly heavy."
	icon = 'icons/obj/maintenance_loot.dmi'
	icon_state = "lead_battery"
	throwforce = 10
	maxcharge = 20000 //decent max charge
	chargerate = 1400 //charging is about 30% less efficient compared lithium batteries.
	charge_light_type = null
	connector_type = "leadacid"
	rating = 2 //Kind of a mid-tier battery
	w_class = WEIGHT_CLASS_HUGE
	grind_results = null // Let's not allow people to grind this fucker up considering it's important for the mode

//starts partially discharged
/obj/item/stock_parts/cell/lead/Initialize(mapload)
	AddElement(/datum/element/update_icon_blocker)
	. = ..()
	charge = rand(0.2,0.8) * maxcharge
	AddComponent(/datum/component/two_handed, require_twohands=TRUE)

/obj/item/stock_parts/cell/lead/can_be_pulled()
	return FALSE
