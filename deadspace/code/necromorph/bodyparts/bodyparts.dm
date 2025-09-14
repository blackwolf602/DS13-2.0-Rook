/obj/item/bodypart/chest/necromorph
	name = BODY_ZONE_CHEST
	bodytype = BODYTYPE_NECROMORPH|BODYTYPE_ORGANIC
	limb_id = SPECIES_NECROMORPH
	should_draw_greyscale = FALSE
	bodypart_flags = (BP_NO_PAIN | BP_HAS_BLOOD | BP_CAN_BE_DISLOCATED)
	icon_static = 'deadspace/icons/necromorphs/base_necromorph.dmi'
	icon_state = "chest"
	w_class = WEIGHT_CLASS_GIGANTIC //So you can't put them in bags
	icon_dmg_overlay = null
	icon_bloodycover = null
	max_damage = 200
	is_dimorphic = FALSE
	px_x = 0
	px_y = 0
	grind_results = null
	wound_resistance = 10
	acceptable_bodytype = BODYTYPE_NECROMORPH
	can_be_disabled = FALSE

/obj/item/bodypart/head/necromorph
	name = BODY_ZONE_HEAD
	bodytype = BODYTYPE_NECROMORPH|BODYTYPE_ORGANIC
	limb_id = SPECIES_NECROMORPH
	should_draw_greyscale = FALSE
	bodypart_flags = (BP_NO_PAIN | BP_HAS_BLOOD | BP_CAN_BE_DISLOCATED)
	icon_static = 'deadspace/icons/necromorphs/base_necromorph.dmi'
	icon_state = "head"
	w_class = WEIGHT_CLASS_GIGANTIC
	icon_dmg_overlay = null
	icon_bloodycover = null
	max_damage = 200
	px_x = 0
	px_y = -8
	wound_resistance = 5
	is_dimorphic = FALSE
	can_be_disabled = FALSE
	show_organs_on_examine = TRUE

/obj/item/bodypart/head/necromorph/attempt_dismemberment(brute as num, burn as num, sharpness)
	if((sharpness & SHARP_EDGED) && (brute_dam + brute) >= max_damage * DROPLIMB_THRESHOLD_EDGE)
		return dismember(DROPLIMB_EDGE, FALSE, FALSE)

	else if((burn_dam + burn) >= max_damage * DROPLIMB_THRESHOLD_DESTROY)
		return dismember(DROPLIMB_BURN, FALSE, FALSE)

	else if((brute_dam + brute) >= max_damage * DROPLIMB_THRESHOLD_DESTROY)
		return dismember(DROPLIMB_BLUNT, FALSE, FALSE)

	else if((brute_dam + brute) >= max_damage * DROPLIMB_THRESHOLD_TEAROFF)
		return dismember(DROPLIMB_EDGE, FALSE, FALSE)

/obj/item/bodypart/arm/left/necromorph
	name = "left arm"
	bodytype = BODYTYPE_NECROMORPH|BODYTYPE_ORGANIC
	limb_id = SPECIES_NECROMORPH
	should_draw_greyscale = FALSE
	bodypart_flags = (BP_NO_PAIN | BP_IS_GRABBY_LIMB | BP_HAS_BLOOD | BP_CAN_BE_DISLOCATED)
	icon_static = 'deadspace/icons/necromorphs/base_necromorph.dmi'
	icon_state = "l_arm"
	w_class = WEIGHT_CLASS_GIGANTIC
	icon_dmg_overlay = null
	icon_bloodycover = null
	attack_verb_continuous = list("slaps", "punches")
	attack_verb_simple = list("slap", "punch")
	max_damage = 50
	px_x = -6
	px_y = 0
	can_be_disabled = FALSE
	wound_resistance = 0

/obj/item/bodypart/arm/left/necromorph/attempt_dismemberment(brute as num, burn as num, sharpness)
	if((sharpness & SHARP_EDGED) && (brute_dam + brute) >= max_damage * DROPLIMB_THRESHOLD_EDGE)
		return dismember(DROPLIMB_EDGE, FALSE, FALSE)

	else if((burn_dam + burn) >= max_damage * DROPLIMB_THRESHOLD_DESTROY)
		return dismember(DROPLIMB_BURN, FALSE, FALSE)

	else if((brute_dam + brute) >= max_damage * DROPLIMB_THRESHOLD_DESTROY)
		return dismember(DROPLIMB_BLUNT, FALSE, FALSE)

	else if((brute_dam + brute) >= max_damage * DROPLIMB_THRESHOLD_TEAROFF)
		return dismember(DROPLIMB_EDGE, FALSE, FALSE)

/obj/item/bodypart/arm/right/necromorph
	name = "right arm"
	bodytype = BODYTYPE_NECROMORPH|BODYTYPE_ORGANIC
	limb_id = SPECIES_NECROMORPH
	should_draw_greyscale = FALSE
	bodypart_flags = (BP_NO_PAIN | BP_IS_GRABBY_LIMB | BP_HAS_BLOOD | BP_CAN_BE_DISLOCATED)
	icon_static = 'deadspace/icons/necromorphs/base_necromorph.dmi'
	icon_state = "r_arm"
	w_class = WEIGHT_CLASS_GIGANTIC
	icon_dmg_overlay = null
	icon_bloodycover = null
	attack_verb_continuous = list("slaps", "punches")
	attack_verb_simple = list("slap", "punch")
	max_damage = 50
	px_x = 6
	px_y = 0
	can_be_disabled = FALSE
	wound_resistance = 0

/obj/item/bodypart/arm/right/necromorph/attempt_dismemberment(brute as num, burn as num, sharpness)
	if((sharpness & SHARP_EDGED) && (brute_dam + brute) >= max_damage * DROPLIMB_THRESHOLD_EDGE)
		return dismember(DROPLIMB_EDGE, FALSE, FALSE)

	else if((burn_dam + burn) >= max_damage * DROPLIMB_THRESHOLD_DESTROY)
		return dismember(DROPLIMB_BURN, FALSE, FALSE)

	else if((brute_dam + brute) >= max_damage * DROPLIMB_THRESHOLD_DESTROY)
		return dismember(DROPLIMB_BLUNT, FALSE, FALSE)

	else if((brute_dam + brute) >= max_damage * DROPLIMB_THRESHOLD_TEAROFF)
		return dismember(DROPLIMB_EDGE, FALSE, FALSE)

/obj/item/bodypart/leg/left/necromorph
	name = "left leg"
	bodytype = BODYTYPE_NECROMORPH|BODYTYPE_ORGANIC
	limb_id = SPECIES_NECROMORPH
	should_draw_greyscale = FALSE
	bodypart_flags = (BP_IS_MOVEMENT_LIMB | BP_NO_PAIN | BP_HAS_BLOOD | BP_CAN_BE_DISLOCATED)
	icon_static = 'deadspace/icons/necromorphs/base_necromorph.dmi'
	icon_state = "l_leg"
	w_class = WEIGHT_CLASS_GIGANTIC
	icon_dmg_overlay = null
	icon_bloodycover = null
	attack_verb_continuous = list("kicks", "stomps")
	attack_verb_simple = list("kick", "stomp")
	max_damage = 50
	px_x = -2
	px_y = 12
	can_be_disabled = FALSE
	wound_resistance = 0

/obj/item/bodypart/leg/left/necromorph/attempt_dismemberment(brute as num, burn as num, sharpness)
	if((sharpness & SHARP_EDGED) && (brute_dam + brute) >= max_damage * DROPLIMB_THRESHOLD_EDGE)
		return dismember(DROPLIMB_EDGE, FALSE, FALSE)

	else if((burn_dam + burn) >= max_damage * DROPLIMB_THRESHOLD_DESTROY)
		return dismember(DROPLIMB_BURN, FALSE, FALSE)

	else if((brute_dam + brute) >= max_damage * DROPLIMB_THRESHOLD_DESTROY)
		return dismember(DROPLIMB_BLUNT, FALSE, FALSE)

	else if((brute_dam + brute) >= max_damage * DROPLIMB_THRESHOLD_TEAROFF)
		return dismember(DROPLIMB_EDGE, FALSE, FALSE)

/obj/item/bodypart/leg/right/necromorph
	name = "right leg"
	bodytype = BODYTYPE_NECROMORPH|BODYTYPE_ORGANIC
	limb_id = SPECIES_NECROMORPH
	should_draw_greyscale = FALSE
	bodypart_flags = (BP_IS_MOVEMENT_LIMB | BP_NO_PAIN | BP_HAS_BLOOD | BP_CAN_BE_DISLOCATED)
	icon_static = 'deadspace/icons/necromorphs/base_necromorph.dmi'
	icon_state = "r_leg"
	w_class = WEIGHT_CLASS_GIGANTIC
	icon_dmg_overlay = null
	icon_bloodycover = null
	attack_verb_continuous = list("kicks", "stomps")
	attack_verb_simple = list("kick", "stomp")
	max_damage = 50
	px_x = 2
	px_y = 12
	can_be_disabled = FALSE
	wound_resistance = 0

/obj/item/bodypart/leg/right/necromorph/attempt_dismemberment(brute as num, burn as num, sharpness)
	if((sharpness & SHARP_EDGED) && (brute_dam + brute) >= max_damage * DROPLIMB_THRESHOLD_EDGE)
		return dismember(DROPLIMB_EDGE, FALSE, FALSE)

	else if((burn_dam + burn) >= max_damage * DROPLIMB_THRESHOLD_DESTROY)
		return dismember(DROPLIMB_BURN, FALSE, FALSE)

	else if((brute_dam + brute) >= max_damage * DROPLIMB_THRESHOLD_DESTROY)
		return dismember(DROPLIMB_BLUNT, FALSE, FALSE)

	else if((brute_dam + brute) >= max_damage * DROPLIMB_THRESHOLD_TEAROFF)
		return dismember(DROPLIMB_EDGE, FALSE, FALSE)

//This is a bunch of annoying code so the offsetted limbs don't cause problems when picked up
/obj/item/bodypart/chest/necromorph/update_icon_dropped(update_limb = TRUE)
	. = ..()
	pixel_x = 0
	pixel_y = 0

/obj/item/bodypart/head/necromorph/update_icon_dropped(update_limb = TRUE)
	. = ..()
	pixel_x = 0
	pixel_y = 0

/obj/item/bodypart/arm/left/necromorph/update_icon_dropped(update_limb = TRUE)
	. = ..()
	pixel_x = 0
	pixel_y = 0

/obj/item/bodypart/arm/right/necromorph/update_icon_dropped(update_limb = TRUE)
	. = ..()
	pixel_x = 0
	pixel_y = 0

/obj/item/bodypart/leg/left/necromorph/update_icon_dropped(update_limb = TRUE)
	. = ..()
	pixel_x = 0
	pixel_y = 0

/obj/item/bodypart/leg/right/necromorph/update_icon_dropped(update_limb = TRUE)
	. = ..()
	pixel_x = 0
	pixel_y = 0
