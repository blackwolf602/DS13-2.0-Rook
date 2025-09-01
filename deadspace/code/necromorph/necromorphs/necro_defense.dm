//The primary attack, which goes directly into attack_necromorph
/mob/living/carbon/human/necromorph/resolve_unarmed_attack(atom/attack_target, list/modifiers)
	attack_target.attack_necromorph(src, modifiers)


//The proc and backup rolled up in one.
/atom/proc/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers, dealt_damage)
	if(!uses_integrity || (!user.melee_damage_upper && !dealt_damage)) //No damage
		return FALSE
	dealt_damage = dealt_damage || rand(user.melee_damage_lower, user.melee_damage_upper)
	user.do_attack_animation(src, user.attack_effect)
	user.play_necro_sound(SOUND_ATTACK, VOLUME_MID, 1, 3)
	attack_generic(user, dealt_damage, BRUTE, SLASH, TRUE, user.armour_penetration)

/mob/living/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers, dealt_damage)
	dealt_damage = dealt_damage || rand(user.melee_damage_lower, user.melee_damage_upper)
	user.do_attack_animation(src, user.attack_effect)
	playsound(loc, 'sound/weapons/slash.ogg', 50, TRUE, -1)
	user.play_necro_sound(SOUND_ATTACK, VOLUME_MID, 1, 3)
	var/zone_attacked = ran_zone(user.zone_selected)
	var/attack_flag
	switch(rand(0,10))
		if(0 to 9)
			attack_flag = SLASH
		if(10)
			attack_flag = PUNCTURE

	var/armor_block = run_armor_check(zone_attacked, attack_flag)
	visible_message(span_danger("[user.name] [armor_flag_to_strike_string(attack_flag)] [src]!"), \
	span_userdanger("[user.name] [armor_flag_to_strike_string(attack_flag)] you!"), span_hear("You hear a [armor_flag_to_strike_string(attack_flag)] of the flesh!"), COMBAT_MESSAGE_RANGE, user)
	to_chat(user, span_danger("You [armor_flag_to_strike_string(attack_flag)] [src]!"))
	apply_damage(dealt_damage, BRUTE, zone_attacked, armor_block)
	log_combat(user, src, "attacked")

/mob/living/carbon/human/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers, dealt_damage)
	if(check_block(user, 0, "the [user.name]"))
		visible_message(span_danger("[user] tries to hit [src]!"), \
						span_danger("[user] tries to hit you!"), span_hear("You hear a swoosh!"), null, user)
		user.play_necro_sound(SOUND_ATTACK, VOLUME_MID, 1, 3)
		user.do_attack_animation(src, user.attack_effect)
		playsound(loc, 'sound/weapons/slashmiss.ogg', 50, TRUE, -1)
		return FALSE

	user.do_attack_animation(src, user.attack_effect)
	dealt_damage = prob(90) ? (dealt_damage || rand(user.melee_damage_lower, user.melee_damage_upper)) : 0
	if(!dealt_damage)
		playsound(loc, 'sound/weapons/slashmiss.ogg', 50, TRUE, -1)
		user.play_necro_sound(SOUND_ATTACK, VOLUME_MID, 1, 3)
		visible_message(span_danger("[user] lunges at [src]!"), \
		span_userdanger("[user] lunges at you!"), span_hear("You hear a swoosh!"), null, user)
		to_chat(user, span_danger("You lunge at [src]!"))
		return FALSE

	var/obj/item/bodypart/affecting = get_bodypart(ran_zone(user.zone_selected))
	if(!affecting) //If we can't find the body part we just default to attacking the chest
		affecting = get_bodypart(BODY_ZONE_CHEST)
	var/attack_flag
	switch(rand(0,10))
		if(0 to 9)
			attack_flag = SLASH
		if(10)
			attack_flag = PUNCTURE

	var/armor_block = run_armor_check(affecting, attack_flag)
	playsound(loc, 'sound/weapons/slice.ogg', 25, TRUE, -1)
	visible_message(span_danger("[user.name] [armor_flag_to_strike_string(attack_flag)] [src]!"), \
	span_userdanger("[user.name] [armor_flag_to_strike_string(attack_flag)] you!"), span_hear("You hear a [armor_flag_to_strike_string(attack_flag)] of the flesh!"), COMBAT_MESSAGE_RANGE, user)
	to_chat(user, span_danger("You [armor_flag_to_strike_string(attack_flag)] [src]!"))
	log_combat(user, src, "attacked")
	if(!dismembering_strike(user, user.zone_selected)) //Dismemberment successful
		return TRUE
	apply_damage(dealt_damage, BRUTE, affecting, armor_block)

//Turns out if you put a armor value on a mob all of that armor code actually doesn't check it, so we do all the magic here
/mob/living/carbon/human/necromorph/getarmor(def_zone, type)
	var/armor = returnArmor().getRating(type)

	return armor

/mob/living/carbon/human/necromorph/get_eye_protection()
	return ..() + 2

/mob/living/carbon/human/necromorph/get_ear_protection()
	return INFINITY

/mob/living/carbon/human/necromorph/hitby(atom/movable/AM, skipcatch, hitpush, blocked, datum/thrownthing/throwingdatum)
	skipcatch = TRUE
	.=..()

/mob/living/carbon/human/necromorph/adjustToxLoss(amount, updating_health = TRUE, forced = FALSE, cause_of_death = "Systemic organ failure")
	return FALSE

/mob/living/carbon/human/necromorph/setStaminaLoss(amount, updating_health = 1)
	return FALSE

/mob/living/carbon/human/necromorph/soundbang_act(intensity = 1, stun_pwr = 20, damage_pwr = 5, deafen_pwr = 15)
	return 0
