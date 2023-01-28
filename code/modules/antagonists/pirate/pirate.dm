/datum/antagonist/pirate
	id = ROLE_PIRATE
	display_name = "\improper Pirate"

	give_equipment()
		if (!ishuman(src.owner.current))
			boutput(src.owner.current, "<span class='alert'>Due to your lack of opposable thumbs, the pirates were unable to provide you with your equipment. That's biology for you.</span>")
			return FALSE
		var/mob/living/carbon/human/H = src.owner.current
		var/obj/trinket
		if (H.trinket)
			trinket = H.trinket.deref()
			trinket.set_loc(null)
		H.unequip_all(TRUE)

		H.equip_if_possible(new /obj/item/storage/backpack(H), H.slot_back)

		if (id == ROLE_PIRATE_CAPTAIN)
			H.equip_if_possible(new /obj/item/clothing/under/shirt_pants_b(H), H.slot_w_uniform)
			H.equip_if_possible(new /obj/item/clothing/suit/armor/pirate_captain_coat(H), H.slot_wear_suit)
			H.equip_if_possible(new /obj/item/clothing/head/pirate_captain(H), H.slot_head)
			H.equip_if_possible(new /obj/item/clothing/shoes/swat/heavy(H), H.slot_shoes)
			H.equip_if_possible(new /obj/item/device/radio/headset/pirate/captain(H), H.slot_ears)
			H.equip_if_possible(new /obj/item/pinpointer/gold_bee(H), H.slot_in_backpack)

		else if (id == ROLE_PIRATE_FIRST_MATE)
			H.equip_if_possible(new /obj/item/clothing/under/gimmick/guybrush(H), H.slot_w_uniform)
			H.equip_if_possible(new /obj/item/clothing/suit/armor/pirate_first_mate_coat(H), H.slot_wear_suit)
			H.equip_if_possible(new /obj/item/clothing/head/pirate_first_mate(H), H.slot_head)
			H.equip_if_possible(new /obj/item/device/radio/headset/pirate/first_mate(H), H.slot_ears)

		else if (id == ROLE_PIRATE)
			// Random clothing:
			var/obj/item/clothing/jumpsuit = pick(/obj/item/clothing/under/gimmick/waldo,
							/obj/item/clothing/under/misc/serpico,
							/obj/item/clothing/under/gimmick/guybrush,
							/obj/item/clothing/under/misc/dirty_vest)
			var/obj/item/clothing/hat = pick(/obj/item/clothing/head/red,
							/obj/item/clothing/head/bandana/red,
							/obj/item/clothing/head/pirate_brn,
							/obj/item/clothing/head/pirate_blk)

			H.equip_if_possible(new jumpsuit, H.slot_w_uniform)
			H.equip_if_possible(new hat, H.slot_head)
			H.equip_if_possible(new /obj/item/device/radio/headset/pirate(H), H.slot_ears)

		H.equip_if_possible(new /obj/item/clothing/shoes/swat(H), H.slot_shoes)
		H.equip_if_possible(new /obj/item/reagent_containers/food/drinks/flask/pirate(H), H.slot_in_backpack)
		H.equip_if_possible(new /obj/item/clothing/glasses/eyepatch/pirate(H), H.slot_glasses)
		H.equip_if_possible(new /obj/item/requisition_token/pirate(H), H.slot_r_store)
		H.equip_if_possible(new /obj/item/tank/emergency_oxygen/extended(H), H.slot_l_store)
		H.equip_if_possible(new /obj/item/swords_sheaths/pirate(H), H.slot_belt)

		H.equip_sensory_items()

		H.traitHolder.addTrait("training_drinker")

	// assign_objectives()

	// do_popup(override)
	// 	if (pirate_captain)
	// 		override = "pirate_captain"
	// 	else if (pirate_first_mate)
	// 		override = "pirate_first_mate"
	// 	..(override)

	// handle_round_end(log_data)


	first_mate
		id = ROLE_PIRATE_FIRST_MATE
		display_name = "\improper Pirate First Mate"

	captain
		id = ROLE_PIRATE_CAPTAIN
		display_name = "\improper Pirate Captain"
