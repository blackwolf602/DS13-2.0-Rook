/**
DS SCL Shotgun
*/

/obj/item/gun/ballistic/shotgun/scl_shotgun //Has no bola mode yet
	name = "\improper SCL Shotgun"
	desc = "The SCL Shotgun is a close to medium-ranged weapon developed by the Sovereign Colonies Armed Forces and utilized by SCAF Legionaries. \
	The shotgun has remained in use in private security and police departments as a riot-control tool, given its ability to fire incapacitating shells for capture and arrest, or lethal slugs in life-threatening situations. \
	The SCL Shotgun is magazine loaded and is effective at short range or for fugitive capture."
	icon = 'deadspace/icons/obj/weapons/ds13guns48x32.dmi'
	icon_state = "scl_shotgun"
	icon_state_wielded = null
	lefthand_file = 'deadspace/icons/mob/onmob/items/lefthand_guns.dmi'
	righthand_file = 'deadspace/icons/mob/onmob/items/righthand_guns.dmi'
	worn_icon = 'deadspace/icons/mob/onmob/back.dmi'
	worn_icon_state = "scl_shotgun"
	inhand_icon_state = null
	inhand_x_dimension = 32
	inhand_y_dimension = 32
	gun_flags = NO_AKIMBO
	mag_type = /obj/item/ammo_box/magazine/ds12g
	can_suppress = FALSE
	fire_delay = 10
	fire_sound = 'sound/weapons/gun/shotgun/shot_alt.ogg'
	unwielded_spread_bonus = 40
	unwielded_recoil = 5
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_SUITSTORE
	empty_alarm = TRUE
	mag_display = TRUE
	semi_auto = TRUE
	internal_magazine = FALSE
	//alt fire stuff
	var/obj/item/gun/ballistic/revolver/grenadelauncher/scl_bola/underbarrel

/obj/item/gun/ballistic/revolver/grenadelauncher/scl_bola
	desc = "A break-operated bola launcher for the SCL shotgun."
	name = "SCL underbarrel bola launcher"
	icon_state = "dshotgun_sawn" //You won't normally see this sprite, unless a admin manually spawns it in
	inhand_icon_state = "gun"
	fire_sound = 'sound/weapons/bolathrow.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/bola
	w_class = WEIGHT_CLASS_NORMAL
	bolt = /datum/gun_bolt/no_bolt

/obj/item/gun/ballistic/shotgun/scl_shotgun/Initialize(mapload)
	underbarrel = new /obj/item/gun/ballistic/revolver/grenadelauncher/scl_bola(src)
	return ..()

/obj/item/gun/ballistic/shotgun/scl_shotgun/Destroy()
	QDEL_NULL(underbarrel)
	return ..()

/obj/item/gun/ballistic/shotgun/scl_shotgun/update_icon_state()
	. = ..()
	icon_state = "[initial(icon_state)][wielded ? "_wielded" : ""]"
	inhand_icon_state = "[initial(icon_state)][wielded ? "_wielded" : ""][magazine? "_mag" : ""]"

/obj/item/gun/ballistic/shotgun/scl_shotgun/update_overlays()
	. = ..()
	. += "scl_shotgun[magazine ? "_mag" : ""]"

//TODO : Rework gun underbarrel to use the special attack code, rather then being a second gun in a gun
/*obj/item/gun/ballistic/shotgun/scl_shotgun/afterattack_secondary(atom/target, mob/living/user, flag, params)
	underbarrel.afterattack(target, user, flag, params)
	return SECONDARY_ATTACK_CONTINUE_CHAIN */

/obj/item/gun/ballistic/shotgun/scl_shotgun/attackby(obj/item/A, mob/user, params)
	if(isammocasing(A))
		if(istype(A, underbarrel.magazine.ammo_type))
			underbarrel.attack_self(user)
			underbarrel.attackby(A, user, params)
	else
		..()

/obj/item/gun/ballistic/shotgun/scl_shotgun/no_mag
	spawnwithmagazine = FALSE

/**
Magazines
*/

/obj/item/ammo_box/magazine/ds12g //pulse slug?
	name = "magazine SCL-shotgun buckshot"
	desc = "Magazine of 12 gauge shells."
	icon = 'deadspace/icons/obj/ammo.dmi'
	icon_state = "shotgun_magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	caliber = CALIBER_12GAUGE
	max_ammo = 7
	multiple_sprites = AMMO_BOX_ONE_SPRITE

/obj/item/ammo_box/magazine/internal/bola
	name = "magazine SCL-shotgun bola"
	ammo_type = /obj/item/ammo_casing/shotgun/bola
	caliber = CALIBER_12GAUGE_BOLA
	max_ammo = 4

/obj/item/ammo_box/magazine/ds12g/slug
	name = "magazine SCL-shotgun slug"
	ammo_type = /obj/item/ammo_casing/shotgun

/obj/item/ammo_box/magazine/ds12g/executioner //admin only, can dismember limbs
	name = "magazine SCL-shotgun executioner"
	ammo_type = /obj/item/ammo_casing/shotgun/executioner

/obj/item/ammo_box/magazine/ds12g/pulverizer //admin only, can crush bones
	name = "magazine SCL-shotgun pulverizer"
	ammo_type = /obj/item/ammo_casing/shotgun/pulverizer

/obj/item/ammo_box/magazine/ds12g/beanbag
	name = "magazine SCL-shotgun beanbag"
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag

/obj/item/ammo_box/magazine/ds12g/incendiary
	name = "magazine SCL-shotgun incendiary"
	ammo_type = /obj/item/ammo_casing/shotgun/incendiary

/obj/item/ammo_box/magazine/ds12g/dragonsbreath
	name = "magazine SCL-shotgun dragonsbreath"
	ammo_type = /obj/item/ammo_casing/shotgun/dragonsbreath

/obj/item/ammo_box/magazine/ds12g/stunslug
	name = "magazine SCL-shotgun stunslug"
	ammo_type = /obj/item/ammo_casing/shotgun/stunslug

/obj/item/ammo_box/magazine/ds12g/pulseslug
	name = "magazine SCL-shotgun pulseslug"
	ammo_type = /obj/item/ammo_casing/shotgun/pulseslug

/obj/item/ammo_box/magazine/ds12g/meteorslug
	name = "magazine SCL-shotgun meteorslug"
	ammo_type = /obj/item/ammo_casing/shotgun/meteorslug

/obj/item/ammo_box/magazine/ds12g/frag12
	name = "magazine SCL-shotgun frag12"
	ammo_type = /obj/item/ammo_casing/shotgun/frag12

/obj/item/ammo_box/magazine/ds12g/rb
	name = "magazine SCL-shotgun rubbershot"
	desc = "Magazine of rubbershot."
	ammo_type = /obj/item/ammo_casing/shotgun/rubbershot

/obj/item/ammo_box/magazine/ds12g/incapacitate
	name = "magazine SCL-shotgun incapacitate"
	ammo_type = /obj/item/ammo_casing/shotgun/incapacitate

/obj/item/ammo_box/magazine/ds12g/improvised
	name = "magazine SCL-shotgun improvised"
	ammo_type = /obj/item/ammo_casing/shotgun/improvised

/obj/item/ammo_box/magazine/ds12g/dart
	name = "magazine SCL-shotgun dart"
	ammo_type = /obj/item/ammo_casing/shotgun/dart

/obj/item/ammo_box/magazine/ds12g/bioterror
	name = "magazine SCL-shotgun bioterror"
	ammo_type = /obj/item/ammo_casing/shotgun/dart/bioterror

//Can add in special ammo types in future is desired. BOLA, NECROTOXINS

/**
Ammo casings for the mags
*/

/obj/item/ammo_casing/shotgun/bola
	name = "bola shell"
	desc = "A shotgun casing that is somehow filled with a tightly packed bola, that expands once it leaves the barrel."
	icon_state = "stunshell"
	fire_sound = 'sound/weapons/bolathrow.ogg'
	caliber = CALIBER_12GAUGE_BOLA
	projectile_type = /obj/projectile/bullet/shotgun_bola
	affected_dynamic_lights = null //For some unknown reason this ammo glows?

/**
Projectiles for the ammo casings
*/

/obj/projectile/bullet/shotgun_bola //WIP
	name = "bola"
	icon = 'deadspace/icons/obj/projectiles.dmi'
	icon_state = "bola"
	damage = 1
	stamina = 60
	embedding = null
	sharpness = NONE
	speed = 0.6
	ricochets_max = 2
	ricochet_chance = 80
	ricochet_auto_aim_range = 1
	light_system = NO_LIGHT_SUPPORT

//Will do later
/obj/projectile/bullet/shotgun_bola/on_hit(atom/target, blocked = FALSE)
	. = ..()
	var/obj/item/restraints/legcuffs/bola/L = new (get_turf(src))
	if(ishuman(target))
		L.ensnare(target)

/**
Projectiles effects
*/

/obj/effect/projectile/shotgun
	name = "impact"
	icon = 'deadspace/icons/obj/weapons/projectiles_effects.dmi'
	icon_state = "shotgun_hit"
